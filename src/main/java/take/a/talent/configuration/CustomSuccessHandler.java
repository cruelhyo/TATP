package take.a.talent.configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler 
{
	//화면이동에 대한 규칙을 정의하기 위해 DefaultRedirectStrategy 객체 생성
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	//determineTargetUrl 매서드를 이용하여 url을 가져오고 커밋여부를 판별한후 리다이렉트 시키는 매서드
	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException
	{
		String targetUrl = determineTargetUrl(authentication);
		
		if (response.isCommitted()) 
		{
			System.out.println("Can't redirect");
			return;
		}
		
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
	
	//부여받은 권한을 가져와서 isUser, isAdmin 매서드를 이용해 url를 담은후 리턴하는 매서드
	protected String determineTargetUrl(Authentication authentication)
	{
		String url = "";
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		List<String> roles = new ArrayList<String>();
		
		for (GrantedAuthority a : authorities)
		{
			roles.add(a.getAuthority());
		}
		
		if(isAdmin(roles))
		{
			url = "/admin";
		}
		else if(isUser(roles))
		{
			url = "/home";
		}
		else
		{
			url = "/Access_Dinied";
		}
		
		return url;
	}
	
	//부여받은 권한이 맞는지의 여부를 판별하는 매서드
	private boolean isUser(List<String> roles)
	{
		if(roles.contains("ROLE_USER"))
		{
			return true;
		}
		return false;
	}
	
	private boolean isAdmin(List<String> roles)
	{
		if(roles.contains("ROLE_ADMIN"))
		{
			return true;
		}
		return false;
	}
	
	
	//RedirectStrategy 겟팅,세팅하는 매서드
	public void setRedirectStrategy(RedirectStrategy redirectStrategy)
	{
		this.redirectStrategy = redirectStrategy;
	}
	
	protected RedirectStrategy getRedirectStrategy()
	{
		return redirectStrategy;
	}
	

}

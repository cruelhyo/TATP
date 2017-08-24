package take.a.talent.member.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler
{
	// 화면이동에 대한 규칙을 정의하기 위해 DefaultRedirectStrategy 객체 생성
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandler.class);

	// determineTargetUrl 매서드를 이용하여 url을 가져오고 커밋여부를 판별한후 리다이렉트 시키는 매서드
	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException
	{
		logger.info("CustomSuccessHandler 호출");

		String targetUrl = determineTargetUrl(authentication);

		if (response.isCommitted())
		{
			System.out.println("Can't redirect");
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	// 부여받은 권한을 가져와서 isUser, isAdmin 매서드를 이용해 url를 담은후 리턴하는 매서드
	protected String determineTargetUrl(Authentication authentication)
	{
		String url = "";

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority a : authorities)
		{
			roles.add(a.getAuthority());
		}

		if (isAdmin(roles))
		{
			url = "/adminlogin";
		}
		else if (isStudent(roles))
		{
			url = "/userlogin";
			
		}else if (isTeacher(roles))
		{
			url = "/teacherlogin";
		}
		
		else
		{
			url = "/Access_Dinied";
		}

		return url;
	}

	// 부여받은 권한이 맞는지의 여부를 판별하는 매서드
	private boolean isTeacher(List<String> roles)
	{
		if (roles.contains("ROLE_TEACHER")) //TAEHCER 권한여부 추가 
		{
			return true;
		}
		return false;
	}
	
	private boolean isStudent(List<String> roles)
	{
		if (roles.contains("ROLE_REGULAR_MEM") || roles.contains("ROLE_ASSOCIATE_MEM"))
		{
			return true;
		}
		return false;
	}

	private boolean isAdmin(List<String> roles)
	{
		if (roles.contains("ROLE_SYSTEM_ADMIN") || roles.contains("ROLE_OPERATION_ADMIN"))
		{
			return true;
		}
		return false;
	}
	
	

	// RedirectStrategy 겟팅,세팅하는 매서드
	public void setRedirectStrategy(RedirectStrategy redirectStrategy)
	{
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy()
	{
		return redirectStrategy;
	}

}

package take.a.talent.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter 
{
	@Autowired
	CustomSuccessHandler customSuccessHandler;
	
	//사용자의 아이디 비밀번호 권한을 설정
	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception
	{
		auth.inMemoryAuthentication().withUser("bill").password("abc123").roles("USER");
		auth.inMemoryAuthentication().withUser("admin").password("admin123").roles("ADMIN");
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception 
	{
	    web.ignoring().antMatchers("/resources/**");
	}
	
	//리소스별 권한 설정과 핸들링 설정
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{
		http.authorizeRequests()
			.antMatchers("/").access("permitAll")
			.antMatchers("/mainform").access("permitAll")
			.antMatchers("/teammember").access("permitAll")
			.antMatchers("/userlogin").access("hasRole('USER') and hasRole('ADMIN')")
			.antMatchers("/admin/**").access("hasRole('ADMIN')")
			.antMatchers("/**").access("hasRole('USER')")
			.and()
			.formLogin().loginPage("/login").successHandler(customSuccessHandler)
			.usernameParameter("member_id").passwordParameter("member_pw")
			.and().csrf()
			.and().exceptionHandling().accessDeniedPage("/Access_Denied");
	}
	
}

package take.a.talent.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.member.service.UserAuthenticationService;
import take.a.talent.member.vo.MemberVo;

@Controller
public class MemberController
{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	UserAuthenticationService userAuthenticationService;
	
	@Autowired
    private MemberServiceInterface service;
	
	@RequestMapping(value = { "/anonymous/userjoin"}, method = RequestMethod.GET)
	public String join()
	{
		
		return "user/join";
	}
	
	//join에서 입력한 정보를가지고 service를 호출함. 
	@RequestMapping(value = { "/insertjoin"}, method = RequestMethod.GET)
	public String insertMember(MemberVo memberVo)
	{
		logger.info("insertjoin.");
		service.addMember(memberVo);
		
		return "user/join";
	}
	

	@RequestMapping(value = { "/userlogin", "/adminlogin", "/teacherlogin" }, method = RequestMethod.GET)
	public String homePage(ModelMap model)
	{
		model.addAttribute("user", userAuthenticationService.getUserName());
		return "layout/form";
	}

	@RequestMapping(value = "/member/studentPage", method = RequestMethod.GET)
	public String studentPage(ModelMap model)
	{
		model.addAttribute("user", userAuthenticationService.getUserName());
		return "user/studentPage";
	}

	@RequestMapping(value = "/teacher/teacherPage", method = RequestMethod.GET)
	public String teacherPage(ModelMap model)
	{
		model.addAttribute("user", userAuthenticationService.getUserName());
		return "user/teacherPage";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model)
	{
		model.addAttribute("user", userAuthenticationService.getUserName());
		return "user/admin";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model)
	{
		logger.info("accessDenied call");
		model.addAttribute("user", userAuthenticationService.getUserName());
		return "user/accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage()
	{
		return "user/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
		{
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	

}

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
	
	
	
	//join form에서 입력한 값들을 MemberController에서 memberVo타입으로 전달한다. 
	@RequestMapping(value ="/ajax/idCheck", method=RequestMethod.POST)
	public String idCheck(String memberId) {
		logger.info("id체크");
		logger.info("VO값 확인");
		logger.info("memberId"+memberId);
		service.idCheck(memberId);
		
		
		return "";
	}
	
	@RequestMapping(value = { "/ajax/pwCheck"}, method = RequestMethod.GET)
	public String pwCheck()
	{
		logger.info("PW체크");
		return "user/join";
	}
	
		
	
	
	@RequestMapping(value = { "/anonymous/userjoin"}, method = RequestMethod.GET)
	public String join()
	{
		return "user/join";
	}
	
	
	//join form에서 입력한 값들을 MemberController에서 memberVo타입으로 전달한다. 
	@RequestMapping(value ="/anonymous/insertjoin", method=RequestMethod.POST)
	public String insertjoin(MemberVo memberVo) {
		logger.info("join액션");
		logger.info("VO값 확인"+memberVo.toString());
		service.addMember(memberVo);
		
		
		return "redirect:/";
	}
	
	
	
	
	
	
	/*//join에서 입력한 정보를가지고 service를 호출함. 
	@RequestMapping(value = {"/anonymous/insertjoin"}, method = RequestMethod.GET)
	public String insertMember(MemberVo memberVo)
	{
		logger.info("insertMember service.addMember호출");
		
		return "redirect:/";
	}*/
	
	/*@RequestMapping(value="/" , method = {RequestMethod.GET, RequestMethod.POST})*/

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

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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public @ResponseBody boolean idCheck(String memberId, ModelMap model) {
		logger.info("id체크");
		logger.info("VO값 확인");
		logger.info("memberId"+memberId);
		boolean idExist = service.idCheck(memberId);
		model.addAttribute("idExist", idExist);
		
		return idExist;
	}
	

	@RequestMapping(value ="/teacher/teacherPage/updateMember", method=RequestMethod.POST)
	public String updateMember(MemberVo memberVo)
	{
		logger.info("updateMember");
		logger.info(memberVo.toString());
		int updateMemberResult = service.updateMember(memberVo);
		//model.addAttribute("updateMemberResult", updateMemberResult);
		return "redirect:/teacher/teacherPage?updateSuccess="+updateMemberResult;
	}
	
	@RequestMapping(value ="/ajax/teacherPage/selectForUpdateMember", method=RequestMethod.GET)
	public @ResponseBody ModelMap selectForUpdateMember(ModelMap model)
	{
		logger.info("selectForUpdateMember");
		MemberVo memberVo = service.selectForUpdateMember();
		model.addAttribute("memberVo", memberVo);
		return model;
	}

	
	@RequestMapping(value="/ajax/nickNameCheck",method=RequestMethod.POST)
	public @ResponseBody boolean nickNameCheck(String memberNickname, ModelMap model){
		logger.info("nickname체크");
		logger.info("nickname값 확인");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheck(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
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
/*	@RequestMapping(value ="/anonymous/insertjoin", method=RequestMethod.POST)
	public String insertjoin(MemberVo memberVo) {
		logger.info("join액션");
		logger.info("VO값 확인"+memberVo.toString());
		service.addMember(memberVo);
		
		
		return "redirect:/";
	}
	*/
	
	
	
	
	
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
	
	@RequestMapping(value = "/teacher/teacherPage", method = RequestMethod.POST)
	public String teacherPagep(ModelMap model)
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

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.member.service.UserAuthenticationService;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointVo;
import take.a.talent.member.vo.MemberVo;

@Controller
public class MemberController
{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	UserAuthenticationService userAuthenticationService;
	
	@Autowired
    private MemberServiceInterface service;

	@RequestMapping(value ="/teacher/teacherPage/updateMember", method=RequestMethod.POST)
	public String updateMember(MemberVo memberVo)
	{
		logger.info("updateMember");
		logger.info(memberVo.toString());
		int updateMemberResult = service.updateMember(memberVo);
		//model.addAttribute("updateMemberResult", updateMemberResult);
		return "redirect:/teacher/teacherPage?updateSuccess="+updateMemberResult;
	}
	
	//비밀번호 변경
	@RequestMapping(value ="/user/updatePassword", method=RequestMethod.POST)
	public String updatePassword(MemberVo memberVo)
	{
		logger.info("updateMember");
		logger.info(memberVo.toString());
		
		String updateResult = service.updatePassword(memberVo);
		
		return updateResult;
	}
	
	//계좌 업데이트
	@RequestMapping(value ="/teacher/teacherPage/updateAccount", method=RequestMethod.POST)
	public String updateTeacherAccount(MemberAccountVo memberAccountVo)
	{
		logger.info("updateTeacherAccount");
		logger.info(memberAccountVo.toString());
		int updateResult = service.updateTeacherAccount(memberAccountVo);
		
		return "redirect:/teacher/teacherPage?updateSuccess="+ updateResult;
	}
	
	//회원(강사) 계좌 insert
	@RequestMapping(value ="/teacher/teacherPage/insertAccount", method=RequestMethod.POST)
	public String accountMember(MemberAccountVo memberAccountVo)
	{
		logger.info("insertAccount");
		logger.info(memberAccountVo.toString());
		int insertAccountResult = service.insertAccount(memberAccountVo);
		return "redirect:/teacher/teacherPage?insertSuccess="+ insertAccountResult;
		
	}
	
	//point 충전
	@RequestMapping(value ="/user/insertPoint", method=RequestMethod.POST)
	public String pointCharge(MemberPointVo memberPointVo)
	{
		logger.info("insertPoint");
		logger.info(memberPointVo.toString());
		String pointUpdateResult = service.pointCharge(memberPointVo);
		return pointUpdateResult;
		
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
	
	@RequestMapping(value = { "/student/studentPage/updateMemberForStudent"}, method = RequestMethod.POST)
	public String updateMemberForStudent(MemberAndAddressVo memberAndAddressVo)
	{
		logger.info("updateMemberForStudent");
		logger.info(memberAndAddressVo.toString());
		int updateMemberForStudentResult = service.updateMemberForStudent(memberAndAddressVo);
		return "redirect:/member/studentPage?updateSuccess="+updateMemberForStudentResult;
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

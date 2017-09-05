package take.a.talent.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberVo;

@RestController
public class MemberRestController
{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
    private MemberServiceInterface service;
	
	@RequestMapping(value ="/ajax/teacherPage/selectForUpdateMember", method=RequestMethod.GET)
	public MemberVo selectForUpdateMember()
	{
		logger.info("selectForUpdateMember");
		MemberVo memberVo = service.selectForUpdateMember();
		return memberVo;
	}
	
	//join form에서 입력한 값들을 MemberController에서 memberVo타입으로 전달한다. 
	@RequestMapping(value ="/ajax/idCheck**", method=RequestMethod.POST)
	public boolean idCheck(@RequestBody String memberId, ModelMap model) {
		logger.info("id체크");
		logger.info("VO값 확인");
		logger.info("memberId"+memberId);
		boolean idExist = service.idCheck(memberId);
		model.addAttribute("idExist", idExist);
		
		return idExist;
	}
	
	@RequestMapping(value="/ajax/nickNameCheck", method=RequestMethod.POST)
	public boolean nickNameCheck(@RequestBody String memberNickname, ModelMap model){
		logger.info("nickname체크");
		logger.info("nickname값 확인");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheck(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
	}
	
	@RequestMapping(value="/ajax/nickNameCheckForUpdate", method=RequestMethod.POST)
	public boolean nickNameCheckForUpdate(@RequestBody String memberNickname, ModelMap model){
		logger.info("nickname체크");
		logger.info("nickname값 확인");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheckForUpdate(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
	}
	
	@RequestMapping(value="/ajax/selectForUpdateMemberForStudent", method=RequestMethod.GET)
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("selectForUpdateMemberForStudent");
		MemberAndAddressVo memberAndAddressVo = service.selectForUpdateMemberForStudent();
		logger.info(memberAndAddressVo.toString());
		return memberAndAddressVo;
	}

}

package take.a.talent.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberVo;

@RestController
public class MemberRestController
{
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
    private MemberServiceInterface service;
	
	//회원(강사) 업데이트시 셀렉트
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
	
	//닉네임 체크
	@RequestMapping(value="/ajax/nickNameCheck", method=RequestMethod.POST)
	public boolean nickNameCheck(@RequestBody String memberNickname, ModelMap model){
		logger.info("nickname체크");
		logger.info("nickname값 확인");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheck(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
	}
	
	//업데이트시 닉네임체크 현재 사용자가 쓰고 있는 닉네임도 사용가능으로 해야 한다
	@RequestMapping(value="/ajax/nickNameCheckForUpdate", method=RequestMethod.POST)
	public boolean nickNameCheckForUpdate(@RequestBody String memberNickname, ModelMap model){
		logger.info("nickname체크");
		logger.info("nickname값 확인");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheckForUpdate(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
	}
	
	//회원(학생) 업데이트시 셀렉트
	@RequestMapping(value="/ajax/selectForUpdateMemberForStudent", method=RequestMethod.GET)
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("selectForUpdateMemberForStudent");
		MemberAndAddressVo memberAndAddressVo = service.selectForUpdateMemberForStudent();
		logger.info(memberAndAddressVo.toString());
		return memberAndAddressVo;
	}
	
	//회원(강사) 주소 추가 insert
	@RequestMapping(value="/ajax/insertAddressForTeacher", method=RequestMethod.POST)
	public int insertAddressForTeacher(@RequestBody AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("insertAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		return service.insertAddressForTeacher(addressAndClassificationVo);
	}
	
	//회원(강사) 주소리스트 select
	@RequestMapping(value="/ajax/selectAddressListForTeacher", method=RequestMethod.GET)
	public Map<String, Object> selectAddressListForTeacher()
	{
		logger.info("selectAddressListForTeacher");
		Map<String, Object> addressListMap = service.selectAddressListForTeacher();
		logger.info(addressListMap.toString());
		return addressListMap;
	}
	
	//회원(강사) 주소 업데이트
	@RequestMapping(value="/ajax/updateAddressForTeacher", method=RequestMethod.POST)
	public int updateAddressForTeacher(@RequestBody AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("updateAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		return service.updateAddressForTeacher(addressAndClassificationVo);
	}
	
	//회원(강사) 주소 삭제
	@RequestMapping(value="/ajax/deleteAddressForTeacher", method=RequestMethod.POST)
	public int deleteAddressForTeacher(@RequestBody int addressNo)
	{
		logger.info("updateAddressForTeacher");
		
		return service.deleteAddressForTeacher(addressNo);
	}

	//맴버포인트 가지고 오기
	@RequestMapping(value="/ajax/selectMemberPoint", method=RequestMethod.GET)
	public int selectMemberPoint() 
	{
		logger.info("selectMemberPoint");
		int memberPoint = service.selectMemberPoint();
		logger.info(Integer.toString(memberPoint));
		return memberPoint;
	}
	
}

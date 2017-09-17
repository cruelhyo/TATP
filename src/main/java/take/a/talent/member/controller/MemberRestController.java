package take.a.talent.member.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.JoinMemberVo;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberVo;
import take.a.talent.member.vo.TeacherCareerVo;
import take.a.talent.member.vo.TeacherEducationVo;

@RestController
public class MemberRestController
{
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
    private MemberServiceInterface service;
	
	//join form에서 입력한 값들을 MemberController에서 memberVo타입으로 전달한다.  
		//serializeObject에 의해서 input태그 안의 입력값들이 자동으로 배열형식으로 넘어오므로, VO의 프로퍼티명과 input태그의 name을 똑같이 써야한다.
		@RequestMapping(value ="/ajax/insertMember**", method=RequestMethod.POST)
		public String insertjoin(@RequestBody JoinMemberVo joinMemberVo) {
			logger.info("join액션");
			logger.info("VO값 확인"+joinMemberVo.toString());
			
			service.addMember(joinMemberVo);
			
			
			return "redirect:/";
		}
	
	
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

	//현재 가지고 있는 포인트 select
	@RequestMapping(value="/ajax/selectMemberPoint", method=RequestMethod.GET)
	public int selectMemberPoint() 
	{
		logger.info("selectMemberPoint");
		int memberPoint = service.selectMemberPoint();
		logger.info(Integer.toString(memberPoint));
		return memberPoint;
	}
	
	//포인트 충전 내역 리스트 select
	@RequestMapping(value="/ajax/selectPointHistoryList", method=RequestMethod.GET)
	public Map<String, Object> selectPointHistoryList()
	{
		logger.info("selectPointHistoryList");
		Map<String, Object> pointListMap = service.selectPointHistoryList();
		logger.info(pointListMap.toString());
		
		return pointListMap;
	}
	
	//포인트 환전 내역 insert
	@RequestMapping(value="/ajax/insertPointExchangeHistory", method=RequestMethod.POST)
	public int insertPointExchangeHistory(@RequestBody MemberPointExchangeVo memberPointExchangeVo)
	{
		logger.info("insertPointExchangeHistory");
		logger.info(memberPointExchangeVo.toString());
		int result = service.insertPointExchangeHistory(memberPointExchangeVo);
		return result;
	}
	
	//최근한달 포인트 환전내역 select
	@RequestMapping(value="/ajax/selectPointExchangeList", method=RequestMethod.GET)
	public Map<String, Object> selectPointExchangeList()
	{
		logger.info("selectPointExchangeList 호출");
		logger.info("RestController 포인트 환전내역 select");
		
		//서비스 호출후 리턴 받은 맵 뷰에 리턴
		Map<String, Object> pointExchangeListMap = service.selectPointExchangeList();
		logger.info(pointExchangeListMap.toString());
		return pointExchangeListMap;
	}
	
	//회원(강사) 계좌 유무 확인
	@RequestMapping(value="/ajax/selectTeacherAccountNo", method=RequestMethod.GET)
	public MemberAccountVo selectTeacherAccountNo()
	{
		logger.info("selectTeacherAccountNo 호출");
		logger.info("RestController 회원(강사) 계좌 유무 확인");
		
		return service.selectTeacherAccountNo();
	}
	
	//비밀번호 체크
	@RequestMapping(value="/ajax/checkMemberPassword", method=RequestMethod.POST)
	public boolean checkMemberPassword(@RequestBody String pw)
	{
		logger.info("checkMemberPassword 호출");
		logger.info("RestController 비밀번호 체크");
		logger.info("pw : " + pw);
		
		boolean checkResult = service.checkMemberPassword(pw);
		
		return checkResult;
	}
	
	//학력, 경력 리스트 가져오기
	@RequestMapping(value="/ajax/selectTeacherEducationAndCareerList", method=RequestMethod.GET)
	public Map<String, Object> selectTeacherEducationAndCareerList()
	{
		logger.info("selectTeacherEducationAndCareerList 호출");
		
		//리스트 가져오는 서비스 호출 후 결과 리턴
		Map<String, Object> teacherCrEduListMap = service.selectTeacherEducationAndCareerList();
		logger.info("teacherCrEduListMap : " + teacherCrEduListMap.toString());
		
		return teacherCrEduListMap;
	}
	
	//학력 정보 insert
	@RequestMapping(value="/ajax/insertTeacherEducation", method=RequestMethod.POST)
	public int insertTeacherEducation(@RequestBody TeacherEducationVo teacherEducationVo)
	{
		logger.info("insertTeacherEducation 호출");
		logger.info("teacherEducationVo : " + teacherEducationVo.toString());
		
		return service.insertTeacherEducation(teacherEducationVo);
	}
	
	//경력 정보 insert
	@RequestMapping(value="/ajax/insertTeacherCareer", method=RequestMethod.POST)
	public int insertTeacherCareer(@RequestBody TeacherCareerVo teacherCareerVo)
	{
		logger.info("insertTeacherCareer 호출");
		logger.info("teacherEducationVo : " + teacherCareerVo.toString());
		
		return service.insertTeacherCareer(teacherCareerVo);
	}
	
	//학력 정보 update
	@RequestMapping(value="/ajax/updateTeacherEducation", method=RequestMethod.POST)
	public int updateTeacherEducation(@RequestBody TeacherEducationVo teacherEducationVo)
	{
		logger.info("updateTeacherEducation 호출");
		logger.info("teacherEducationVo : " + teacherEducationVo.toString());
		
		return service.updateTeacherEducation(teacherEducationVo);
	}
	
	//경력 정보 update
	@RequestMapping(value="/ajax/updateTeacherCareer", method=RequestMethod.POST)
	public int updateTeacherCareer(@RequestBody TeacherCareerVo teacherCareerVo)
	{
		logger.info("updateTeacherCareer 호출");
		logger.info("teacherEducationVo : " + teacherCareerVo.toString());
		
		return service.updateTeacherCareer(teacherCareerVo);
	}
	
	//학력 정보 삭제
	@RequestMapping(value="/ajax/deleteTeacherEducation", method=RequestMethod.POST)
	public int deleteTeacherEducation(@RequestBody int teacherEducationNo)
	{
		logger.info("deleteTeacherEducation");
		
		return service.deleteTeacherEducation(teacherEducationNo);
	}
}

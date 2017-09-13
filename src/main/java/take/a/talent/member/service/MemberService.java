package take.a.talent.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.JoinMemberVo;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;
import take.a.talent.member.vo.MemberVo;
import take.a.talent.member.vo.TeacherCareerVo;
import take.a.talent.member.vo.TeacherEducationVo;
import take.a.talent.member.vo.TeacherVo;


@Service // service�씪怨� 紐낆떆�빐以�
public class MemberService implements MemberServiceInterface{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	

	public int addMember(JoinMemberVo joinMemberVo){
		
		logger.info("addmember");
		logger.info(joinMemberVo.toString());
		return memberDao.insertMember(joinMemberVo);
	}

	//회원가입시 아이디 중복검사  
	@Override
	public boolean idCheck(String memberId)
	{
		boolean ck = memberDao.idCheck(memberId);
		
		logger.info("checkedId : " + ck);
		
		return ck;
	}
	
	//회원 업데이트 dao호출
	@Override
	public int updateMember(MemberVo memberVo)
	{
		int updateMemberResult = memberDao.updateMember(memberVo);
		
		return updateMemberResult;
		 
	}
	//회원 업데이트 시 셀텍트 dao호출
	@Override
	public MemberVo selectForUpdateMember()
	{
		logger.info("selectForUpdateMember");
		MemberVo selectForUpdateMemberResult = memberDao.selectForUpdateMember();
		logger.info(selectForUpdateMemberResult.toString());
		return selectForUpdateMemberResult;
	}
	
	//
	@Override
	public boolean nicknameCheck(String memberNickname) {
		
		boolean nck = memberDao.nicknameCheck(memberNickname);
		 
		logger.info("checkedNickname : " + nck);
			
		return nck;
	}
	
	@Override
	public boolean nicknameCheckForUpdate(String memberNickname) {
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		boolean nicknameCheckResult = memberDao.nicknameCheck(memberNickname);
		String nicknameCheckForUpdateResult = memberDao.nicknameCheckForUpdate(memberId);
		logger.info("nicknameCheckResult : " + nicknameCheckResult);
		logger.info("nicknameCheckForUpdateResult : " + nicknameCheckForUpdateResult);
		if(nicknameCheckResult) 
		{
			if(nicknameCheckForUpdateResult.equals(memberNickname)) 
			{
				return false;
			}
			return nicknameCheckResult;
		}
		return nicknameCheckResult;
	}
	
	//회원(학생) 업데이트
	@Override
	public int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo)
	{
		logger.info("updateMemberForStudent");
		logger.info(memberAndAddressVo.toString());
		
		return memberDao.updateMemberForStudent(memberAndAddressVo);
	}
	
	//회원(학생) 업데이트시 셀렉트
	@Override
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("selectForUpdateMemberForStudent");
		
		return memberDao.selectForUpdateMemberForStudent();
	}
	
	//회원(강사) 주소 insert
	public int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("selectForUpdateMemberForStudent");
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//폼에서 제대로 입력 안했을 때 0을 리턴
		int addressMailNumber = addressAndClassificationVo.getAddressMailNumber();
		String memberAddress = addressAndClassificationVo.getMemberAddress();
		if(addressMailNumber == 0 || memberAddress.equals(""))
		{
			return 0;
		}
		//회원 memberNo select vo객체에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		addressAndClassificationVo.setMemberNo(memberNo);
		
		return memberDao.insertAddressForTeacher(addressAndClassificationVo);
	}
	
	//포인트 충전하기
	public int pointCharge(MemberPointVo memberPointVo)
	{
		//MemberVo 객체를 생성한다
		MemberVo memberVo = new MemberVo();
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select한 후 각 vo에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		memberPointVo.setMemberNo(memberNo);
		
		//추가되는 포인트는 money의 1000분의 1이고 
		//memberVo에 추가되는 포인트는 현재 가지고 있는 포인트에 충전되는 포인트를 더한 값이다
		int money = memberPointVo.getPointChargeMoney();
		int memberPoint = memberDao.selectMemberPoint(memberNo);
		int point = money/1000;
		memberPointVo.setPointChargePoint(point);
		memberVo.setMemberPoint(memberPoint + point);
		
		//member에 update가 되지 않았다면 0을 리턴한다
		int memberPointUpdateResult = memberDao.updatePointForMember(memberVo);
		if(memberPointUpdateResult == 0) 
		{
			return 0;
		}
		
		//dao호출후 결과 리턴
		int pointUpdateResult = memberDao.insertPointCharge(memberPointVo);
		return pointUpdateResult;
		
	}
	
	//현재 가지고 있는 포인트를 가져온다
	public int selectMemberPoint()
	{
		//로그인 되어있는 회원 id가져와서 memberNo 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		int memberNo = memberDao.selectMemberNo(memberId);
		
		return memberDao.selectMemberPoint(memberNo);
	}
	
	
	//회원(강사) 주소리스트 select
	@Override
	public Map<String, Object> selectAddressListForTeacher()
	{
		logger.info("selectAddressListForTeacher");
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//회원 memberNo select 
		int memberNo = memberDao.selectMemberNo(memberId);
		Map<String, Object> addressListMap = new HashMap<String, Object>();
		addressListMap.put("addressList", memberDao.selectAddressListForTeacher(memberNo));
		return addressListMap;
	}
	
	//회원(강사) 주소 업데이트
	@Override
	public int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("updateAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		//폼에서 제대로 입력 안했을 때 0을 리턴
		int addressMailNumber = addressAndClassificationVo.getAddressMailNumber();
		String memberAddress = addressAndClassificationVo.getMemberAddress();
		if(addressMailNumber == 0 || memberAddress.equals(""))
		{
			return 0;
		}
		//업데이트 dao vo를 입력값으로 호출 후 리턴
		return memberDao.updateAddressForTeacher(addressAndClassificationVo);
	}

	//회원(강사) 계좌 insert
	@Override
	public int insertAccount(MemberAccountVo memberAccountVo) 
	{
		logger.info("insertAccount");
		logger.info(memberAccountVo.toString());
		
		//로그인 되어있는 회원 id가져와서 memberNo 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//dao호출후 리턴 받은 값이 0일때 0을 리턴
		memberDao.insertAccount(memberAccountVo);
		int teacherAccountNo = memberAccountVo.getTeacherAccountNo();
		if(teacherAccountNo == 0) 
		{
			return 0;
		}
		//객체 생성후 dao호출후 리턴 받은 값들을 세팅
		TeacherVo teacherVo = new TeacherVo();
		teacherVo.setTeacherAccountNo(teacherAccountNo);
		teacherVo.setMemberNo(memberNo);
		
		//세팅된 vo객체로 dao호출후 리턴 값이 0이면 0을 리턴
		int updateResult = memberDao.updateTeacherWhenInsertAccount(teacherVo);
		if(updateResult == 0) 
		{
			return 0;
		}
		return 1;
	}
	
	//회원(강사) 주소 삭제
	@Override
	public int deleteAddressForTeacher(int addressNo)
	{
		logger.info("deleteAddressForTeacher");
		
		return memberDao.deleteAddressForTeacher(addressNo);
	}
	
	//포인트 충전 내역 가져오기
	public Map<String, Object> selectPointHistoryList()
	{
		logger.info("selectPointHistoryList");
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//dao호출후 리턴된 list 맵핑
		Map<String, Object> pointListMap = new HashMap<String, Object>();
		pointListMap.put("pointList", memberDao.selectPointHistoryList(memberNo));
		
		return pointListMap;
	}
	
	//포인트 환전 내역 insert
	public int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo)
	{
		logger.info("insertPointExchangeHistory");
		logger.info(memberPointExchangeVo.toString());
		
		if(memberPointExchangeVo.getPointExchangePoint() == 0) 
		{
			return 0;
		}
		//새로운 객체 생성
		MemberVo memberVo = new MemberVo();
		
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select해서 각 vo에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		memberPointExchangeVo.setMemberNo(memberNo);
		
		//memberPointExchangeVo에서 포인트를 가져와 exchangeMoney의 값을 지정해주고 세팅한다
		int pointExchangePoint = memberPointExchangeVo.getPointExchangePoint();
		int exchangeMoney = pointExchangePoint * 700;
		memberPointExchangeVo.setPointExchangeMoney(exchangeMoney);
		//현재 가지고 있는 포인트를 가져온다
		int memberPonit = memberDao.selectMemberPoint(memberNo);
		
		//현재 포인트가 환전할 포인트보다 크거나 같을때
		if(memberPonit >= pointExchangePoint) {
			//가지고 있는 포인트에서 환전할 포인트를 뺀후 세팅해준다
			memberPonit = memberPonit - pointExchangePoint;
			memberVo.setMemberPoint(memberPonit);
			
			//member update dao를 호출후 0이 리턴 되면 0을 리턴한다
			int memberPointUpdateResult = memberDao.updatePointForMember(memberVo);
			if(memberPointUpdateResult == 0) 
			{
				return 0;
			}
			
			//dao호출후 결과 값 리턴
			return memberDao.insertPointExchangeHistory(memberPointExchangeVo);
		}
		return 0;
	}
	
	//최근한달 포인트 환전내역 select
	@Override
	public Map<String, Object> selectPointExchangeList()
	{
		logger.info("selectPointExchangeList 호출");
		logger.info("Service 포인트 환전 내역 select");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//pointExchangeListMap 객체 생성 후 memberNo를 입력값으로  dao 호출후 리턴 받은 list 맵핑
		Map<String, Object> pointExchangeListMap = new HashMap<String, Object>();
		pointExchangeListMap.put("pointExchangeList", memberDao.selectPointExchangeList(memberNo));
		
		return pointExchangeListMap;
	}
	
	//회원(강사) 계좌 유무 확인과 업데이트시 select
	@Override
	public MemberAccountVo selectTeacherAccountNo()
	{
		logger.info("selectTeacherAccountNo 호출");
		logger.info("회원(강사) 계좌 유무 확인");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//가져온 memberNo로 dao호출후 리턴 값 if문으로 분기
		int teacherAccountNo = memberDao.selectTeacherAccountNo(memberNo);
		if(teacherAccountNo == 0)
		{
			return null;
		}
		return memberDao.selectTeacherAccountForUpdate(teacherAccountNo);
	}
	
	//계좌 업데이트
	@Override
	public int updateTeacherAccount(MemberAccountVo memberAccountVo)
	{
		logger.info("selectTeacherAccountNo 호출");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//가져온 memberNo로 teacherAccountNo 가져와서 vo에 세팅
		int teacherAccountNo = memberDao.selectTeacherAccountNo(memberNo);
		//만약에 0이면 리턴 0
		if(teacherAccountNo == 0) {
			return 0;
		}
		memberAccountVo.setTeacherAccountNo(teacherAccountNo);
		
		return memberDao.updateTeacherAccount(memberAccountVo);
		
	}
	
	//비밀번호 체크
	@Override
	public boolean checkMemberPassword(String pw)
	{
		logger.info("checkMemberPassword 호출");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//가져온 memberNo로 인코딩된 비밀번호 가져오기
		String memberPassword = memberDao.selectMemberPassword(memberNo);
		
		//인코딩된 비밀번호와 입력받은 비밀번호를 matches매서드로 비교
		boolean checkResult = bcryptPasswordEncoder.matches(pw, memberPassword);
		logger.info(Boolean.toString(checkResult));
		
		return checkResult;
	}
	
	//비밀번호 변경
	@Override
	public int updatePassword(MemberVo memberVo)
	{
		logger.info("updatePassword 호출");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져와서 vo에 세팅하기
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		
		//비밀번호를 인코딩해서 다시 세팅하기
		String memberPassword = memberVo.getMemberPassword();
		memberPassword = bcryptPasswordEncoder.encode(memberPassword);
		memberVo.setMemberPassword(memberPassword);
		logger.info("memberVo : " + memberVo.toString());
		
		int updateResult = memberDao.updatePassword(memberVo);
		logger.info("updateResult : " + Integer.toString(updateResult));
		
		return updateResult;
	}
	
	//학력, 경력 리스트 가져오기
	public Map<String, Object> selectTeacherEducationAndCareerList()
	{
		logger.info("selectTeacherEducationAndCareerList 호출");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져와서 teacher_no가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		int teacherNo = memberDao.selectTeacherNo(memberNo);
		
		//각 리스트 가져오는 dao호출
		List<TeacherCareerVo> teacherCrList = memberDao.selectTeacherCareerList(teacherNo);
		List<TeacherEducationVo> teacherEduList = memberDao.selectTeacherEducationList(teacherNo);
		
		//Map 객체를 생성하고 그 객체에 각 리스트를 맵핑한다
		Map<String, Object> teacherCrEduListMap = new HashMap<String, Object>();
		teacherCrEduListMap.put("teacherCrList", teacherCrList);
		teacherCrEduListMap.put("teacherEduList", teacherEduList);
		
		return teacherCrEduListMap;	
	}
	
	//학력 정보 insert
	@Override
	public int insertTeacherEducation(TeacherEducationVo teacherEducationVo)
	{
		logger.info("insertTeacherEducation 호출");
		
		//입력을 재데로 안했을시 0을 리턴
		String admission =  teacherEducationVo.getTeacherEducationAdmission();
		int classificationNo = teacherEducationVo.getTeacherEducationClassificationNo();
		String graduation = teacherEducationVo.getTeacherEducationGraduation();
		String major = teacherEducationVo.getTeacherEducationMajor();
		String schoolName = teacherEducationVo.getTeacherEducationSchoolName();
		int statusNo = teacherEducationVo.getTeacherEducationStatusNo();
		if(admission == "" || classificationNo == 0 || graduation == "" || major == "" || schoolName == "" || statusNo == 0)
		{
			return 0;
		}
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져와서 teacher_no가져와서 vo에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		int teacherNo = memberDao.selectTeacherNo(memberNo);
		teacherEducationVo.setTeacherNo(teacherNo);
		logger.info("teacherEducationVo : " + teacherEducationVo.toString());
		
		int insertResult = memberDao.insertTeacherEducation(teacherEducationVo);
		logger.info("insertResult : " + Integer.toString(insertResult));
		
		return insertResult;
	}
			
	//경력 정보 insert
	@Override
	public int insertTeacherCareer(TeacherCareerVo teacherCareerVo)
	{
		logger.info("insertTeacherCareer 호출");
		
		//입력을 재데로 안했을시 0을 리턴
		String company = teacherCareerVo.getTeacherCareerCompany();
		String department = teacherCareerVo.getTeacherCareerDepartment();
		String employmentDate = teacherCareerVo.getTeacherCareerEmploymentDate();
		String leaveDate = teacherCareerVo.getTeacherCareerLeaveDate();
		String position = teacherCareerVo.getTeacherCareerPosition();
		if(company == "" || department == "" || employmentDate == "" || leaveDate == "" || position == "")
		{
			return 0;
		}
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져와서 teacher_no가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		int teacherNo = memberDao.selectTeacherNo(memberNo);
		teacherCareerVo.setTeacherNo(teacherNo);
		logger.info("teacherCareerVo : " + teacherCareerVo.toString());
		
		int insertResult = memberDao.insertTeacherCareer(teacherCareerVo);
		logger.info("insertResult : " + Integer.toString(insertResult));
		
		return insertResult;
	}
	
	//학력 정보 update
	@Override
	public int updateTeacherEducation(TeacherEducationVo teacherEducationVo)
	{
		logger.info("updateTeacherEducation 호출");
		int updateResult = memberDao.updateTeacherEducation(teacherEducationVo);
		logger.info("updateResult : " + Integer.toString(updateResult));
		return updateResult;
	}
	
	//경력 정보 update
	@Override
	public int updateTeacherCareer(TeacherCareerVo teacherCareerVo)
	{
		logger.info("updateTeacherCareer 호출");
		int updateResult = memberDao.updateTeacherCareer(teacherCareerVo);
		logger.info("updateResult : " + Integer.toString(updateResult));
		return updateResult;
	}

}

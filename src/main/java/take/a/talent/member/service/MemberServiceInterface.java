package take.a.talent.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.JoinMemberVo;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;
import take.a.talent.member.vo.MemberVo;
import take.a.talent.member.vo.TeacherCareerVo;
import take.a.talent.member.vo.TeacherEducationVo;



public interface MemberServiceInterface {
		
	//회원가입시 아이디 중복검사  
	boolean idCheck(String memberId);
	
	//회원(강사) 업데이트
	int updateMember(MemberVo memberVo);
	
	//계좌 등록
	int insertAccount(MemberAccountVo memberAccountVo);
	
	//포인트 충전
	String pointCharge(MemberPointVo memberPointVo);
	
	//회원 업데이트 시 셀렉트
	MemberVo selectForUpdateMember();
	
	boolean nicknameCheck(String memberNickname);
	
	boolean nicknameCheckForUpdate(String memberNickname);
	
	//회원(학생) 업데이트
	int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo);
	
	//회원(학생) 업데이트시 셀렉트
	MemberAndAddressVo selectForUpdateMemberForStudent();
	
	//회원(강사) 주소 insert
	int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo);
	
	//회원(강사) 주소리스트 select
	Map<String, Object> selectAddressListForTeacher();
	
	//맴버 테이블 포인트 가져오기
	int selectMemberPoint();
	
	//회원(강사) 주소 업데이트
	int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo);
	
	//회원(강사) 주소 삭제
	int deleteAddressForTeacher(int addressNo);
	
	//회원가입 
	int addMember(JoinMemberVo joinMemberVo);

	//회원 포인트 충전 내역 리스트 select
	Map<String, Object> selectPointHistoryList();
	
	//포인트 환전 내역 insert
	int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo);
	
	//최근 한달 포인트 환전내역 select
	Map<String, Object> selectPointExchangeList();
	
	//회원(강사) 계좌 유무 확인과 업데이트시 select
	MemberAccountVo selectTeacherAccountNo();
	
	//계좌 업데이트
	int updateTeacherAccount(MemberAccountVo memberAccountVo);
	
	//비밀번호 체크
	boolean checkMemberPassword(String pw);
	
	//비밀번호 변경
	String updatePassword(MemberVo memberVo);
	
	//학력, 경력 리스트 가져오기
	Map<String, Object> selectTeacherEducationAndCareerList();
	
	//학력 정보 insert
	int insertTeacherEducation(TeacherEducationVo teacherEducationVo);
	
	//경력 정보 insert
	int insertTeacherCareer(TeacherCareerVo teacherCareerVo);
	
	//학력 정보 update
	int updateTeacherEducation(TeacherEducationVo teacherEducationVo);
	
	//경력 정보 update
	int updateTeacherCareer(TeacherCareerVo teacherCareerVo);
	
	//학력 정보 delete
	int deleteTeacherEducation(int teacherEducationNo);
	
	//경력 정보 delete
	int deleteTeacherCareer(int teacherCareerNo);
	
	//회원 아이디를 입력받아 권한별 리다이렉트 경로 리턴 해주는 매서드
	String returnRedirect(String memberId);
	
}

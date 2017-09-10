package take.a.talent.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;
import take.a.talent.member.vo.MemberVo;



public interface MemberServiceInterface {

/*	//회원상세정보조회를 위한 메서드 선언
		UserDetail getUserDetail(String userDetailId);
		
		//회원상세정보입력 처리를 위한 메서드 선언
		int addUserDetail(UserDetail userdetail);
		
		//로그인 요청 처리를 위한 권한명을 포함한 회원 정보 선언
		UserAndLevelAndEmployeeAndCompanyAndRank gettUserByIdLevelnameRankname(String userId);
		
		//회원가입시 닉네임 중복체크 기능을 위한 dao 메서드 선언
		User getUserByNickname(String nickname);

		//회원가입시 아이디 중복체크 기능,로그인을 위한 dao 메서드 선언
		User getUser(String userId);
*/
		//회원가입시 회원정보 입력하기 위한 dao 메서드 선언
		//int addMember(MemberVo memberVo);
		
		//회원가입시 아이디 중복검사  
		boolean idCheck(String memberId);
		
		//회원(강사) 업데이트
		int updateMember(MemberVo memberVo);
		
		//계좌 등록
		int insertAccount(MemberAccountVo memberAccountVo);
		
		//포인트 충전
		int pointCharge(MemberPointVo memberPointVo);
		
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
		
		//회원 포인트 충전 내역 리스트 select
		Map<String, Object> selectPointHistoryList();
		
		//포인트 환전 내역 insert
		int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo);
		
		//최근 한달 포인트 환전내역 select
		Map<String, Object> selectPointExchangeList();
	
}

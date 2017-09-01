package take.a.talent.member.service;

import org.springframework.transaction.annotation.Transactional;

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
		
		//회원 업데이트
		int updateMember(MemberVo memberVo);
		
		//회원 업데이트 시 셀렉트
		MemberVo selectForUpdateMember();
		

		boolean nicknameCheck(String memberNickname);

	
}

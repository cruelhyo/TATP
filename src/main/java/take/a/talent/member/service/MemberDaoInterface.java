package take.a.talent.member.service;

import org.springframework.transaction.annotation.Transactional;

import take.a.talent.member.vo.IdChecker;

//import com.mysql.fabric.xmlrpc.base.Member;

import take.a.talent.member.vo.MemberVo;


@Transactional
public interface MemberDaoInterface {
	//회원가입
	int insertMember(MemberVo memberVo);

	//회원가입시 아이디 중복체크
	boolean idCheck(String memberId);
	
	//회원가입시 닉네임 체크
	boolean nicknameCheck(String memberNickname);
	
	//회원 업데이트
	int updateMember(MemberVo memberVo);
	
	//회원 업데이트 시 셀렉트
	MemberVo selectForUpdateMember();
	
}

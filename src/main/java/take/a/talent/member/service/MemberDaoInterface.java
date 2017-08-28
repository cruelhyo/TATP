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
	IdChecker idCheck(String memberId);
	
}

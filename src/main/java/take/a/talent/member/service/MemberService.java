package take.a.talent.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import take.a.talent.member.vo.MemberVo;

public class MemberService {

	@Autowired
	private MemberDaoInterface idao;

	public int addMember(MemberVo memberVo) {
		System.out.println("MemberService addMember 실행");
		return idao.insertMember(memberVo);
	}
}

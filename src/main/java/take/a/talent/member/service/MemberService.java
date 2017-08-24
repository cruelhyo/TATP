package take.a.talent.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import take.a.talent.member.vo.MemberVo;

@Service // service라고 명시해줌
public class MemberService implements MemberServiceInterface{

	@Autowired
	private MemberDaoInterface idao;

	public int addMember(MemberVo memberVo) {
	
		return idao.insertMember(memberVo);
	}
}

package take.a.talent.member.service;

import org.springframework.transaction.annotation.Transactional;

//import com.mysql.fabric.xmlrpc.base.Member;

import take.a.talent.member.vo.MemberVo;


@Transactional
public interface MemberDaoInterface {

	int insertMember(MemberVo memberVo);
	
}

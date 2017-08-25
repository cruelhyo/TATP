package take.a.talent.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mysql.fabric.xmlrpc.base.Member;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.MemberVo;

@Repository // dao라고 명시해줌 

public class MemberDao implements MemberDaoInterface{
		
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//sql문 작동시킬 sqlsession의 자동 객체화 
	@Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원정보 입력을 위한 메서드 선언
	@Override
	public int insertMember(MemberVo memberVo) {
		logger.info("DAO insertMember 호출");
				
		String encryptPassword = passwordEncoder.encode(memberVo.getMember_password());
		
		memberVo.setMember_password(encryptPassword);
		
		
		int row = sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertMember", memberVo);
		return row;
	}
	
}

package take.a.talent.member.service;

import org.mybatis.spring.SqlSessionTemplate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mysql.fabric.xmlrpc.base.Member;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.IdChecker;
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
				
		String encryptPassword = passwordEncoder.encode(memberVo.getMemberPassword());
		
		memberVo.setMemberPassword(encryptPassword);
		
		
		int row = sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertMember", memberVo);
		return row;
	}

	//회원가입시 아이디 중복체크 
	@Override
	public boolean idCheck(String memberId){
		logger.info("DAO idCheck 호출");
		logger.info("memberId : "+memberId);
		
		/*IdChecker idChecker = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idChecker", memberId);*/
		/*logger.info("checkId : "+idChecker.getMember_id());*/
		//sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idCheck", memberId);
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idCheck", memberId);
	}
	
	public int updateMember(MemberVo memberVo) 
	{
		logger.info("DAO updateMember 호출");
		
		int result = sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateMember", memberVo);
		return result;
	}
	
}

package take.a.talent.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.MemberVo;

public class MemberDaoTest
{
	
	BCryptPasswordEncoder passwordEncoder;
	MemberVo memberVo;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Before
	public void setUp() throws Exception
	{
		passwordEncoder = new BCryptPasswordEncoder();
		memberVo = new MemberVo();
		memberVo.setMemberAddress("aaaa");
		memberVo.setMemberPassword("pw006");
		
	}

	@Test
	public void test()
	{
		try 
		{
			logger.info("DAO insertMember 호출");
			
			String encryptPassword = passwordEncoder.encode(memberVo.getMemberPassword());
			
			logger.info(memberVo.getMemberPassword());
			
			memberVo.setMemberPassword(encryptPassword);
			logger.info(memberVo.getMemberPassword());
			
			assertTrue(true);
			
		}
		catch (Exception e)
		{
			fail("Not yet implemented");
		}
		
		
	}

}

package take.a.talent.member.service;

import org.mybatis.spring.SqlSessionTemplate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mysql.fabric.xmlrpc.base.Member;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.IdChecker;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberVo;

@Repository // dao라고 명시해줌 

public class MemberDao implements MemberDaoInterface{
		
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//sql문 작동시킬 sqlsession의 자동 객체화 
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//로그인 후 스프링 시큐리티 세션에서 저장되는 username, userpassword, authority를 가져올수 있게 user를 지정
	//private User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
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
	
	//회원 업데이트
	@Override
	public int updateMember(MemberVo memberVo)
	{
		//vo에 지금 로그인되어있는 사용자의 아이디를 세팅
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberVo.setMemberId(user.getUsername());
		logger.info("DAO updateMember 호출");
		logger.info(memberVo.toString());
		//updateMember 쿼리를 호출
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateMember", memberVo);
	}
	
	@Override
	public MemberVo selectForUpdateMember()
	{
		logger.info("DAO selectForUpdateMember 호출");
		//지금 로그인 되어있는 사용자의 아이디를 가져옴
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		//selectForUpdateMember 쿼리를 호출
		MemberVo memberVo = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectForUpdateMember", memberId);
		logger.info(memberVo.toString());
		return memberVo;
	}

	//회원가입시 닉네임 중복체크 
	@Override
	public boolean nicknameCheck(String memberNickname){
		logger.info("DAO nicknameCheck 호출");
		logger.info("memberNickname : "+memberNickname);
		
		/*IdChecker idChecker = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idChecker", memberId);*/
		/*logger.info("checkId : "+idChecker.getMember_id());*/
		//sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idCheck", memberId);
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.nicknameCheck", memberNickname);
	}
	
	// 업데이트시 넥네임 중복체크
	
	public boolean nicknameCheckForUpdate(String memberNickname)
	{
		logger.info("DAO nicknameCheckForUpdate 호출");
		logger.info("memberNickname : "+memberNickname);
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		boolean nicknameCheckResult =  sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.nicknameCheck", memberNickname);
		String nicknameCheckForUpdateResult = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.nicknameCheckForUpdate", memberId);
		if(nicknameCheckResult) 
		{
			if(nicknameCheckForUpdateResult.equals(memberNickname)) 
			{
				return false;
			}
			return nicknameCheckResult;
		}
		return nicknameCheckResult;
	}
	
	@Override
	public int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo)
	{
		logger.info("DAO updateMemberForStudent 호출");
		logger.info("memberAndAddressVo : "+memberAndAddressVo);
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		memberAndAddressVo.setMemberId(memberId);
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateMemberForStudent", memberAndAddressVo);
	}
	
	@Override
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("DAO selectForUpdateMemberForStudent 호출");
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectForUpdateMemberForStudent", memberId);
	}
	
}

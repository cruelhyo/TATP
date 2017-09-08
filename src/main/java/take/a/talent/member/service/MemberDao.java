package take.a.talent.member.service;

import java.util.List;

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
import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.IdChecker;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointVo;
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
	
	//포인트 충전
	@Override
	public int insertPointCharge(MemberPointVo memberPointVo)
	{
		logger.info("DAO insertPoint 호출");
		logger.info(memberPointVo.toString());
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertPoint", memberPointVo);
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
	
	//업데이트시 닉네임 체크를 위한 셀렉트
	public String nicknameCheckForUpdate(String memberId)
	{
		logger.info("DAO nicknameCheckForUpdate 호출");
		logger.info("memberId : "+memberId);
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.nicknameCheckForUpdate", memberId);
		
	}
	
	//회원(학생) 업데이트
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
	
	//회원(학생) 업데이트시 셀렉트
	@Override
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("DAO selectForUpdateMemberForStudent 호출");
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectForUpdateMemberForStudent", memberId);
	}
	
	//회원(강사) 주소 insert
	@Override
	public int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("DAO insertAddressForTeacher 호출");
		logger.info("AddressAndClassificationVo : "+addressAndClassificationVo);
		
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertAddressForTeacher", addressAndClassificationVo);
	}
	
	//회원 member_no select
	@Override
	public int selectMemberNo(String memberId)
	{
		logger.info("DAO selectMemberNo 호출");
		logger.info("memberId : "+memberId);
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectMemberNoForInsertAddress", memberId);
	}
	
	//회원(강사) 주소리스트 select
	@Override
	public List<AddressAndClassificationVo> selectAddressListForTeacher(int memberNo)
	{
		logger.info("DAO insertAddressForTeacher 호출");
		logger.info("memberNo : "+memberNo);
		
		return sqlSessionTemplate.selectList("take.a.talent.member.service.MemberMapper.selectAddressListForTeacher", memberNo);
	}
		
	//회원(강사) 계좌 insert
	@Override
	public int insertAccount(MemberAccountVo memberAccountVo)
	{
		logger.info("DAO insertAccount 호출");
		logger.info(memberAccountVo.toString());
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertAccount", memberAccountVo);
	}
	
	//맴버 테이블 포인트 업데이트
	public int updatePointForMember(MemberVo memberVo)
	{
		logger.info("DAO updatePointForMember 호출");
		logger.info(memberVo.toString());
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updatePointForMember", memberVo);
	}
	
	//회원 포인트 가져오기
	public int selectMemberPoint(int memberNo) 
	{
		logger.info("DAO selectMemberPoint 호출");
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectMemberPoint", memberNo);
	}
	
	
}

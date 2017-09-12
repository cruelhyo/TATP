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
import take.a.talent.member.vo.JoinMemberVo;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;
import take.a.talent.member.vo.MemberVo;
import take.a.talent.member.vo.TeacherVo;

@Repository // dao라고 명시해줌

public class MemberDao implements MemberDaoInterface{
		
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//sql문 작동시킬 sqlsession의 자동 객체화  
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	//회원가입시 memberTb insert
	@Override
	public int insertMemberTb(JoinMemberVo joinMemberVo) {
		logger.info("DAO insertMember 호출");

		//입력된 password를 db저장 전에 암호화 시킴
		String encryptPassword = passwordEncoder.encode(joinMemberVo.getMemberPassword());
		joinMemberVo.setMemberPassword(encryptPassword);
		
		int row = sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertMember", joinMemberVo);
		return row;
	}
	
	//회원가입시 addressTb insert
	@Override
	public int insertMemberAdd(JoinMemberVo joinMemberVo) {
		
		
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertMemberAddress", joinMemberVo);
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
	
	//포인트 충전하기
	@Override
	public int insertPointCharge(MemberPointVo memberPointVo)
	{
		logger.info("DAO insertPoint 호출");
		logger.info(memberPointVo.toString());
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertPoint", memberPointVo);
	}
	
	//회원 업데이트시 셀렉트
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
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectMemberNo", memberId);
	}
	
	//회원(강사) 주소리스트 select
	@Override
	public List<AddressAndClassificationVo> selectAddressListForTeacher(int memberNo)
	{
		logger.info("DAO insertAddressForTeacher 호출");
		logger.info("memberNo : "+memberNo);
		
		return sqlSessionTemplate.selectList("take.a.talent.member.service.MemberMapper.selectAddressListForTeacher", memberNo);
	}
	
	//회원(강사) 주소 업데이트
	@Override
	public int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("DAO updateAddressForTeacher 호출");
		logger.info("addressAndClassificationVo : "+ addressAndClassificationVo);
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateAddressForTeacher", addressAndClassificationVo);
	}
		
	//회원(강사) 계좌 insert
	@Override
	public int insertAccount(MemberAccountVo memberAccountVo)
	{
		logger.info("DAO insertAccount 호출");
		logger.info(memberAccountVo.toString());

		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertAccount", memberAccountVo);
	}
	
	//포인트 충전시 업데이트
	public int updatePointForMember(MemberVo memberVo)
	{
		logger.info("DAO updatePointForMember 호출");
		logger.info(memberVo.toString());
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updatePointForMember", memberVo);
	}
	
	//현재 포인트 가져오기
	public int selectMemberPoint(int memberNo) 
	{
		logger.info("DAO selectMemberPoint 호출");
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectMemberPoint", memberNo);
	}
	
	//회원(강사) 주소 삭제
	@Override
	public int deleteAddressForTeacher(int addressNo)
	{
		logger.info("DAO deleteAddressForTeacher 호출");
		
		return sqlSessionTemplate.delete("take.a.talent.member.service.MemberMapper.deleteAddressForTeacher", addressNo);
	}
	
	//포인트 충전 내역 select
	@Override
	public List<MemberPointVo> selectPointHistoryList(int memberNo)
	{
		logger.info("DAO selectPointHistoryList 호출");
		
		return sqlSessionTemplate.selectList("take.a.talent.member.service.MemberMapper.selectPointHistoryList", memberNo);
	}
	
	//포인트 환전 내역 insert
	@Override
	public int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo)
	{
		logger.info("DAO insertPointExchangeHistory 호출");
		logger.info(memberPointExchangeVo.toString());
		
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertPointExchangHistory", memberPointExchangeVo);
	}
	
	//최근 한달 포인트 환전 내역 select
	@Override
	public List<MemberPointExchangeVo> selectPointExchangeList(int memberNo)
	{
		logger.info("DAO selectPointExchangeList 호출");
		logger.info("DAO 환전내역 리스트 select");
		
		return sqlSessionTemplate.selectList("take.a.talent.member.service.MemberMapper.selectPointExchangeList", memberNo);
	}
	
	//teacher account no select
	@Override
	public int selectTeacherAccountNo(int memberNo)
	{
		logger.info("DAO selectTeacherAccountNo 호출");
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectTeacherAccountNo", memberNo);
	}
	
	//계좌등록시 teacher테이블 업데이트
	@Override
	public int updateTeacherWhenInsertAccount(TeacherVo teacherVo)
	{
		logger.info("DAO selectTeacherAccountNo 호출");
		logger.info(teacherVo.toString());
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateTeacherWhenInsertAccount", teacherVo);
	}
	
	//계좌 업데이트시 select
	@Override
	public MemberAccountVo selectTeacherAccountForUpdate(int teacherAccountNo)
	{
		logger.info("DAO selectTeacherAccountForUpdate 호출");
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectTeacherAccountForUpdate", teacherAccountNo);
	}
	
	//계좌 업데이트
	@Override
	public int updateTeacherAccount(MemberAccountVo memberAccountVo)
	{
		logger.info("DAO updateTeacherAccount 호출");
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateTeacherAccount", memberAccountVo);
	}

	
	
}

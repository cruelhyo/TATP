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
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;
import take.a.talent.member.vo.MemberVo;

@Repository // dao�씪怨� 紐낆떆�빐以� 

public class MemberDao implements MemberDaoInterface{
		
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//sql臾� �옉�룞�떆�궗 sqlsession�쓽 �옄�룞 媛앹껜�솕 
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//濡쒓렇�씤 �썑 �뒪�봽留� �떆�걧由ы떚 �꽭�뀡�뿉�꽌 ���옣�릺�뒗 username, userpassword, authority瑜� 媛��졇�삱�닔 �엳寃� user瑜� 吏��젙
	//private User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
	//�쉶�썝�젙蹂� �엯�젰�쓣 �쐞�븳 硫붿꽌�뱶 �꽑�뼵
	@Override
	public int insertMember(MemberVo memberVo) {
		logger.info("DAO insertMember 호출");
				
		String encryptPassword = passwordEncoder.encode(memberVo.getMemberPassword());
		
		memberVo.setMemberPassword(encryptPassword);
		
		
		int row = sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertMember", memberVo);
		return row;
	}

	//�쉶�썝媛��엯�떆 �븘�씠�뵒 以묐났泥댄겕 
	@Override
	public boolean idCheck(String memberId){
		logger.info("DAO idCheck 호출");
		logger.info("memberId : "+memberId);
		
		/*IdChecker idChecker = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idChecker", memberId);*/
		/*logger.info("checkId : "+idChecker.getMember_id());*/
		//sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idCheck", memberId);
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idCheck", memberId);
	}
	
	//�쉶�썝 �뾽�뜲�씠�듃
	@Override
	public int updateMember(MemberVo memberVo)
	{
		//vo�뿉 吏�湲� 濡쒓렇�씤�릺�뼱�엳�뒗 �궗�슜�옄�쓽 �븘�씠�뵒瑜� �꽭�똿
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberVo.setMemberId(user.getUsername());
		logger.info("DAO updateMember 호출");
		logger.info(memberVo.toString());
		//updateMember 荑쇰━瑜� �샇異�
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateMember", memberVo);
	}
	
	//�룷�씤�듃 異⑹쟾
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
		//吏�湲� 濡쒓렇�씤 �릺�뼱�엳�뒗 �궗�슜�옄�쓽 �븘�씠�뵒瑜� 媛��졇�샂
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		//selectForUpdateMember 荑쇰━瑜� �샇異�
		MemberVo memberVo = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectForUpdateMember", memberId);
		logger.info(memberVo.toString());
		return memberVo;
	}

	//�쉶�썝媛��엯�떆 �땳�꽕�엫 以묐났泥댄겕 
	@Override
	public boolean nicknameCheck(String memberNickname){
		logger.info("DAO nicknameCheck 호출");
		logger.info("memberNickname : "+memberNickname);
		
		/*IdChecker idChecker = sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idChecker", memberId);*/
		/*logger.info("checkId : "+idChecker.getMember_id());*/
		//sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.idCheck", memberId);
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.nicknameCheck", memberNickname);
	}
	
	//�뾽�뜲�씠�듃�떆 �땳�꽕�엫 泥댄겕瑜� �쐞�븳 ���젆�듃
	public String nicknameCheckForUpdate(String memberId)
	{
		logger.info("DAO nicknameCheckForUpdate 호출");
		logger.info("memberId : "+memberId);
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.nicknameCheckForUpdate", memberId);
		
	}
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃
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
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃�떆 ���젆�듃
	@Override
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("DAO selectForUpdateMemberForStudent 호출");
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectForUpdateMemberForStudent", memberId);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 insert
	@Override
	public int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("DAO insertAddressForTeacher 호출");
		logger.info("AddressAndClassificationVo : "+addressAndClassificationVo);
		
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertAddressForTeacher", addressAndClassificationVo);
	}
	
	//�쉶�썝 member_no select
	@Override
	public int selectMemberNo(String memberId)
	{
		logger.info("DAO selectMemberNo 호출");
		logger.info("memberId : "+memberId);
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectMemberNo", memberId);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼由ъ뒪�듃 select
	@Override
	public List<AddressAndClassificationVo> selectAddressListForTeacher(int memberNo)
	{
		logger.info("DAO insertAddressForTeacher 호출");
		logger.info("memberNo : "+memberNo);
		
		return sqlSessionTemplate.selectList("take.a.talent.member.service.MemberMapper.selectAddressListForTeacher", memberNo);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �뾽�뜲�씠�듃
	@Override
	public int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("DAO updateAddressForTeacher 호출");
		logger.info("addressAndClassificationVo : "+ addressAndClassificationVo);
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updateAddressForTeacher", addressAndClassificationVo);
	}
		
	//�쉶�썝(媛뺤궗) 怨꾩쥖 insert
	@Override
	public int insertAccount(MemberAccountVo memberAccountVo)
	{
		logger.info("DAO insertAccount 호출");
		logger.info(memberAccountVo.toString());

		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertAccount", memberAccountVo);
	}
	
	//留대쾭 �뀒�씠釉� �룷�씤�듃 �뾽�뜲�씠�듃
	public int updatePointForMember(MemberVo memberVo)
	{
		logger.info("DAO updatePointForMember 호출");
		logger.info(memberVo.toString());
		
		return sqlSessionTemplate.update("take.a.talent.member.service.MemberMapper.updatePointForMember", memberVo);
	}
	
	//�쉶�썝 �룷�씤�듃 媛��졇�삤湲�
	public int selectMemberPoint(int memberNo) 
	{
		logger.info("DAO selectMemberPoint 호출");
		
		return sqlSessionTemplate.selectOne("take.a.talent.member.service.MemberMapper.selectMemberPoint", memberNo);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �궘�젣
	@Override
	public int deleteAddressForTeacher(int addressNo)
	{
		logger.info("DAO deleteAddressForTeacher 호출");
		
		return sqlSessionTemplate.delete("take.a.talent.member.service.MemberMapper.deleteAddressForTeacher", addressNo);
	}
	
	//�쉶�썝 �룷�씤�듃 異⑹쟾 �궡�뿭 由ъ뒪�듃 select
	@Override
	public List<MemberPointVo> selectPointHistoryList(int memberNo)
	{
		logger.info("DAO selectPointHistoryList 호출");
		
		return sqlSessionTemplate.selectList("take.a.talent.member.service.MemberMapper.selectPointHistoryList", memberNo);
	}
	
	//�룷�씤�듃 �솚�쟾 �궡�뿭 insert
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
	
}

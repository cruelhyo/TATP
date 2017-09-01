package take.a.talent.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.MemberVo;


@Service // service라고 명시해줌
public class MemberService implements MemberServiceInterface{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;

	@Override
	public boolean idCheck(String memberId)
	{
		boolean ck = memberDao.idCheck(memberId);
		
		logger.info("checkedId : " + ck);
		
		return ck;
	}
	
	//회원 업데이트 dao호출
	@Override
	public int updateMember(MemberVo memberVo)
	{
		int updateMemberResult = memberDao.updateMember(memberVo);
		
		return updateMemberResult;
		 
	}
	//회원 업데이트 시 셀텍트 dao호출
	@Override
	public MemberVo selectForUpdateMember()
	{
		MemberVo selectForUpdateMemberResult = memberDao.selectForUpdateMember();
		
		return selectForUpdateMemberResult;
	}
	

	@Override
	public boolean nicknameCheck(String memberNickname) {
		
		boolean nck = memberDao.nicknameCheck(memberNickname);
		 
		logger.info("checkedNickname : " + nck);
			
		return nck;
	}

}

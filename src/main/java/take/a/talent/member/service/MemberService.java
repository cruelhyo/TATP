package take.a.talent.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.IdChecker;
import take.a.talent.member.vo.MemberVo;

@Service // service라고 명시해줌
public class MemberService implements MemberServiceInterface{

	@Autowired
	private MemberDaoInterface idao;
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	public int addMember(MemberVo memberVo) {
	
		return idao.insertMember(memberVo);
	}

	@Override
	public int idCheck(String memberId)
	{
		IdChecker idchecker = idao.idCheck(memberId);
		String checkedId = idchecker.getMember_id();
				
		logger.info("checkedId : " + checkedId);
		return 0;
	}
}

package take.a.talent.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import take.a.talent.member.controller.MemberController;
import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;
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
		logger.info("selectForUpdateMember");
		MemberVo selectForUpdateMemberResult = memberDao.selectForUpdateMember();
		logger.info(selectForUpdateMemberResult.toString());
		return selectForUpdateMemberResult;
	}
	
	//
	@Override
	public boolean nicknameCheck(String memberNickname) {
		
		boolean nck = memberDao.nicknameCheck(memberNickname);
		 
		logger.info("checkedNickname : " + nck);
			
		return nck;
	}
	
	@Override
	public boolean nicknameCheckForUpdate(String memberNickname) {
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		boolean nicknameCheckResult = memberDao.nicknameCheck(memberNickname);
		String nicknameCheckForUpdateResult = memberDao.nicknameCheckForUpdate(memberId);
		logger.info("nicknameCheckResult : " + nicknameCheckResult);
		logger.info("nicknameCheckForUpdateResult : " + nicknameCheckForUpdateResult);
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
	
	//회원(학생) 업데이트
	@Override
	public int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo)
	{
		logger.info("updateMemberForStudent");
		logger.info(memberAndAddressVo.toString());
		
		return memberDao.updateMemberForStudent(memberAndAddressVo);
	}
	
	//회원(학생) 업데이트시 셀렉트
	@Override
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("selectForUpdateMemberForStudent");
		
		return memberDao.selectForUpdateMemberForStudent();
	}
	
	//회원(강사) 주소 insert
	public int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("selectForUpdateMemberForStudent");
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//폼에서 제대로 입력 안했을 때 0을 리턴
		int addressMailNumber = addressAndClassificationVo.getAddressMailNumber();
		String memberAddress = addressAndClassificationVo.getMemberAddress();
		if(addressMailNumber == 0 || memberAddress.equals(""))
		{
			return 0;
		}
		//회원 memberNo select vo객체에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		addressAndClassificationVo.setMemberNo(memberNo);
		
		return memberDao.insertAddressForTeacher(addressAndClassificationVo);
	}
	
	//포인트 충전 insert 와 맴버테이블 포인트 업데이트
	public int pointCharge(MemberPointVo memberPointVo)
	{
		//MemberVo 새로운 객체를 생성
		MemberVo memberVo = new MemberVo();
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select후 각 vo에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		memberPointVo.setMemberNo(memberNo);
		
		//충전 금액을 포인트로 변환과 회원이 가지고 있는 포인트를 select후 합산하여 vo에 세팅
		int money = memberPointVo.getPointChargeMoney();
		int memberPoint = memberDao.selectMemberPoint(memberNo);
		int point = money/1000;
		memberPointVo.setPointChargePoint(point);
		memberVo.setMemberPoint(memberPoint + point);
		
		//합산한 포인트가 member 테이블에 업데이트가 안되었을시 0을 리턴
		int memberPointUpdateResult = memberDao.updatePointForMember(memberVo);
		if(memberPointUpdateResult == 0) 
		{
			return 0;
		}
		
		//업데이트 dao호출후 리턴
		int pointUpdateResult = memberDao.insertPointCharge(memberPointVo);
		return pointUpdateResult;
		
	}
	
	//맴버 포인트 가져오기
	public int selectMemberPoint()
	{
		//로그인 되어있는 회원 id가져온 후 memberNo 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		int memberNo = memberDao.selectMemberNo(memberId);
		
		return memberDao.selectMemberPoint(memberNo);
	}
	
	
	//회원(강사) 주소리스트 select
	@Override
	public Map<String, Object> selectAddressListForTeacher()
	{
		logger.info("selectAddressListForTeacher");
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//회원 memberNo select 
		int memberNo = memberDao.selectMemberNo(memberId);
		Map<String, Object> addressListMap = new HashMap<String, Object>();
		addressListMap.put("addressList", memberDao.selectAddressListForTeacher(memberNo));
		return addressListMap;
	}
	
	//회원(강사) 주소 업데이트
	@Override
	public int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("updateAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		//폼에서 제대로 입력 안했을 때 0을 리턴
		int addressMailNumber = addressAndClassificationVo.getAddressMailNumber();
		String memberAddress = addressAndClassificationVo.getMemberAddress();
		if(addressMailNumber == 0 || memberAddress.equals(""))
		{
			return 0;
		}
		//업데이트 dao vo를 입력값으로 호출 후 리턴
		return memberDao.updateAddressForTeacher(addressAndClassificationVo);
	}

	//회원(강사) 계좌 insert
	@Override
	public int insertAccount(MemberAccountVo memberAccountVo) 
	{
		logger.info("insertAccount");
		logger.info(memberAccountVo.toString());
		return memberDao.insertAccount(memberAccountVo);
	}
	
	//회원(강사) 주소 삭제
	@Override
	public int deleteAddressForTeacher(int addressNo)
	{
		logger.info("deleteAddressForTeacher");
		
		return memberDao.deleteAddressForTeacher(addressNo);
	}
	
	//회원 포인트 충전 내역 리스트 select
	public Map<String, Object> selectPointHistoryList()
	{
		logger.info("selectPointHistoryList");
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//dao호출 리턴 list 맵핑
		Map<String, Object> pointListMap = new HashMap<String, Object>();
		pointListMap.put("pointList", memberDao.selectPointHistoryList(memberNo));
		
		return pointListMap;
	}
	
	//포인트 환전 내역 insert
	public int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo)
	{
		logger.info("insertPointExchangeHistory");
		logger.info(memberPointExchangeVo.toString());
		
		//새로운 객체를 생성
		MemberVo memberVo = new MemberVo();
		
		
		//로그인 되어있는 회원 id가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select후 각 vo에 세팅
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		memberPointExchangeVo.setMemberNo(memberNo);
		
		//입력한 환전 포인트 환전 금액으로 바꾸고 세팅
		int pointExchangePoint = memberPointExchangeVo.getPointExchangePoint();
		int exchangeMoney = pointExchangePoint * 700;
		memberPointExchangeVo.setPointExchangeMoney(exchangeMoney);
		//현재 가지고 있던 포인트 가져오기
		int memberPonit = memberDao.selectMemberPoint(memberNo);
		
		//가지고 있던 포인트가 환전할 금액보다 크거나 같을시
		if(memberPonit >= pointExchangePoint) {
			//원래 포인트에서 환전할 포인트 빼고 vo에 세팅
			memberPonit = memberPonit - pointExchangePoint;
			memberVo.setMemberPoint(memberPonit);
			
			//계산한 포인트가 member 테이블에 업데이트가 안되었을시 0을 리턴
			int memberPointUpdateResult = memberDao.updatePointForMember(memberVo);
			if(memberPointUpdateResult == 0) 
			{
				return 0;
			}
			
			//환전 내역 insert 결과 리턴
			return memberDao.insertPointExchangeHistory(memberPointExchangeVo);
		}
		return 0;
	}

}

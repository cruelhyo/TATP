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


@Service // service�씪怨� 紐낆떆�빐以�
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
	
	//�쉶�썝 �뾽�뜲�씠�듃 dao�샇異�
	@Override
	public int updateMember(MemberVo memberVo)
	{
		int updateMemberResult = memberDao.updateMember(memberVo);
		
		return updateMemberResult;
		 
	}
	//�쉶�썝 �뾽�뜲�씠�듃 �떆 ���뀓�듃 dao�샇異�
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
		
		//濡쒓렇�씤 �릺�뼱�엳�뒗 �쉶�썝 id媛��졇�삤湲�
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
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃
	@Override
	public int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo)
	{
		logger.info("updateMemberForStudent");
		logger.info(memberAndAddressVo.toString());
		
		return memberDao.updateMemberForStudent(memberAndAddressVo);
	}
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃�떆 ���젆�듃
	@Override
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("selectForUpdateMemberForStudent");
		
		return memberDao.selectForUpdateMemberForStudent();
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 insert
	public int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("selectForUpdateMemberForStudent");
		//濡쒓렇�씤 �릺�뼱�엳�뒗 �쉶�썝 id媛��졇�삤湲�
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//�뤌�뿉�꽌 �젣��濡� �엯�젰 �븞�뻽�쓣 �븣 0�쓣 由ы꽩
		int addressMailNumber = addressAndClassificationVo.getAddressMailNumber();
		String memberAddress = addressAndClassificationVo.getMemberAddress();
		if(addressMailNumber == 0 || memberAddress.equals(""))
		{
			return 0;
		}
		//�쉶�썝 memberNo select vo媛앹껜�뿉 �꽭�똿
		int memberNo = memberDao.selectMemberNo(memberId);
		addressAndClassificationVo.setMemberNo(memberNo);
		
		return memberDao.insertAddressForTeacher(addressAndClassificationVo);
	}
	
	//�룷�씤�듃 異⑹쟾 insert �� 留대쾭�뀒�씠釉� �룷�씤�듃 �뾽�뜲�씠�듃
	public int pointCharge(MemberPointVo memberPointVo)
	{
		//MemberVo �깉濡쒖슫 媛앹껜瑜� �깮�꽦
		MemberVo memberVo = new MemberVo();
		
		//濡쒓렇�씤 �릺�뼱�엳�뒗 �쉶�썝 id媛��졇�삤湲�
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select�썑 媛� vo�뿉 �꽭�똿
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		memberPointVo.setMemberNo(memberNo);
		
		//異⑹쟾 湲덉븸�쓣 �룷�씤�듃濡� 蹂��솚怨� �쉶�썝�씠 媛�吏�怨� �엳�뒗 �룷�씤�듃瑜� select�썑 �빀�궛�븯�뿬 vo�뿉 �꽭�똿
		int money = memberPointVo.getPointChargeMoney();
		int memberPoint = memberDao.selectMemberPoint(memberNo);
		int point = money/1000;
		memberPointVo.setPointChargePoint(point);
		memberVo.setMemberPoint(memberPoint + point);
		
		//�빀�궛�븳 �룷�씤�듃媛� member �뀒�씠釉붿뿉 �뾽�뜲�씠�듃媛� �븞�릺�뿀�쓣�떆 0�쓣 由ы꽩
		int memberPointUpdateResult = memberDao.updatePointForMember(memberVo);
		if(memberPointUpdateResult == 0) 
		{
			return 0;
		}
		
		//�뾽�뜲�씠�듃 dao�샇異쒗썑 由ы꽩
		int pointUpdateResult = memberDao.insertPointCharge(memberPointVo);
		return pointUpdateResult;
		
	}
	
	//留대쾭 �룷�씤�듃 媛��졇�삤湲�
	public int selectMemberPoint()
	{
		//濡쒓렇�씤 �릺�뼱�엳�뒗 �쉶�썝 id媛��졇�삩 �썑 memberNo 媛��졇�삤湲�
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		int memberNo = memberDao.selectMemberNo(memberId);
		
		return memberDao.selectMemberPoint(memberNo);
	}
	
	
	//�쉶�썝(媛뺤궗) 二쇱냼由ъ뒪�듃 select
	@Override
	public Map<String, Object> selectAddressListForTeacher()
	{
		logger.info("selectAddressListForTeacher");
		
		//濡쒓렇�씤 �릺�뼱�엳�뒗 �쉶�썝 id媛��졇�삤湲�
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//�쉶�썝 memberNo select 
		int memberNo = memberDao.selectMemberNo(memberId);
		Map<String, Object> addressListMap = new HashMap<String, Object>();
		addressListMap.put("addressList", memberDao.selectAddressListForTeacher(memberNo));
		return addressListMap;
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �뾽�뜲�씠�듃
	@Override
	public int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("updateAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		//�뤌�뿉�꽌 �젣��濡� �엯�젰 �븞�뻽�쓣 �븣 0�쓣 由ы꽩
		int addressMailNumber = addressAndClassificationVo.getAddressMailNumber();
		String memberAddress = addressAndClassificationVo.getMemberAddress();
		if(addressMailNumber == 0 || memberAddress.equals(""))
		{
			return 0;
		}
		//�뾽�뜲�씠�듃 dao vo瑜� �엯�젰媛믪쑝濡� �샇異� �썑 由ы꽩
		return memberDao.updateAddressForTeacher(addressAndClassificationVo);
	}

	//�쉶�썝(媛뺤궗) 怨꾩쥖 insert
	@Override
	public int insertAccount(MemberAccountVo memberAccountVo) 
	{
		logger.info("insertAccount");
		logger.info(memberAccountVo.toString());
		return memberDao.insertAccount(memberAccountVo);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �궘�젣
	@Override
	public int deleteAddressForTeacher(int addressNo)
	{
		logger.info("deleteAddressForTeacher");
		
		return memberDao.deleteAddressForTeacher(addressNo);
	}
	
	//�쉶�썝 �룷�씤�듃 異⑹쟾 �궡�뿭 由ъ뒪�듃 select
	public Map<String, Object> selectPointHistoryList()
	{
		logger.info("selectPointHistoryList");
		
		//濡쒓렇�씤 �릺�뼱�엳�뒗 �쉶�썝 id媛��졇�삤湲�
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//dao�샇異� 由ы꽩 list 留듯븨
		Map<String, Object> pointListMap = new HashMap<String, Object>();
		pointListMap.put("pointList", memberDao.selectPointHistoryList(memberNo));
		
		return pointListMap;
	}
	
	//�룷�씤�듃 �솚�쟾 �궡�뿭 insert
	public int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo)
	{
		logger.info("insertPointExchangeHistory");
		logger.info(memberPointExchangeVo.toString());
		
		if(memberPointExchangeVo.getPointExchangePoint() == 0) 
		{
			return 0;
		}
		//�깉濡쒖슫 媛앹껜瑜� �깮�꽦
		MemberVo memberVo = new MemberVo();
		
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//memberNo select�썑 媛� vo�뿉 �꽭�똿
		int memberNo = memberDao.selectMemberNo(memberId);
		memberVo.setMemberNo(memberNo);
		memberPointExchangeVo.setMemberNo(memberNo);
		
		//�엯�젰�븳 �솚�쟾 �룷�씤�듃 �솚�쟾 湲덉븸�쑝濡� 諛붽씀怨� �꽭�똿
		int pointExchangePoint = memberPointExchangeVo.getPointExchangePoint();
		int exchangeMoney = pointExchangePoint * 700;
		memberPointExchangeVo.setPointExchangeMoney(exchangeMoney);
		//�쁽�옱 媛�吏�怨� �엳�뜕 �룷�씤�듃 媛��졇�삤湲�
		int memberPonit = memberDao.selectMemberPoint(memberNo);
		
		//媛�吏�怨� �엳�뜕 �룷�씤�듃媛� �솚�쟾�븷 湲덉븸蹂대떎 �겕嫄곕굹 媛숈쓣�떆
		if(memberPonit >= pointExchangePoint) {
			//�썝�옒 �룷�씤�듃�뿉�꽌 �솚�쟾�븷 �룷�씤�듃 鍮쇨퀬 vo�뿉 �꽭�똿
			memberPonit = memberPonit - pointExchangePoint;
			memberVo.setMemberPoint(memberPonit);
			
			//怨꾩궛�븳 �룷�씤�듃媛� member �뀒�씠釉붿뿉 �뾽�뜲�씠�듃媛� �븞�릺�뿀�쓣�떆 0�쓣 由ы꽩
			int memberPointUpdateResult = memberDao.updatePointForMember(memberVo);
			if(memberPointUpdateResult == 0) 
			{
				return 0;
			}
			
			//�솚�쟾 �궡�뿭 insert 寃곌낵 由ы꽩
			return memberDao.insertPointExchangeHistory(memberPointExchangeVo);
		}
		return 0;
	}
	
	//최근한달 포인트 환전내역 select
	@Override
	public Map<String, Object> selectPointExchangeList()
	{
		logger.info("selectPointExchangeList 호출");
		logger.info("Service 포인트 환전 내역 select");
		
		//현재 로그인한 회원 정보 가져오기
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getUsername();
		
		//가져온 아이디로 memberNo 가져오기
		int memberNo = memberDao.selectMemberNo(memberId);
		
		//pointExchangeListMap 객체 생성 후 memberNo를 입력값으로  dao 호출후 리턴 받은 list 맵핑
		Map<String, Object> pointExchangeListMap = new HashMap<String, Object>();
		pointExchangeListMap.put("pointExchangeList", memberDao.selectPointExchangeList(memberNo));
		
		return pointExchangeListMap;
	}

}

package take.a.talent.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberVo;

@RestController
public class MemberRestController
{
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
    private MemberServiceInterface service;
	
	//�쉶�썝(媛뺤궗) �뾽�뜲�씠�듃�떆 ���젆�듃
	@RequestMapping(value ="/ajax/teacherPage/selectForUpdateMember", method=RequestMethod.GET)
	public MemberVo selectForUpdateMember()
	{
		logger.info("selectForUpdateMember");
		MemberVo memberVo = service.selectForUpdateMember();
		return memberVo;
	}
	
	//join form�뿉�꽌 �엯�젰�븳 媛믩뱾�쓣 MemberController�뿉�꽌 memberVo���엯�쑝濡� �쟾�떖�븳�떎. 
	@RequestMapping(value ="/ajax/idCheck**", method=RequestMethod.POST)
	public boolean idCheck(@RequestBody String memberId, ModelMap model) {
		logger.info("id泥댄겕");
		logger.info("VO媛� �솗�씤");
		logger.info("memberId"+memberId);
		boolean idExist = service.idCheck(memberId);
		model.addAttribute("idExist", idExist);
		
		return idExist;
	}
	
	//�땳�꽕�엫 泥댄겕
	@RequestMapping(value="/ajax/nickNameCheck", method=RequestMethod.POST)
	public boolean nickNameCheck(@RequestBody String memberNickname, ModelMap model){
		logger.info("nickname泥댄겕");
		logger.info("nickname媛� �솗�씤");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheck(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
	}
	
	//�뾽�뜲�씠�듃�떆 �땳�꽕�엫泥댄겕 �쁽�옱 �궗�슜�옄媛� �벐怨� �엳�뒗 �땳�꽕�엫�룄 �궗�슜媛��뒫�쑝濡� �빐�빞 �븳�떎
	@RequestMapping(value="/ajax/nickNameCheckForUpdate", method=RequestMethod.POST)
	public boolean nickNameCheckForUpdate(@RequestBody String memberNickname, ModelMap model){
		logger.info("nickname泥댄겕");
		logger.info("nickname媛� �솗�씤");
		logger.info("memberNickname"+memberNickname);
		
		boolean nicknameExist = service.nicknameCheckForUpdate(memberNickname);
		model.addAttribute("nicknameExist",nicknameExist);
		return nicknameExist;
		
	}
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃�떆 ���젆�듃
	@RequestMapping(value="/ajax/selectForUpdateMemberForStudent", method=RequestMethod.GET)
	public MemberAndAddressVo selectForUpdateMemberForStudent()
	{
		logger.info("selectForUpdateMemberForStudent");
		MemberAndAddressVo memberAndAddressVo = service.selectForUpdateMemberForStudent();
		logger.info(memberAndAddressVo.toString());
		return memberAndAddressVo;
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 異붽� insert
	@RequestMapping(value="/ajax/insertAddressForTeacher", method=RequestMethod.POST)
	public int insertAddressForTeacher(@RequestBody AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("insertAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		return service.insertAddressForTeacher(addressAndClassificationVo);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼由ъ뒪�듃 select
	@RequestMapping(value="/ajax/selectAddressListForTeacher", method=RequestMethod.GET)
	public Map<String, Object> selectAddressListForTeacher()
	{
		logger.info("selectAddressListForTeacher");
		Map<String, Object> addressListMap = service.selectAddressListForTeacher();
		logger.info(addressListMap.toString());
		return addressListMap;
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �뾽�뜲�씠�듃
	@RequestMapping(value="/ajax/updateAddressForTeacher", method=RequestMethod.POST)
	public int updateAddressForTeacher(@RequestBody AddressAndClassificationVo addressAndClassificationVo)
	{
		logger.info("updateAddressForTeacher");
		logger.info(addressAndClassificationVo.toString());
		
		return service.updateAddressForTeacher(addressAndClassificationVo);
	}
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �궘�젣
	@RequestMapping(value="/ajax/deleteAddressForTeacher", method=RequestMethod.POST)
	public int deleteAddressForTeacher(@RequestBody int addressNo)
	{
		logger.info("updateAddressForTeacher");
		
		return service.deleteAddressForTeacher(addressNo);
	}

	//留대쾭�룷�씤�듃 媛�吏�怨� �삤湲�
	@RequestMapping(value="/ajax/selectMemberPoint", method=RequestMethod.GET)
	public int selectMemberPoint() 
	{
		logger.info("selectMemberPoint");
		int memberPoint = service.selectMemberPoint();
		logger.info(Integer.toString(memberPoint));
		return memberPoint;
	}
	
	//�쉶�썝 �룷�씤�듃 異⑹쟾 �궡�뿭 由ъ뒪�듃 select
	@RequestMapping(value="/ajax/selectPointHistoryList", method=RequestMethod.GET)
	public Map<String, Object> selectPointHistoryList()
	{
		logger.info("selectPointHistoryList");
		Map<String, Object> pointListMap = service.selectPointHistoryList();
		logger.info(pointListMap.toString());
		
		return pointListMap;
	}
	
	//�룷�씤�듃 �솚�쟾 �궡�뿭 insert
	@RequestMapping(value="/ajax/insertPointExchangeHistory", method=RequestMethod.POST)
	public int insertPointExchangeHistory(@RequestBody MemberPointExchangeVo memberPointExchangeVo)
	{
		logger.info("insertPointExchangeHistory");
		logger.info(memberPointExchangeVo.toString());
		int result = service.insertPointExchangeHistory(memberPointExchangeVo);
		return result;
	}
	
	//최근한달 포인트 환전내역 select
	@RequestMapping(value="/ajax/selectPointExchangeList", method=RequestMethod.GET)
	public Map<String, Object> selectPointExchangeList()
	{
		logger.info("selectPointExchangeList 호출");
		logger.info("RestController 포인트 환전내역 select");
		
		//서비스 호출후 리턴 받은 맵 뷰에 리턴
		Map<String, Object> pointExchangeListMap = service.selectPointExchangeList();
		logger.info(pointExchangeListMap.toString());
		return pointExchangeListMap;
	}
	
}

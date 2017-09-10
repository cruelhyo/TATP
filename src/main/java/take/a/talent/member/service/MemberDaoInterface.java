package take.a.talent.member.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import take.a.talent.member.vo.AddressAndClassificationVo;
import take.a.talent.member.vo.IdChecker;
import take.a.talent.member.vo.MemberAccountVo;
import take.a.talent.member.vo.MemberAndAddressVo;
import take.a.talent.member.vo.MemberPointExchangeVo;
import take.a.talent.member.vo.MemberPointVo;

//import com.mysql.fabric.xmlrpc.base.Member;

import take.a.talent.member.vo.MemberVo;


@Transactional
public interface MemberDaoInterface {
	//�쉶�썝媛��엯
	int insertMember(MemberVo memberVo);

	//�쉶�썝媛��엯�떆 �븘�씠�뵒 以묐났泥댄겕
	boolean idCheck(String memberId);
	
	//�쉶�썝媛��엯�떆 �땳�꽕�엫 泥댄겕
	boolean nicknameCheck(String memberNickname);
	
	//�쉶�썝(媛뺤궗) �뾽�뜲�씠�듃
	int updateMember(MemberVo memberVo);
	
	//�쉶�썝 �뾽�뜲�씠�듃 �떆 ���젆�듃
	MemberVo selectForUpdateMember();
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃
	int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo);
	
	//�쉶�썝(�븰�깮) �뾽�뜲�씠�듃�떆 ���젆�듃
	MemberAndAddressVo selectForUpdateMemberForStudent();

	//�쉶�썝(媛뺤궗) 怨꾩쥖 insert
	int insertAccount(MemberAccountVo memberAccountVo);
	
	//�뾽�뜲�씠�듃�떆 �땳�꽕�엫 泥댄겕瑜� �쐞�븳 ���젆�듃
	String nicknameCheckForUpdate(String memberId);
	
	//�쉶�썝(媛뺤궗) 二쇱냼 insert
	int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo);
	
	//�쉶�썝 member_no select
	int selectMemberNo(String memberId);
	
	//�쉶�썝(媛뺤궗) 二쇱냼由ъ뒪�듃 select
	List<AddressAndClassificationVo> selectAddressListForTeacher(int memberNo);

	//�룷�씤�듃 異⑹쟾
	int insertPointCharge(MemberPointVo memberPointVo);
	
	//留대쾭 �뀒�씠釉� �룷�씤�듃 �뾽�뜲�씠�듃
	int updatePointForMember(MemberVo memberVo);
	
	//�쉶�썝 �룷�씤�듃 媛��졇�삤湲�
	int selectMemberPoint(int memberNo);
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �뾽�뜲�씠�듃
	int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo);
	
	//�쉶�썝(媛뺤궗) 二쇱냼 �궘�젣
	int deleteAddressForTeacher(int address_no);
	
	//�쉶�썝 �룷�씤�듃 異⑹쟾 �궡�뿭 由ъ뒪�듃 select
	List<MemberPointVo> selectPointHistoryList(int memberNo);
	
	//�룷�씤�듃 �솚�쟾 �궡�뿭 insert
	int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo);
	
	//최근 한달 포인트 환전 내역 select
	List<MemberPointExchangeVo> selectPointExchangeList(int memberNo);
}

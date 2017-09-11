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
import take.a.talent.member.vo.TeacherVo;


@Transactional
public interface MemberDaoInterface {
	//회원가입
	int insertMember(MemberVo memberVo);

	//회원가입시 아이디 중복체크
	boolean idCheck(String memberId);
	
	//회원가입시 닉네임 체크
	boolean nicknameCheck(String memberNickname);
	
	//회원(강사) 업데이트
	int updateMember(MemberVo memberVo);
	
	//회원 업데이트 시 셀렉트
	MemberVo selectForUpdateMember();
	
	//회원(학생) 업데이트
	int updateMemberForStudent(MemberAndAddressVo memberAndAddressVo);
	
	//회원(학생) 업데이트시 셀렉트
	MemberAndAddressVo selectForUpdateMemberForStudent();

	//회원(강사) 계좌 insert
	int insertAccount(MemberAccountVo memberAccountVo);
	
	//업데이트시 닉네임 체크를 위한 셀렉트
	String nicknameCheckForUpdate(String memberId);
	
	//회원(강사) 주소 insert
	int insertAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo);
	
	//회원 member_no select
	int selectMemberNo(String memberId);
	
	//회원(강사) 주소리스트 select
	List<AddressAndClassificationVo> selectAddressListForTeacher(int memberNo);

	//포인트 충전하기
	int insertPointCharge(MemberPointVo memberPointVo);
	
	//포인트 충전시 member업데이트
	int updatePointForMember(MemberVo memberVo);
	
	//현재 회원이 가지고 있는 포인트 가져오기
	int selectMemberPoint(int memberNo);
	
	//회원(강사) 주소 업데이트
	int updateAddressForTeacher(AddressAndClassificationVo addressAndClassificationVo);
	
	//회원(강사) 주소 삭제
	int deleteAddressForTeacher(int address_no);
	
	//포인트 충전 내역 리스트 select
	List<MemberPointVo> selectPointHistoryList(int memberNo);
	
	//포인트 환전 내역 insert
	int insertPointExchangeHistory(MemberPointExchangeVo memberPointExchangeVo);
	
	//최근 한달 포인트 환전 내역 select
	List<MemberPointExchangeVo> selectPointExchangeList(int memberNo);
	
	//teacher account no select
	int selectTeacherAccountNo(int memberNo);
	
	//계좌등록시 teacher테이블 업데이트
	int updateTeacherWhenInsertAccount(TeacherVo teacherVo);
	
	//계좌 업데이트시 select
	MemberAccountVo selectTeacherAccountForUpdate(int teacherAccountNo);
	
	//계좌 업데이트
	int updateTeacherAccount(MemberAccountVo memberAccountVo);
	
}

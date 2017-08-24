package take.a.talent.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.talent.member.vo.MemberVo;

@Repository
public class MemberDao implements MemberDaoInterface{
		
	//sql문 작동시킬 sqlsession의 자동 객체화 
	@Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	//회원정보 입력을 위한 메서드 선언
	@Override
	public int insertMember(MemberVo memberVo) {
		System.out.println("MemberDao memberInsert : "+memberVo);
		return sqlSessionTemplate.insert("take.a.talent.member.service.MemberMapper.insertMember", memberVo);
	}
	
}

package com.hanker.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hanker.DTO.MemberVO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sql;

	public List<MemberVO> memList(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sql.selectList("memberMapper.memList", memberVO);
	}

	public List<HashMap<String, Object>> memJoinList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("memberMapper.memJoinList", null);
	}

	public void memCheck(String userId) throws Exception{
		sql.update("memberMapper.memCheck", userId);
	}

	public void memGradeChg(String userId) throws Exception{
		sql.update("memberMapper.memGradeChg", userId);
	}

	public void memExpire(MemberVO memberVO) throws Exception {
		sql.update("memberMapper.memExpire", memberVO);
		sql.update("memberMapper.memExpireUser", memberVO);
	}

	
}

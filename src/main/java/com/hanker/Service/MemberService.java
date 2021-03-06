package com.hanker.Service;

import java.util.HashMap;
import java.util.List;

import com.hanker.DTO.MemberVO;

public interface MemberService {

	public List<MemberVO> memList(MemberVO memberVO) throws Exception;

	public void memCheck(String userId) throws Exception;

	public void memGradeChg(String userId) throws Exception;

	public void memExpire(MemberVO memberVO) throws Exception;

}

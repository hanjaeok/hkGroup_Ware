package com.hanker.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hanker.DTO.NoticeBoardVO;
import com.hanker.DTO.NoticeFileVO;
import com.hanker.DTO.RepleVO;

@Repository
public class HkGroupMainDAO {
	
	@Inject
	private SqlSession sql;

	public List<NoticeBoardVO> listAll() throws Exception{
		return sql.selectList("hkGroupMainMapper.listAll", null);
	}

	public String getWriter(String username) throws Exception{
		return sql.selectOne("hkGroupMainMapper.getWriter", username);
	}
	
	public int getUserNum(String username) {
		return sql.selectOne("hkGroupMainMapper.getUserNum", username);
	}

	public void noticeBoardWrite(NoticeBoardVO noticeBoardVO) {
		sql.insert("hkGroupMainMapper.noticeBoardWrite", noticeBoardVO);
	}

	public NoticeBoardVO noticeBoardView(int nbno) {
		return sql.selectOne("hkGroupMainMapper.noticeBoardView", nbno);
	}

	public void insReple(RepleVO repleVO) {
		sql.insert("hkGroupMainMapper.insReple", repleVO);
	}

	public List<RepleVO> viewReple(int nbno) throws Exception{
		return sql.selectList("hkGroupMainMapper.viewReple", nbno);
	}

	public void boardViewCnt(int nbno) throws Exception {
		sql.update("hkGroupMainMapper.boardViewCnt", nbno);
	}

	public void nbUpdate(NoticeBoardVO nbVO) throws Exception {
		sql.update("hkGroupMainMapper.nbUpdate", nbVO);
	}

	public void fileIns(NoticeFileVO nfVO) throws Exception {
		sql.insert("hkGroupMainMapper.fileIns", nfVO);
	}

	public int getNbno() throws Exception{
		return sql.selectOne("hkGroupMainMapper.getNbno");
	}

	public List<NoticeFileVO> nbFileList(int nbno) throws Exception{
		return sql.selectList("hkGroupMainMapper.nbFileList", nbno);
	}

	public void updNoBoard(int nbno) throws Exception{
		sql.update("hkGroupMainMapper.updNoBoard", nbno);
	}

	

}

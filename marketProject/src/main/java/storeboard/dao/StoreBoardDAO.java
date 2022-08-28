package storeboard.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import storeboard.bean.StoreBoardDTO;

@Repository("storeboardDAO")
public class StoreBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 목록보기
	public List<StoreBoardDTO> storeboardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return sqlSession.selectList("mybatis.storeboardMapper.storeboardList", map);

	}

	// 목록보기
	public List<StoreBoardDTO> storeboardsiGu(String city, String gu) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("city", city);
		map.put("gu", gu);
		return sqlSession.selectList("mybatis.storeboardMapper.storeboardsiGu", map);
	}

	// 전체 글수 구하기
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.storeboardMapper.getTotalA");
	}

	// 글저장
	public int storeboardWrite(StoreBoardDTO dto) {
		return sqlSession.insert("mybatis.storeboardMapper.storeboardWrite", dto);
	}

	// 상세보기
	// 글 1개 보기
	public StoreBoardDTO storeboardView(int seq) {
		return sqlSession.selectOne("mybatis.storeboardMapper.storeboardView", seq);
	}

	// 글 수정
	public int storeboardModify(StoreBoardDTO dto) {
		return sqlSession.update("mybatis.storeboardMapper.storeboardModify", dto);
	}

	// 글 삭제
	public int storeboardDelete(int seq) {
		System.out.println("seq ="+ seq);
		return sqlSession.delete("mybatis.storeboardMapper.storeboardDelete", seq);
	}

	// 댓글 등록
	public int insertReply(StoreBoardDTO dto) {
		sqlSession.update("mybatis.storeboardMapper.updateReply", dto);
		return sqlSession.insert("mybatis.storeboardMapper.insertReply", dto);
	}

	// 댓글 상세보기
	public List<StoreBoardDTO> replyView(int re_ref) {
		return sqlSession.selectList("mybatis.storeboardMapper.replyView", re_ref);
	}

	// 댓글 수정
	public int replyModify(StoreBoardDTO dto) {
		return sqlSession.update("mybatis.storeboardMapper.replyModify", dto);
	}
	//나의 동네상세페이지
	public List<StoreBoardDTO> myDongne(String id) {
	      return sqlSession.selectList("mybatis.storeboardMapper.myDongne", id);
	   }

}

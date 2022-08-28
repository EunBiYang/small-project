package market.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.bean.MarketDTO;

@Repository("dao")
public class MarketDAO {
	public MarketDAO() {}
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//새 개시글
	public int marketWrite(MarketDTO dto) {
		return sqlSession.insert("mybatis.marketMapper.marketWrite",dto);
	}
	
	//리스트 조회수 기준 내림차순 출력
	public List<MarketDTO> marketList(){
		return sqlSession.selectList("mybatis.marketMapper.marketList");
	}
	
	//시구별 리스트 조회
	public List<MarketDTO> marketsiGu(String city, String gu){
		Map<String, String> map = new HashMap<String, String>();
		map.put("city", city);
		map.put("gu", gu);
		return sqlSession.selectList("mybatis.marketMapper.marketsiGu",map);
	}
	//게시글 1개
	public MarketDTO marketView(int seq) {
		return sqlSession.selectOne("mybatis.marketMapper.marketView", seq);
	}
	//전체 게시글수
	public int getTotal() {
		return sqlSession.selectOne("mybatis.marketMapper.getTotal");
	}
	//조회수 증가
	public int getHit(int seq) {
		return sqlSession.update("mybatis.marketMapper.getHit",seq);
	}
	
	public int insertReply(MarketDTO dto) {
		sqlSession.update("mybatis.marketMapper.updateReply",dto);
		return sqlSession.insert("mybatis.marketMapper.insertReply",dto);
	}
	
	public List<MarketDTO> replyView(int re_ref){
		return sqlSession.selectList("mybatis.marketMapper.replyView",re_ref);
	}

	public int updateHit(int seq) {
		return sqlSession.update("mybatis.marketMapper.updateHit",seq);
	}
	
	public List<MarketDTO> popular_products(){
		return sqlSession.selectList("mybatis.marketMapper.popular_products");
	}

	public int marketDelete(int seq) {
		return sqlSession.delete("mybatis.marketMapper.marketDelete",seq);
	}
	
	public int marketModify(MarketDTO dto) {
		return sqlSession.update("mybatis.marketMapper.marketModify",dto);
	}
	
	public int replyModify(MarketDTO dto) {
		return sqlSession.update("mybatis.marketMapper.replyModify",dto);
	}
	
	public List<MarketDTO> myProduct(String id){
		return sqlSession.selectList("mybatis.marketMapper.myProduct",id);
	}
	

}

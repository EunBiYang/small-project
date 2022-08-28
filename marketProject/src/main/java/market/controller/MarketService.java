package market.controller;

import java.util.List;
import market.bean.MarketDTO;

public interface MarketService {
	//새 개시글
		public int marketWrite(MarketDTO dto);
		//리스트 출력
		public List<MarketDTO> marketList();
		//지역구별 리스트 출력
		public List<MarketDTO> marketsiGu(String city, String gu);
		//게시글 1개
		public MarketDTO marketView(int seq);
		//전체 게시글수
		public int getTotal();
		//조회수 증가
		public int getHit(int seq);
		
		public int insertReply(MarketDTO dto);

		public List<MarketDTO> replyView(int re_ref);

		public int updateHit(int seq);

		public List<MarketDTO> popular_products();

		public int marketDelete(int seq);

		public int marketModify(MarketDTO dto);

		public int replyModify(MarketDTO dto);
		public List<MarketDTO> myProduct(String id);
}

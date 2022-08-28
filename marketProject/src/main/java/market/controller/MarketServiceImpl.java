package market.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.bean.MarketDTO;
import market.dao.MarketDAO;

@Service
public class MarketServiceImpl implements MarketService {
	@Autowired
	private MarketDAO dao;

	@Override
	public int marketWrite(MarketDTO dto) {
		return dao.marketWrite(dto);
	}

	@Override
	public List<MarketDTO> marketList() {
		return dao.marketList();
	}
	@Override
	public List<MarketDTO> marketsiGu(String city, String gu) {
		return dao.marketsiGu(city, gu);
	}
	@Override
	public MarketDTO marketView(int seq) {
		return dao.marketView(seq);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public int getHit(int seq) {
		return dao.getHit(seq);
	}

	@Override
	public int insertReply(MarketDTO dto) {
		return dao.insertReply(dto);
	}

	@Override
	public List<MarketDTO> replyView(int re_ref) {
		return dao.replyView(re_ref);
	}

	@Override
	public int updateHit(int seq) {
		return dao.updateHit(seq);
	}

	@Override
	public List<MarketDTO> popular_products() {
		return dao.popular_products();
	}

	@Override
	public int marketDelete(int seq) {
		return dao.marketDelete(seq);
	}

	@Override
	public int marketModify(MarketDTO dto) {
		return dao.marketModify(dto);
	}

	@Override
	public int replyModify(MarketDTO dto) {
		
		return dao.replyModify(dto);
	}
	@Override
	public List<MarketDTO> myProduct(String id){
		return dao.myProduct(id);
	}

}

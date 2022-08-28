package storeboard.controller;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import storeboard.bean.StoreBoardDTO;
import storeboard.dao.StoreBoardDAO;

@Service
public class StoreBoardServiceImpl implements StoreBoardService{
	@Autowired
	private StoreBoardDAO dao;

	//가게 리스트
	@Override
	public List<StoreBoardDTO> storeboardsiGu(String city, String gu) {
		return dao.storeboardsiGu(city, gu);
	}
	// 총 글수
	@Override
	public int getTotalA() {
		return dao.getTotalA();
	}
	// 총 글수
	@Override
	public StoreBoardDTO storeboardView(int seq) {
		return dao.storeboardView(seq);
	}
	// 가게 등록
	@Override
	public int storeboardWrite(StoreBoardDTO dto) {
		return dao.storeboardWrite(dto);
	}
	// 가게 수정
	@Override
	public int storeboardModify(StoreBoardDTO dto) {
		return dao.storeboardModify(dto);
	}
	// 가게 삭제
	@Override
	public int storeboardDelete(int seq) {
		return dao.storeboardDelete(seq);
	}
	// 댓글 등록
	@Override
	public int insertReply(StoreBoardDTO dto) {
		return dao.insertReply(dto);
	}
	// 댓글 상세보기
	@Override
	public List<StoreBoardDTO> replyView(int re_ref) {
		return dao.replyView(re_ref);
	}
	// 댓글 수정
	@Override
	public int replyModify(StoreBoardDTO dto) {
		return dao.replyModify(dto);
	}
	// 마이 페이지(가게)
	@Override
	   public List<StoreBoardDTO> myDongne(String id) {
	      return dao.myDongne(id);
	   }
	

}

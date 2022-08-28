package storeboard.controller;

import java.util.List;


import storeboard.bean.StoreBoardDTO;




public interface StoreBoardService {
	//가게 리스트
	public List<StoreBoardDTO> storeboardsiGu(String city, String gu);
	// 총 글수
	public int getTotalA();
	// 가게 상세보기
	public StoreBoardDTO storeboardView(int seq);
	// 가게 등록
	public int storeboardWrite(StoreBoardDTO dto);
	// 가게 수정
	public int storeboardModify(StoreBoardDTO dto);
	// 마이 페이지(가게)
	public List<StoreBoardDTO> myDongne(String id);
    // 가게 삭제
	public int storeboardDelete(int seq);
	
	// 댓글 등록
	public int insertReply(StoreBoardDTO dto);
		
	// 댓글 상세보기
	public List<StoreBoardDTO> replyView(int re_ref);
		
	// 댓글 수정
	public int replyModify(StoreBoardDTO dto);

}

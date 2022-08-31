package market.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.annotation.SessionAttributesHandler;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import market.bean.MarketDTO;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(value = "/main/main.do")
	public String main(HttpServletRequest request) {
		return "../main/main.jsp";
	}
	@RequestMapping(value = "/market/marketMain.do")
	public ModelAndView marketMain(HttpServletRequest request) {
		request.setAttribute("req", "../market/marketMain.jsp");
		//리스트 생성( 조회수 기준 내림차순)
		List<MarketDTO> list = marketService.marketList();
		int total = marketService.getTotal();
		
		//화면 내비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",list);
		modelAndView.addObject("total", total);
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/market/siGu.do")
	public ModelAndView siGu(HttpServletRequest request) {
		request.setAttribute("req", "../market/siGu.jsp");
		
		String city = request.getParameter("city");
		String gu = request.getParameter("gu");
		
		//리스트(시,구 검색 결과)
		List<MarketDTO> siguList = marketService.marketsiGu(city, gu);
		
		//화면 내비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("siguList",siguList);
		modelAndView.addObject("city", city);
		modelAndView.addObject("gu", gu);
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/market/addWriteForm.do")
	public ModelAndView addWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../market/addWriteForm.jsp");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/market/addWriteResult.do")
	public ModelAndView addWriteResult(HttpServletRequest request, MultipartFile image,MultipartFile image2,MultipartFile image3) {
		
		request.setAttribute("req", "../market/addWriteResult.jsp");
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName= image.getOriginalFilename();
		String fileName2= image2.getOriginalFilename();
		String fileName3= image3.getOriginalFilename();
		
		
		System.out.println("fileName = "+fileName);
		System.out.println("filePath = "+filePath);
		
		//파일이름 수동 저장
		File file = new File(filePath, fileName);
		File file2 = new File(filePath, fileName2);
		File file3 = new File(filePath, fileName3);
		try {
			FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(file));
			FileCopyUtils.copy(image2.getInputStream(), new FileOutputStream(file2));
			FileCopyUtils.copy(image3.getInputStream(), new FileOutputStream(file3));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//사진 pImage , 제목 pName , 카테고리, 지역 city gu, 내용  pContent
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("memId");
		MarketDTO dto = new MarketDTO();
		dto.setId(id);
		dto.setTitle(request.getParameter("title"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setCity(request.getParameter("category1"));
		dto.setGu(request.getParameter("category2"));
		dto.setContent(request.getParameter("content"));
		dto.setImage(fileName);
		dto.setImage2(fileName2);
		dto.setImage3(fileName3);
		
		int result = marketService.marketWrite(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result",result);
		modelAndView.addObject("dto",dto);
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/board/marketView.do")
	public ModelAndView marketView(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 데이터 처리
		request.setAttribute("req", "../board/marketView.jsp");
		int seq = Integer.parseInt(request.getParameter("seq"));

		marketService.updateHit(seq); // 조회수
		MarketDTO dto = marketService.marketView(seq);
		List<MarketDTO> reply_list = marketService.replyView(seq);
		System.out.println("확인  = "+reply_list.size());
		List<MarketDTO> list = marketService.popular_products();
		List<String> img_list = new ArrayList<String>();

		if (dto.getImage() != null) {
			img_list.add(dto.getImage());
		}
		if (dto.getImage2() != null) {
			img_list.add(dto.getImage2());
		}
		if (dto.getImage3() != null) {
			img_list.add(dto.getImage3());
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("reply_list", reply_list);
		modelAndView.addObject("list", list);
		modelAndView.addObject("img_list", img_list);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/board/marketModifyForm.do")
	public ModelAndView marketModifyForm(HttpServletRequest request) {
		request.setAttribute("req", "../board/marketModifyForm.jsp");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MarketDTO dto = marketService.marketView(seq);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/board/marketModify.do")
	public ModelAndView marketModify(HttpServletRequest request, MultipartFile image, MultipartFile image2,
			MultipartFile image3) {
		
		request.setAttribute("req", "../board/marketModify.jsp");
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = image.getOriginalFilename();
		String fileName2 = image2.getOriginalFilename();
		String fileName3 = image3.getOriginalFilename();

		// jsp 에서 MultipartRequest가 자동으로 저장시키지만 여기서는 수동으로 저장시킴

		File file = new File(filePath, fileName);
		File file2 = new File(filePath, fileName2);
		File file3 = new File(filePath, fileName3);

		try {
			FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(file));
			FileCopyUtils.copy(image2.getInputStream(), new FileOutputStream(file2));
			FileCopyUtils.copy(image3.getInputStream(), new FileOutputStream(file3));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MarketDTO dto = new MarketDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));

		dto.setCity(request.getParameter("category1"));
		dto.setGu(request.getParameter("category2"));
		dto.setContent(request.getParameter("content"));
		dto.setImage(fileName);
		dto.setImage2(fileName2);
		dto.setImage3(fileName3);
		dto.setSeq(seq);
		System.out.print(dto.toString());
		int result = marketService.marketModify(dto);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("seq", seq);

		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/board/marketDelete.do")
	public ModelAndView marketDelete(HttpServletRequest request) {
		request.setAttribute("req", "../board/marketDelete.jsp");
		int result = 0;
		int seq = Integer.parseInt(request.getParameter("seq"));
		result = marketService.marketDelete(seq);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;

	}

	@RequestMapping(value = "/board/replyWrite.do")
	public ModelAndView replyWrite(HttpServletRequest request) {
		
		request.setAttribute("req", "../board/replyWrite.jsp");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("memId");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String reply_content = request.getParameter("reply_content");
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		int re_seq = Integer.parseInt(request.getParameter("re_seq"));
		int re_lev = Integer.parseInt(request.getParameter("re_lev"));
		
		MarketDTO dto = new MarketDTO();
		dto.setId(id);
		dto.setContent(reply_content);
		dto.setRe_ref(re_ref);
		dto.setRe_seq(re_seq);
		dto.setRe_lev(re_lev);
		dto.setHit(0);
		int result = marketService.insertReply(dto);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/board/replyModify.do")
	public ModelAndView replyModify(HttpServletRequest request) {
		request.setAttribute("req", "../board/replyModify.jsp");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String reply_content = request.getParameter("reply_content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		int re_seq = Integer.parseInt(request.getParameter("re_seq"));
		int re_lev = Integer.parseInt(request.getParameter("re_lev"));

		MarketDTO dto = new MarketDTO();
		dto.setSeq(seq);
		dto.setContent(reply_content);
		dto.setRe_ref(re_ref);
		dto.setRe_seq(re_seq);
		dto.setRe_lev(re_lev);
		dto.setHit(0);

		int result = marketService.replyModify(dto);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seq", re_ref);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/board/replyDelete.do")
	public ModelAndView replyDelete(HttpServletRequest request) {
		request.setAttribute("req", "../board/replyDelete.jsp");
		int result = 0;
		int seq = Integer.parseInt(request.getParameter("seq"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		result = marketService.marketDelete(seq);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seq", re_ref);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value = "/board/myProduct.do")
	public ModelAndView myProduct(HttpServletRequest request) {
		request.setAttribute("req_mem", "../board/myProduct.jsp");
	
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("memId");
		List<MarketDTO> list = marketService.myProduct(id);
		
		//화면 내비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req","../member/myPage.jsp");
		modelAndView.addObject("list",list);
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}

}




























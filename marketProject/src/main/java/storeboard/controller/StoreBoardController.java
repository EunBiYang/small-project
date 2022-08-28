package storeboard.controller;

import java.io.File;





import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import storeboard.bean.StoreBoardDTO;
import storeboard.dao.StoreBoardDAO;

@Controller
public class StoreBoardController {
	@Autowired
	private StoreBoardService storeboardService;

	@RequestMapping(value = "/storeboard/dongne_main.do")
	public String dongne_main(HttpServletRequest request) {
		request.setAttribute("req", "../storeboard/dongne_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping(value="/storeboard/storeboardWriteForm.do")
	public ModelAndView storeboardWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../storeboard/storeboardWriteForm.jsp");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	
	
	//가게 등록
	@RequestMapping(value="/storeboard/storeboardWrite.do")
	public ModelAndView storeboardWrite(HttpServletRequest request, MultipartFile image1) {
		request.setAttribute("req", "../storeboard/storeboardWrite.jsp");
		
		 String filePath = request.getSession().getServletContext().getRealPath("/storage");
	     String fileName = image1.getOriginalFilename();
	      
	      File file = new File(filePath, fileName);
	     
	      try {
	         FileCopyUtils.copy(image1.getInputStream(), new FileOutputStream(file));
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
		 
	   
	      HttpSession session=request.getSession();
		  String id=(String) session.getAttribute("memId");
		  String name=(String) session.getAttribute("memName");
		 
		 System.out.println("id = "+id);
		 System.out.println("name = "+name);
		  
	      StoreBoardDTO dto = new StoreBoardDTO();
	      dto.setName(name);
		  dto.setId(id);
	      dto.setCity(request.getParameter("category1"));
		  dto.setGu(request.getParameter("category2"));
	      dto.setStoreName(request.getParameter("storeName"));
	      dto.setStorePlace(request.getParameter("storePlace"));
	      dto.setStoreNum(request.getParameter("storeNum"));
	      dto.setStoreCategory(request.getParameter("storeCategory"));
	      dto.setStoreContent(request.getParameter("storeContent"));
	      dto.setImage1(fileName);
	      
	      
		  int result = storeboardService.storeboardWrite(dto);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("dto",dto);
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	//가게 리스트
	@RequestMapping(value="/storeboard/storeboardList.do")
	public ModelAndView storeboardList(HttpServletRequest request) {
		request.setAttribute("req", "../storeboard/storeboardList.jsp");
		
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		String city = request.getParameter("city");
		String gu = request.getParameter("gu");
		List<StoreBoardDTO> siguList = storeboardService.storeboardsiGu(city, gu);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("siguList",siguList);
		modelAndView.addObject("city", city);
		modelAndView.addObject("gu", gu);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}

	
	
        // 가게 상세보기
		@RequestMapping(value = "/storeboard/storeboardView.do")
		public ModelAndView storeboardView(HttpServletRequest request) {
			request.setAttribute("req", "../storeboard/storeboardView.jsp");
			
			int seq = Integer.parseInt(request.getParameter("seq"));
			

			StoreBoardDTO dto = storeboardService.storeboardView(seq); // �긽�꽭蹂닿린
			List<StoreBoardDTO> reply_list = storeboardService.replyView(seq);

			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("reply_list", reply_list);
			modelAndView.addObject("seq", seq);
			
			modelAndView.addObject("dto", dto);
			modelAndView.setViewName("../main/main.jsp");		

			return modelAndView;
		}
	
	@RequestMapping(value="/storeboard/storeboardModifyWriteForm.do")
	public ModelAndView storeboardModifyWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../storeboard/storeboardModifyWriteForm.jsp");
		
		 int seq = Integer.parseInt(request.getParameter("seq"));

		 
		 StoreBoardDTO dto = storeboardService.storeboardView(seq);
		 
		
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("seq", seq);
			
			modelAndView.addObject("dto", dto);
			modelAndView.setViewName("../main/main.jsp");
			
			return modelAndView;
		}
	
	
	// 가게 수정
		@RequestMapping(value="/storeboard/storeboardModify.do")
		public ModelAndView storeboardModify(HttpServletRequest request, MultipartFile image1) {
			request.setAttribute("req", "../storeboard/storeboardModify.jsp");
			
			String filePath = request.getSession().getServletContext().getRealPath("/storage");
		     String fileName = image1.getOriginalFilename();
		      
		      File file = new File(filePath, fileName);
		     
		      try {
		         FileCopyUtils.copy(image1.getInputStream(), new FileOutputStream(file));
		      } catch (FileNotFoundException e) {
		         e.printStackTrace();
		      } catch (IOException e) {
		         e.printStackTrace();
		      }
		      
		    int seq = Integer.parseInt(request.getParameter("seq"));
			
			
			StoreBoardDTO dto = new StoreBoardDTO();
			 HttpSession session=request.getSession();
			  String id=(String) session.getAttribute("memId");
			  String name=(String) session.getAttribute("memName");
		    dto.setCity(request.getParameter("category1"));
		   
		    System.out.println("city"+ dto.getCity());
		   
			dto.setGu(request.getParameter("category2"));
		    dto.setStoreName(request.getParameter("storeName"));
		    dto.setStorePlace(request.getParameter("storePlace"));
		    dto.setStoreNum(request.getParameter("storeNum"));
		    dto.setStoreCategory(request.getParameter("storeCategory"));
		    dto.setStoreContent(request.getParameter("storeContent"));
		    dto.setImage1(fileName);
			dto.setSeq(Integer.parseInt(request.getParameter("seq")));
			
			int result = storeboardService.storeboardModify(dto);
			
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("result", result);
			modelAndView.addObject("dto", dto);
			modelAndView.addObject("seq", seq);
			
			
			modelAndView.setViewName("../main/main.jsp");
			
			return modelAndView;
		}
	
	      
	      

		
		// 가게 삭제
		@RequestMapping(value="/storeboard/storeboardDelete.do")
		public ModelAndView storeboardDelete(HttpServletRequest request) {
			request.setAttribute("req", "../storeboard/storeboardDelete.jsp");
			
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			
			int result = storeboardService.storeboardDelete(seq);
			
			
		
			ModelAndView modelAndView = new ModelAndView();
			
			modelAndView.addObject("result", result);
			
			modelAndView.setViewName("../main/main.jsp");
			
			return modelAndView;
		}
		
		// 댓글 등록
        @RequestMapping(value = "/storeboard/replyWrite.do")
        public ModelAndView replyWrite(HttpServletRequest request) {
           request.setAttribute("req", "../storeboard/replyWrite.jsp");
           
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

           StoreBoardDTO dto = new StoreBoardDTO();
           dto.setId(id);
           dto.setStoreContent(reply_content);
           dto.setRe_ref(re_ref);
           dto.setRe_seq(re_seq);
           dto.setRe_lev(re_lev);

           int result = storeboardService.insertReply(dto);

           ModelAndView modelAndView = new ModelAndView();
           modelAndView.addObject("seq", seq);
           modelAndView.addObject("result", result);
           modelAndView.setViewName("../main/main.jsp");

           return modelAndView;
        }

     // 댓글수정
     @RequestMapping(value = "/storeboard/replyModify.do")
     public ModelAndView replyModify(HttpServletRequest request) {
        request.setAttribute("req", "../storeboard/replyModify.jsp");
        
        try {
           request.setCharacterEncoding("euc-kr");
        } catch (UnsupportedEncodingException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }

        String reply_content = request.getParameter("reply_content");
        int seq = Integer.parseInt(request.getParameter("seq"));
        int re_ref = Integer.parseInt(request.getParameter("re_ref"));
        int re_seq = Integer.parseInt(request.getParameter("re_seq"));
        int re_lev = Integer.parseInt(request.getParameter("re_lev"));

        StoreBoardDTO dto = new StoreBoardDTO();
        dto.setSeq(seq);
        dto.setStoreContent(reply_content);
        dto.setRe_ref(re_ref);
        dto.setRe_seq(re_seq);
        dto.setRe_lev(re_lev);

        int result = storeboardService.replyModify(dto);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("seq", re_ref);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("../main/main.jsp");

        return modelAndView;
     }

		@RequestMapping(value = "/storeboard/replyDelete.do")
		public ModelAndView replyDelete(HttpServletRequest request) {
			request.setAttribute("req", "/storeboard/replyDelete.jsp");
			
			int result = 0;
			int seq = Integer.parseInt(request.getParameter("seq"));
			int re_ref = Integer.parseInt(request.getParameter("re_ref"));

			result = storeboardService.storeboardDelete(seq);

			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("seq", re_ref);
			modelAndView.addObject("result", result);
			modelAndView.setViewName("../main/main.jsp");

			return modelAndView;
		}
		@RequestMapping(value = "/storeboard/myDongne.do")
		   public ModelAndView myDongne(HttpServletRequest request) {
		      request.setAttribute("req_mem", "../storeboard/myDongne.jsp");
             
		      HttpSession session = request.getSession();
		      String id = (String) session.getAttribute("memId");
		      List<StoreBoardDTO> list = storeboardService.myDongne(id);
                
		      
			
				
		      // 화면 내비게이션
		      ModelAndView modelAndView = new ModelAndView();
		      modelAndView.addObject("req","../member/myPage.jsp");
		      modelAndView.addObject("list", list);
		      
		      
		      modelAndView.setViewName("../main/main.jsp");
		      return modelAndView;
		   }
	
}

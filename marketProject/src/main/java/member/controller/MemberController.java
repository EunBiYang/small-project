package member.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;


@Controller
public class MemberController {
	
	// css 수정  혹은 멤버 페이지는 include 없이 출력
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/member/login.do")
	public ModelAndView login(HttpServletRequest request) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 

		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// DB
		String name = memberService.login(id, pwd);

		// 화면 네비게이션 = 데이터 공유 + view 처리 파일 선택
		ModelAndView modelAndView = new ModelAndView();
		
		// 로그인 실패
		if (name == null) {
			modelAndView.setViewName("loginFail.do");
			
		// 로그인 성공	
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("memId", id);
			session.setAttribute("memName", name);
			
			modelAndView.setViewName("loginOk.do");
		}	
		return modelAndView;
	}
	
	
	@RequestMapping(value="/member/loginOk.do")
	public String loginOk(HttpServletRequest request) {
		return "../main/main.jsp";
	}
	
	@RequestMapping(value="/member/loginFail.do")
	public String loginFail() {
		return "loginFail.jsp";
	}
	
	@RequestMapping(value="/member/loginForm.do")
	public String loginForm() {
		
		return "../member/loginForm.jsp";
	}
	
	@RequestMapping("/member/writeForm.do")
	public String writeForm() {
		return "../member/writeForm.jsp";
	}
	
	@RequestMapping(value = "/member/write.do")
	public ModelAndView write(HttpServletRequest request) {

		// post 방식 한글설정
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 1. 데이터 처리
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr = request.getParameter("addr");

		// 2. DB 작업
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setGender(gender);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);
		dto.setAddr(addr);

		int result = memberService.write(dto);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("write.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/checkId.do")
	public ModelAndView checkId(HttpServletRequest request) {
		// 데이터
		String id = request.getParameter("id");
		
		// DB 처리
		boolean result = memberService.isExistId(id);
		
		ModelAndView modelAndView= new ModelAndView();
		modelAndView.addObject("result",result);
		modelAndView.addObject("id",id);
		modelAndView.setViewName("checkId.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/member/modifyForm.do")
	public ModelAndView modifyForm(HttpServletRequest request) {
		request.setAttribute("req_mem", "../member/modifyForm.jsp");
		
		// 데이터
		HttpSession session=request.getSession();
		String id = (String) session.getAttribute("memId");
		
		// DB
		MemberDTO dto = memberService.getMember(id);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("req","../member/myPage.jsp");
		modelAndView.addObject("dto",dto);
		modelAndView.setViewName("../main/main.jsp");
	
		return modelAndView;
	}
	
	@RequestMapping(value="/member/modify.do")
	public ModelAndView modify(HttpServletRequest request) {
		request.setAttribute("req_mem", "../member/modify.jsp");
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr = request.getParameter("addr");
		String id = (String) session.getAttribute("memId");	
		
		MemberDTO dto = new MemberDTO();	
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setGender(gender);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);
		dto.setAddr(addr);
		
		int result = memberService.modify(dto);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("req","../member/myPage.jsp");
		modelAndView.addObject("result",result);
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/logout.do")
	public String logout(HttpServletRequest request) {
	
		HttpSession session=request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		return "../member/logout.jsp";
	}
	
	@RequestMapping(value="/member/deleteForm.do")
	public ModelAndView deleteForm(HttpServletRequest request) {
		request.setAttribute("req_mem", "../member/deleteForm.jsp");
		
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ModelAndView modelAndView= new ModelAndView();
		modelAndView.addObject("req","../member/myPage.jsp");
		modelAndView.addObject("id",id);
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/delete.do")
	public ModelAndView delete(HttpServletRequest request) {
		request.setAttribute("req_mem", "../member/delete.jsp");
		
		String id = request.getParameter("id");
		
		//MemberDAO dao = new MemberDAO();
		int result = memberService.delete(id);
		
		HttpSession session=request.getSession();
		// 세션 삭제
		if(result > 0) {
			session.removeAttribute("memName");
			session.removeAttribute("memId");
		}
		ModelAndView modelAndView= new ModelAndView();
		modelAndView.addObject("req","../member/myPage.jsp");
		modelAndView.addObject("result",result);
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberList.do")
	public ModelAndView memberList(HttpServletRequest request) {
		
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 1. 목록처리 
		// => 목록의 수 : 5개
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		//MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = memberService.selectList(startNum, endNum);
		
		// 2. 페이징 처리
		// => 블럭의 수 : 3개
		int totalA = memberService.getTotalMember();	// 총인원수
		int totalP = (totalA + 4) / 5;		// 총페이지수
		
		int startPage = (pg-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;
	
		ModelAndView modelAndView=new ModelAndView();
		   modelAndView.addObject("pg",pg );
		   modelAndView.addObject("list",list );
		   modelAndView.addObject("totalP",totalP );
		   modelAndView.addObject("startPage",startPage );
		   modelAndView.addObject("endPage",endPage );
		   modelAndView.setViewName("memberList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/member/myPage.do")
	public ModelAndView myPage(HttpServletRequest request) {
		

		
		ModelAndView modelAndView=new ModelAndView();
		
		modelAndView.addObject("req","../member/myPage.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
		
		
		
		
	}
	
}







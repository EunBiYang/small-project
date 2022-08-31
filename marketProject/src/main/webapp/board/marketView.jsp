<%@page import="market.bean.MarketDTO"%>
<%@page import="market.dao.MarketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/marketView.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="../script/marketScript.js?v=45"></script>
<script>
	$(document).ready(function() {
		$(".re").click(function() {
			var index = $('.re').index(this);
			$(".re_reply").eq(index).show();
		})

		$(".modify").click(function() {
			var index = $('.modify').index(this);
			$(".re_modify").eq(index).show();
		})

		$(".c").click(function() {
			var index = $('.c').index(this);
			$(".re_reply").eq(index).hide();
		})

		$(".m_c").click(function() {
			var index = $('.m_c').index(this);
			$(".re_modify").eq(index).hide();
		})

		$('.bxslider').bxSlider();
	});
</script>

</head>
<body>
	<section id="content">
		<h1 class="head-title" id="hot-articles-head-title" style="text-align:center; font-size:40px; font-family: PyeongChangPeace-Bold;">중고거래 인기 매물</h1>
		<br><nav id="hot-articles-navigation">
			<div name="region1" id="region1">
				<!-- 버튼 -->
				<input class="button-42" type="button" value="내 물건 올리기"
					onclick="location.href='../market/addWriteForm.do'">
				<input class="button-42" type="button" value="돌아가기" onclick="history.back()">
				<!-- 카테고리 부분 -->
				<span id="category1"></span> <span id="category2"></span>
			</div>
		</nav>
	</section>

	<scetion class="cards-wrap">
	<div id="box">
		<div class="bxslider">
			<c:forEach var="img" items="${img_list}">
				<img src="../storage/${img}" alt="img_slide">
			</c:forEach>
		</div>
	</div>
	<br>


	<div class="user">
		<!-- 데이터  -->
		<a href="#"><img alt="user" src="../img/user.PNG" align="left"></a>
		<div id="nickname" style="font-size: 15px; font-weight: 500; ">${dto.getId()}</div>
		<div id="region" style="font-size: 15px;">${dto.getCity()} ${dto.getGu()}</div>
	</div>
	<hr>

	<div id="description">
		<h2 style="font-size: 22px; font-weight: bold; margin-bottom: 3.6px; margin-top: 10px;">${dto.getTitle()}</h2>
		<p id="price" style="font-size: 15px; font-weight: bold;">${dto.getPrice()}원</p>
		<br>
		<div id="content" style="font-size: 17px; ">${dto.getContent()}</div>
		<br>
		<br>
		<p style="font-size: 13px; color: gray;">조회 ${dto.getHit()}</p>

		<br>
		<br>

		<!-- 작성자 일경우만 창 뜨게끔 처리 -->
		<c:if test="${memId==dto.id}">
		<div id="modify" style="float: right;">
			<a href="marketModifyForm.do?seq=${seq}" style="font-size: 16px;"><img
				src="../img/modify.PNG">수정</a> 
			<a href="marketDelete.do?seq=${seq}" style="font-size: 16px;"><img src="../img/delete.PNG">삭제</a>
		</div>
		</c:if>
		
	</div>
	<hr>
	<br>
	<div id="reply">
		<strong style="font-size: 20px;">댓글 ${reply_list.size()} </strong> <br>
		<br>
		<br>

		<div id="reply_view">
			<c:forEach var="dto" items="${reply_list}">
				<c:if test="${dto.re_lev > 1}">
					<c:forEach var="i" begin="1" end="${dto.re_lev}" step="1">
						<div style="float: left;">&nbsp;&nbsp;&nbsp;</div>
					</c:forEach>
					<%-- 한글 ㅁ 을 치고, 한자키를 누르면 특수키 창이 열림 --%>
				</c:if>

				<img alt="user" src="../img/user.PNG" align="left">
				<p style="font-size: 15px; margin-bottom: 4px;">
					<strong>${dto.id}</strong>
				</p>
				<p style="font-size: 15px;">${dto.content}</p>
				<p style="font-size: 13px; color: gray; display: inline;">${dto.logtime}</p>
				
				<c:if test="${memId==null}">
				<a href="../member/loginForm.do" style="font-size: 13px; color: gray;"> 답글쓰기</a>
				</c:if>
				
				<c:if test="${memId!=null}">
				<a class="re" href="#" style="font-size: 13px; color: gray;"
					onclick="return false;"> 답글쓰기</a>
				</c:if>
				
				
				
				<!-- 작성자만 삭제.수정 가능하게끔 수정 -->
				<c:if test="${memId==dto.id}">
				<a class="modify" href="#"
					style="font-size: 13px; color: gray; float: right;"
					onclick="return false;">수정</a>
				<a href="replyDelete.do?seq=${dto.seq}&re_ref=${dto.re_ref}"
					style="font-size: 13px; color: gray; float: right; margin-right: 3px;">삭제</a>
				</c:if>
				
				<c:if test="${memId!=dto.id}">
				<a class="modify" href="#"></a>
				<a href="#"></a>
				</c:if>
				
				
					
				<hr	style="height: 1px; border: 0; background-color: #dcdcdc; margin-top: 8px;">

				<!-- 작성자 상태일 경우만  수정 가능-->
				<div class="re_modify" id="CommentWriter"
					style="vertical-align: middle; display: none;">
					<p style="margin-bottom: 10px;">닉네임(수정)</p>
					<form action="replyModify.do?seq=${dto.seq}" method="post" >
						<input type="hidden" name="re_lev" value="${dto.getRe_lev()}">
						<input type="hidden" name="re_ref" value="${dto.getRe_ref()}">
						<input type="hidden" name="re_seq" value="${dto.getRe_seq()}">
						<textarea id="replyContent" name="reply_content" rows=1; cols=30;
							placeholder="수정할 내용 입력하세요"></textarea>
						<input id="reply_submit" type="submit" value="등록"> <a
							class="m_c" href="#"
							style="font-size: 13px; color: gray; float: right; margin-right: 3px;"
							onclick="return false;">취소</a>
					</form>
				</div>

				
				<!-- 로그인 상태일 경우만 등록가능하게 수정-->
				<div class="re_reply" id="CommentWriter"
					style="vertical-align: middle; display: none;">
					<p style="margin-bottom: 10px;">닉네임(수정)</p>
					<form action="replyWrite.do?seq=${seq}" method="post"  name="re_replyFrm">
						<input type="hidden" name="re_lev" value="${dto.getRe_lev()}">
						<input type="hidden" name="re_ref" value="${dto.getRe_ref()}">
						<input type="hidden" name="re_seq" value="${dto.getRe_seq()}">
						<textarea id="replyContent" name="reply_content" rows=1; cols=30;
							placeholder="댓글을 남겨보세요"></textarea>
						<input id="reply_submit" type="button" value="등록" onclick="re_replyCheck();"><a
							class="c" href="#"
							style="font-size: 13px; color: gray; float: right; margin-right: 3px;"
							onclick="return false;">취소</a>
					</form>
				</div>
				
				
				<br>
			</c:forEach>

		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
 
		<div id="CommentWriter" style="vertical-align: middle;">
			<p style="margin-bottom: 10px;">닉네임(수정)</p>
			<form action="replyWrite.do?seq=${seq}" method="post" name="replyFrm">
				<input type="hidden" name="re_lev" value="${dto.getRe_lev()}">
				<input type="hidden" name="re_ref" value="${dto.getRe_ref()}">
				<input type="hidden" name="re_seq" value="${dto.getRe_seq()}">
				<textarea id="replyContent" name="reply_content" rows=1; cols=30;
					placeholder="댓글을 남겨보세요"></textarea>
					<c:if test="${memId!=null }">
				<input id="reply_submit" type="button" value="등록" onclick="replyCheck();">
			</c:if>
			<c:if test="${memId==null }">
				<input id="reply_submit" type="button" value="등록" onclick="location.href='../member/loginForm.do'">
			</c:if>
			
			</form>
		</div>
	
	
	
	
	
	
	

	<hr style="color: gray;">
	<br>

	<div id="more"><br><br>
		<h2>당근마켓 인기중고</h2>
		<a href="../market/marketMain.do"
			style="position: relative; bottom: 25px; color: orange; float: right; text-decoration: none; font-size: 15px;">더
			구경하기</a><br>
		<div id="flex_container">
			<c:forEach var="dto" items="${list}">
				<div class="item" style="">
					<a href="marketView.do?seq=${dto.seq}"
						style="text-decoration: none; color: black; line-height: 1.4; letter-spacing: -0.6px;">
						<img class="p_img" src="../storage/${dto.image}">
						<div id="more_description">
							<p style="font-size: 16px; margin-bottom: 2px;">${dto.title }</p>
							<p id="more_price2"
								style="font-size: 15px; font-weight: bold; margin-bottom: 3px;">${dto.price}원</p>
							<p id="region" style="font-size: 14px; margin-bottom: 3px;">${dto.city}
								${dto.gu}</p>
							<p style="font-size: 13px; color: gray;">조회 ${dto.hit}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	</scetion>
</body>
</html>
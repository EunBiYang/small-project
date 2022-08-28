<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/market.css?v=1">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#category1").load("category-data.html #category1-1", function(){
			$(this).show();
		});
	
		$(document).on("change", "#category1 > select", function() {
			$("#category2").empty().hide();//비우고 감춰라~!
			$("#category3").empty().hide();
	
			var target = $(this).find("option:selected").attr("data-target");
			var selector = "category-data.html "+target;//공백!
			
			//다음 항목 로드
			$("#category2").load(selector, function() {
				$(this).show();
			});
		});
		
		// 2depth에 대한 select 태그 이벤트 설정
		$(document).on("change", "#category2 > select", function() {
			
			if($(this).find("option:selected").index() > 0){
				//모든 select 태그 값을 추출
				var data1 = $("#category1 > select > option:selected").val();
				var data2 = $("#category2 > select > option:selected").val();
			}
			location.href="siGu.do?city="+data1+"&gu="+data2;
		});
	});
	
	
	function loginCheck() {
		if(${memId == null}) {
				alert("먼저 로그인 하세요");
				location.href="../member/loginForm.do";
		 } else {
			location.href="addWriteForm.do";
		 } 
	}
</script>
</head>

<body>
	<section id="content">
		<h1 class="head-title" id="hot-articles-head-title" style="font-family: PyeongChangPeace-Bold;">중고거래 인기 TOP 50 </h1>
		<nav id="hot-articles-navigation">
			<div name="region1" id="region1">
				<table>
					<tr>
						<td><img src="../img/storeicon.JPG" alt="검색하세요아이콘" style="height: 28px;"></td>
						<td><span id="category1"></span> <span id="category2"></span></td>
						<td><input class="button-42" type="button" value="내 물건 올리기" onclick="loginCheck()"></td>
					</tr>
				</table>
			</div>
		</nav>
	</section>

	
	<!-- 물품 리스트 자리 -->	
	<scetion class="cards-wrap">
		<c:forEach var="dto" items="${list}">
			<article class="card-top">
				<div class="card-photo">
					<img alt="이미지자리" src="../storage/${dto.getImage()}" width=150px, height=150px >
				</div>
				<a class="card-link" href="../board/marketView.do?seq=${dto.getSeq()}" style="text-decoration: none;">
				<div class="card-desc">
					<h3 class="card-titile" style="font-size : 23px; font-weight: bolder;">${dto.getTitle()}</h3>
					<h2 class="card-price">${dto.getPrice()}원</h2>
					<div class="card-region-name">${dto.getCity()} ${dto.getGu()}</div>
					<div class="card-counts">
						<span>조회수 ${dto.getHit()} </span>
					</div>
				</div>
				</a>
			</article>
		</c:forEach>
	</scetion>
</body>
</html>
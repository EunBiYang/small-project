<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/market.css">
</head>
<body>
	<section id="content">
		<h1 class="head-title" id="hot-articles-head-title" 
		style="font-family: PyeongChangPeace-Bold;">${city} ${gu} 인기 매물</h1>
		<nav id="hot-articles-navigation">
			<div name="region1" id="region1">
			<!-- 버튼 -->
			<input class="button-42" type="button" value="내 물건 올리기" onclick="location.href='addWriteForm.do'">
			<input class="button-42" type="button" value="돌아가기" onclick="window.history.go(-1);">
			<!-- 카테고리 부분 -->
			<span id="category1"></span> 
			</div>
		</nav>
	</section>
	<!-- 물품 리스트 자리 -->	
	<scetion class="cards-wrap">
			<c:forEach var="dto" items="${siguList}">
				<article class="card-top">
						<div class="card-photo">
							<img alt="이미지자리" src="../storage/${dto.getImage()}" width=150px, height=150px >
						</div>
						<a class="card-link" href="../board/marketView.do?seq=${dto.getSeq()}" style="text-decoration: none;">
						<div class="card-desc">
							<h3 class="card-titile" style="font-family: Cafe24Simplehae;">${dto.getTitle()}</h3>
							<h2 class="card-price">${dto.getPrice()}</h2>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/market.css">
<script type="text/javascript">
	if(${result >0}){
		alert("내 물건이 등록되었습니다!")
	} else{
		alert("등록에 실패 했습니다.")
		location.history.back();
	}
</script>
</head>
<body>
<section id="content">
	<c:if test="${result >0}">
	<h1 class="head-title" align="center" style="font-family: PyeongChangPeace-Bold;">
		<p>&#128588내 상품이 등록되었어요!&#10024</p></h1>	
	<table class="addForm" style="margin: auto;">
		<thead>
			<tr>
				<th colspan="2" height="8px"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2" align="center">
					<img alt="" src="../storage/${dto.image}">
				</td>
			</tr>
			<tr>
				<th scope="row" class="even">제목</th>
				<td class="even">${dto.title}</td>
			</tr>
			<tr>
				<th scope="row" >가격</th>
				<td>${dto.price}</td>
			</tr>
			<tr>
				<th scope="row" class="even">지역</th>
				<td class="even">${dto.city}  ${dto.gu}</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td >${dto.content}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="button-1" type="button" onclick="location.href='marketMain.do'">중고마켓 홈으로 돌아가기</button>
				</td>
			</tr>
		</tbody>
	</table>
	
	</c:if>
	
	<c:if test="${result <= 0}">
		상품 등록에 실패했습니다.
		<button onclick="location.history.back();">돌아가기</button>
	</c:if>
	</section>
</body>
</html>
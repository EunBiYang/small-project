<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/market.css">
</style>
<script type="text/javascript">
	if(${result > 0 }) {
		alert("가게 등록에 성공하였습니다.");
	} else {
		alert("가게 등록에 실패했습니다.");
		location.history.back();
	}
</script>
</head>
<body>
 <section id="content">
	<c:if test="${result >0}">
	<h1 class="head-title" align="center" style="font-family: PyeongChangPeace-Bold;">
		<p>&#128588동네 가게로 등록되었어요!&#10024</p></h1>	
	<table class="addForm" style="margin: auto;">
		<thead>
			<tr>
				<th colspan="2" height="8px"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2" align="center">
					<img alt="" src="../storage/${dto.image1}">
				</td>
			</tr>
			<tr>
				<th scope="row" class="even">가게 이름</th>
				<td class="even">${dto.storeName}</td>
			</tr>
			
			<tr>
				<th scope="row">지역</th>
				<td>${dto.city}  ${dto.gu}</td>
			</tr>
			<tr>
				<th scope="row" class="even">가게 상세 주소 </th>
				<td class="even">${dto.storePlace}</td>
			</tr>
			<tr>
				<th scope="row" >가게 번호 </th>
				<td>${dto.storeNum}</td>
			</tr>
			<tr>
				<th scope="row"class="even" >가게 카테고리 </th>
				<td class="even">${dto.storeCategory}</td>
			</tr>
			<tr>
				<th scope="row">가게 소개</th>
				<td >${dto.storeContent}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="button-1" type="button" onclick="location.href='dongne_main.do'">동네가게 홈으로 돌아가기</button>
				</td>
			</tr>
		</tbody>
	</table>
	</c:if>
	
	
</body>
</html>  
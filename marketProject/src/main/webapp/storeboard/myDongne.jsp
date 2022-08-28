<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
	font-family: 'LotteMartHappy';
	font-style: normal;
	font-weight: 100;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff')
		format('woff');
}
section#content {
    margin-top: 0px;
}

.head-title {
    font-size: 40px;
    font-weight: 600;
    letter-spacing: -0.6px;
    text-align: center;
    color: #212529;
    margin-bottom: 40px;
    font-family: LotteMartHappy;
}
#line {
	width: 200px;
	padding: 2px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: black;
	margin: 20px 10px;
}
.text{
font-weight:bolder;
text-align: center; 
font-size: 25px; 
font-family:'LotteMartHappy';
}
</style>
</head>
<body>
<section id="content">


		<table style="width: 1000px; margin-right: auto;">

			<tr>
				<td colspan="2" class="text">
				<h1 class="head-title" align="center" style="font-family: PyeongChangPeace-Bold;">
					내가 등록한 가게</h1></td>
			</tr>
			<tr>
				<th id="line" colspan="2" height="3px"></th>
			</tr>

			<c:forEach var="dto" items="${list}">
				<tr>
					<td style="width: 100px; text-align: center">
					<a
						href="../storeboard/storeboardView.do?seq=${dto.seq}"
						style="text-decoration: none;"> 
						<img  width="80px" height="80px" style=" border-radius: 12px;" 
						src="../storage/${dto.image1}">
					</a>
					</td>

					<td class="text" style="font-size:20px; font-weight: lighter;">${dto.storeContent}</td>
				</tr>
				<tr>
					<th colspan="2" height="1px" style="padding: 0.3px; background: #e9e9e9;"></th>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.head-title {
    font-size: 40px;
    font-weight: 600;
    letter-spacing: -0.6px;
    text-align: center;
    color: #212529;
    margin-bottom: 40px;
    font-family: LotteMartHappy;
}

.footer-container {
    padding: 38px 16px 60px;
}
.media-links-container {
    display: flex;
    flex-direction: row;
    align-items: center;
}
.divider {
    width: 1px;
    height: 28px;
    background-color: #e9ecef;
    margin: 0 24px;
}
.policy-links {
    display: flex;
    flex-direction: row;
    align-items: center;
    flex-wrap: wrap;
    margin-top: 38px;
    color: #868e96;
    font-style: normal;
    font-weight: 700;
    font-size: 12px;
    line-height: 150%;
    text-decoration: none;
    letter-spacing: -.02em;
}
.emails {
    margin-top: 4px;
    font-style: normal;
    font-weight: 400;
    font-size: 12px;
    line-height: 150%;
    letter-spacing: -.02em;
    color: #868e96;
}
.other-info {
    font-style: normal;
    font-weight: 400;
    font-size: 12px;
    line-height: 150%;
    letter-spacing: -.02em;
    color: #868e96;
    margin-top: 4px;
}

.copyright {
    margin-top: 24px;
    font-style: normal;
    font-weight: 400;
    font-size: 12px;
    line-height: 150%;
    letter-spacing: -.02em;
    color: #868e96;
}	
.store_list_container{
    position: relative;
    width: 900px;
    padding: 20px 30px;
    margin: 0 auto;
    letter-spacing: -.2px;
    font-size : 20px;
}
.button-42 {
	background-color: initial;
	background-image: linear-gradient(-180deg, gray, black);
	border-radius: 6px;
	box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-size: 15px;
	font-family: LotteMartHappy;
	height: 40px;
	line-height: 40px;
	outline: 0;
	overflow: hidden;
	padding: 3px;
	pointer-events: auto;
	position: relative;
	text-align: center;
	touch-action: manipulation;
	user-select: none;
	-webkit-user-select: none;
	vertical-align: top;
	white-space: nowrap;
	width: 100px;
	z-index: 9;
	border: 0;
	transition: box-shadow .2s;
}




.button-42:hover {
   background: #fff;
   color: black;
}

.button-42:before, .button-42:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
  
   transition: 400ms ease all;
}

.button-42:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

.button-42:hover:before, .button-42:hover:after {
   
   transition: 800ms ease all;
}
@font-face {
	font-family: 'LotteMartHappy';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff')
		format('woff');
}

@font-face {
	font-family: 'PyeongChangPeace-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}
td {
   font-family: 'LotteMartHappy';
	font-style: normal;
	font-weight: 400;
	
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff')
		format('woff');
	padding: 5px;	
	align-items: center;
	height:30px
	margin-top: 100px;
	font-size: 15px;
}
</style>
</head>
<body>
 <div class="store_list_container" align="center">
     
        <h1 class="head-title" id="hot-articles-head-title" 
		style="font-family: PyeongChangPeace-Bold;">${city} ${gu} 인기 동네 가게</h1>
 
       	
        
         
       <!--  리스트 출력 -->
		<c:forEach var="dto" items="${siguList}">
			<table border="0" width="800">
				<tr>
					<td rowspan="2">
						<a href="../storeboard/storeboardView.do?seq=${dto.seq}&pg=${pg}">
							<img src="../storage/${dto.image1}" width="80" height="80" style="border-radius: 12px;">
						</a>
					</td>
					<td width="400" style="font-size: 23px;">${dto.storeName}<strong style="font-size: 12px;">  ${dto.storeCategory}</strong>
					</td>
				</tr>
				<tr>
					<td width="800">${dto.storeContent}</td>
				</tr>
			</table>
		</c:forEach>

		<input class="button-42" type="button" value="돌아가기" onclick="location.href='dongne_main.do'">
 

</body>
</html>
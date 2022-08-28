<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 결과</title>

<style type="text/css">
@font-face {
   font-family: 'PyeongChangPeace-Bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2')
      format('woff2');
   font-weight: 700;
   font-style: normal;
}

@font-face {
   font-family: 'LotteMartHappy';
   font-style: normal;
   font-weight: 400;
   src:
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff')
      format('woff');
}
* {
	 font-family: 'LotteMartHappy';
}
.mdf_result {
	box-sizing: border-box;
    width: 600px;
    margin: 0 auto;
    padding: 40px 0 20px;
    text-align: center;
}
.image {
	padding: 20px 0 20px ;
}
h2 {
	font-size: 24px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}
.btn_area {
	padding-top: 60px;
}

.button-12 {
	align-items:center;
	background-color: initial;
  	background-image: linear-gradient(-180deg, gray, black);
	border-radius: 6px;
	box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-size: 18px;
	font-family:LotteMartHappy;
	width: 180px;
	height: 50px;
	line-height: 40px;
	outline: 0;
	overflow: hidden;
	padding: 0 20px;
	pointer-events: auto;
	position: relative;
	text-align: center;
	touch-action: manipulation;
	user-select: none;
	-webkit-user-select: none;
	vertical-align: top;
	white-space: nowrap;
	z-index: 9;
	border: 0;
	transition: box-shadow .2s;
}
.button-12:hover {
   background: #fff;
   color: black;
}

.button-12:before, .bubutton-12:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #FF7E31;
   transition: 400ms ease all;
}

.bubutton-12:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

.bubutton-12:hover:before, .bubutton-12:hover:after {
   
   transition: 800ms ease all;
}
</style>


</head>
<body>

	<div class="mdf_result">
	
		<div>
			<c:if test="${result > 0 }">
			
				<div class="image">
					<img src="../img/check_green.png" width="100" height="100">
				</div>
			
				<h2>${memName}님의 회원정보가 정상적으로 수정되었습니다.</h2>
				
				<div class="btn_area">
					<input class="button-12" type="button" value="메인페이지로 가기" onclick="location.href='../main/main.jsp'">
				</div>
			</c:if>

			<c:if test="${result <= 0 }">
			
				<div class="image">
					<img src="../img/mark_orange.png" width="100" height="100">
				</div>
				
				<h2>${memName}님의 회원정보가 수정되지 않았습니다.</h2>
				<a>확인 후 다시 수정해주세요.</a>
				
				<div class="btn_area">
					<input class="button-12" type="button" value="돌아가기" onclick="location.href='/member/modifyForm.do'">
				</div>
			</c:if>
		</div>
	
	</div>



</body>
</html>
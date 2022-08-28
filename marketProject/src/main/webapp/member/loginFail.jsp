<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.failbox {
	box-sizing: border-box;
    width: 600px;
    margin: 0 auto;
    padding: 40px 0 20px;
    text-align: center;
}
.result{
	margin: 0 auto;
    padding: 0 0 20px;
}
h2 {
	font-size: 28px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}
.image {
	padding: 20px 0 20px ;
}
.textbox{
	width: 600px;
	height: 120px;
	border: 1px solid #dae1e6;
	background : #f3f3f3;
	font-size: 15px;
	
}
.text{
	padding-top: 28px;
}
p{
	margin: 0;
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

	<div class="failbox">
		
		<div class="image">
			<img src="../img/mark_orange.png" width="100" height="100">
		</div>
		
		<div class="result">
			<h2>로그인할 수 없습니다.</h2>
		</div>
		
		<div class="textbox">
			<div class="text">
				<p>아이디 또는 패스워드가 일치하지 않아 로그인할 수 없습니다.</p>
				<p>확인 후 다시 로그인 해주세요.</p>
				<p>같은 문제가 발생하면 관리자에게 문의해 주세요</p>
			</div>
		</div>
		
		<div class="btn_area">
			<input class="button-12" type="button" value="돌아가기" onclick="history.back()">
		</div>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
.loginbox {
	box-sizing: border-box;
    width: 460px;
    margin: 0 auto;
    padding: 30px 0 30px 0;
}


h2 {
	font-size: 32px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}

div {
	margin-bottom: 12px;
	display: flex;
    flex-direction: column;
    margin: 0px 0px 16px;
}

label {
	font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin: 0px 0px 4px;
    color: rgb(58, 58, 58);
}

.int1 {
	font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin: 0px;
    border: 1px solid #dadada;
    background-color: white;
    height: 50px;
    flex: 1 1 auto;
    width: 100%;
    color: rgb(26, 26, 26);
    box-sizing: border-box;
    padding: 0px 16px;
    border-radius: 3px;
}

a {
	font-size: 13px;
    font-weight: normal;
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
    display: block;
    text-align: right;
    color: rgb(202, 202, 202);
}


.join_area {
	margin: 40px 0 15px;
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
	height: 40px;
	
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
	width: 100%;
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

	<div class="loginbox">

		<h2>로그인</h2>

		<form action="login.do" method="post">
			<div>
				<label>아이디</label> <input class="int1" type="text" name="id">
			</div>

			<div>
				<label>비밀번호</label> <input class="int1" type="password" name="pwd">
			</div>
			
			<div class="join_area">
				<a href="writeForm.do">회원가입하기</a>
			</div>
			
			<button type="submit" class="button-12" value="로그인">
				<span>로그인</span>
			</button>
		</form>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript" src="../script/memberScript2.js?v=3"></script>

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
.mainlogo{
	position: relative;
    overflow: hidden;
    padding: 40px 0 14px;
    box-sizing: border-box;
}
.logo{
    display: block;
    margin: 0 auto;
    width: 300px;
    height: 130px;
    background-image: url("../image/logo.png");
    background-repeat: no-repeat;
    background-position: 0 0;
    background-size: 300px auto;
    color: transparent;
    font-size: 0;
}
.writebox {
	box-sizing: border-box;
    width: 450px;
    margin: 0 auto;
}
h2 {
	font-size: 32px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}
div {
	margin-bottom: 15px;
	display: flex;
    flex-direction: column;
}
label {
	font-size: 15px;
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
    border: solid 1px #dadada;
    background-color: white;
    height: 50px;
    flex: 1 1 auto;
    width: 100%;
    color: rgb(26, 26, 26);
    box-sizing: border-box;
    padding: 0px 15px;
    border-radius: 3px;
}
.int2 {
	display: block;
	font-size: 14px;
    font-weight: normal;
    margin: 0px;
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    border: none;
    padding: 0px 15px;
}

.email{
	display: table-cell;
    table-layout: fixed;
    vertical-align: middle;
}
.box{
	display: block;
    position: relative;
    width: 100%;
    height: 50px;
    border: solid 1px #dadada;
    background: white;
    box-sizing: border-box;
    vertical-align: top;
    margin: 0px 0px 0px;
}
.box_sel{
	display: block;
    position: relative;
    width: 100%;
    height: 50px;
    border: solid 1px #dadada;
    padding: 10px 10px 10px 10px;
    background: white;
    box-sizing: border-box;
    vertical-align: top;
    margin: 0px 0px 0px;
}
.id_box {
	position: relative;
    margin-top: 10px;
    padding: 0 125px 0 0;	
}
.btn_check{
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
	outline: 0;
	overflow: hidden;
	padding: 0 20px;
	pointer-events: auto;
	position: absolute;
	text-align: center;
	touch-action: manipulation;
	user-select: none;
	-webkit-user-select: none;
	vertical-align: top;
	white-space: nowrap;
	z-index: 9;
	border: 0;
	transition: box-shadow .2s;
	
	
	
	position: absolute;
    top: 0;
    right: 0;
    width: 115px;
    height: 50px;
    padding: 16px 0 16px;
    font-weight: 700;
    text-align: center;
    box-sizing: border-box;
    text-decoration: none;
	
	display: block;
    font-size: 15px;
    cursor: pointer;
	
    border: solid 1px rgba(0,0,0,.08);
}

.email_box, .tel_box {
	display: table;
    width: 100%;
    margin: 0px 0px 0px;
}
.tel1+.tel2, .tel2+.tel3, .email1+.email2  {
	padding-left: 10px;
}

.email1, .email2, .tel1, .tel2, .tel3{
	display: table-cell;
    table-layout: fixed;
    width: 110px;
    vertical-align: middle;
}

.sel{
	width: 100%;
    height: 30px;
    font-size: 14px;
    line-height: 30px;
    color: #000;
    border: none;
    border-radius: 0;
}


.btn_area {
	margin: 50px 0 20px;
}
button, select {
	 cursor: pointer;
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
	width: 450px;
	height: 50px;
	line-height: 40px;
	outline: 0;
	overflow: hidden;
	padding: 0 20px;
	pointer-events: auto;
	position: absolute;
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

.button-12:before, .button-12:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #FF7E31;
   transition: 400ms ease all;
}

.button-12:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

.button-12:hover:before, button-12:hover:after {
   
   transition: 800ms ease all;
}
.btn_check:hover {
   background: #fff;
   color: black;
}

.btn_check:before, .btn_check:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #FF7E31;
   transition: 400ms ease all;
}

.btn_check:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

.btn_check:hover:before, .btn_check:hover:after {
   
   transition: 800ms ease all;
}

</style>

</head>
<body>
	
	
	
	
	<div class="writebox">
		
		<h2>회원가입</h2>
		
		<form action="write.do" method="post" name="frm">
			<div>
				<label>이름</label> 
				<input class="int1" type="text" name="name">
			</div>
			<div>
				<label>아이디</label> 
				<div class="id_box">
					<div class="box">
						<input class="int2" type="text" name="id">
					</div>
					
					<a class="btn_check" role="button" name="중복체크" onclick="checkId()">
						<span>중복체크</span>
					</a>
				</div>
			</div>
			
			
			
			
			<div>
				<label>닉네임</label> 
				<input class="int1" type="text" name="nickname">
			</div>
			<div>
				<label>비밀번호</label> 
				<input class="int1" type="password" name="pwd">
			</div>
			<div>
				<label>비밀번호 확인</label> 
				<input class="int1" type="password" name="repwd">
			</div>
			<div>
				<label>성별</label>
					<div class="box_sel">
						<select class="sel" name="gender">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</div>
			</div>
			<div>
				<label>이메일</label>
				<div class="email_box">
					<div class="email1">
						<div class="box">
							<input class="int2" type="text" name="email1">
						</div>
					</div>
					<div class="email2">
						<div class="box_sel">
							<select class="sel" name="email2">
								<option value="naver.com">@ naver.com</option>
								<option value="daum.net">@ daum.net</option>
								<option value="gmail.com">@ gmail.com</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div>
				<label>휴대전화 (연락처)</label>
				<div class="tel_box">
					<div class="tel1">
						<div class="box_sel">
							<select class="sel" name="tel1">
								<option value="010">010</option>
								<option value="070">070</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
							</select>
						</div>
					</div>
					<div class="tel2">
						<div class="box">
							<input class="int2" type="text" name="tel2">
						</div>
					</div>
					<div class="tel3">
						<div class="box">
							<input class="int2" type="text" name="tel3">
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div>
				<label>주소</label> 
				<input class="int1" type="text" name="addr">
			</div>
			
			
			<div class="btn_area">
				<button class="button-12" type="button" value="가입하기" onclick="checkWrite();">
					<span>가입하기</span>
				</button>
			</div>
			
			
		</form>
		
	</div>

   
</body>
</html>




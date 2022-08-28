<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
html {
	height: auto;
	display: block;
}
body {
	margin: 0;
    padding: 0;
    height: auto;
    background-color: #fff;
    display: block;
}
#mainSection {
   margin: 0;
   padding: 10px 0 0 0;
   width: 100%;
   height: auto;
   display: block;
}
.wrap {
	width: 100%;
	height: auto;
	display: table;
	table-layout: fixed;
}
.nav{
	position: relative;
	float: left;
    display: table-cell;
    width: 330px;
    height: auto;
    background-color: #f9fbfc;
    box-shadow: 5px 1px 8px 0 #0000000f;
    border-right: 1px solid #00000014;
    vertical-align: top;
    padding: 25px 0 40px 0;
    margin: 0;
    font-family: LotteMartHappy;
}
.container {
	display: table-cell;
    width: 80%;
    vertical-align: middle;
    padding: 25px 0px 40px 0px;
}
.profile_area{
	padding: 20px 20px 0 20px;
	text-align: center;
    box-sizing: border-box;
    margin: 0;
    display: block;
}
.profile_wrap{
	padding: 20px 20px 0 20px;
	margin: 0;
	display: block;
}
#pImg {
	border-radius: 50%;
    box-shadow: 0 3px 6px 0  #1d223514;
    vertical-align: top;
}
.profile {
	padding: 10px 0 10px;
	margin: 0;
	display: block;
}
.use_nickname {
	font-size: 26px;
    font-weight: 700;
    line-height: 32px;
    letter-spacing: -.67px;
    word-break: break-all;
    margin-bottom: 5px;
}
.left{
	display: block;
    padding: 20px 40px;
    box-sizing: border-box;
    margin: 0;
    min-height: 700px;
    vertical-align: top;
}
.left_menu{
	display: block;
	margin: 0;
    border-top: 1px solid rgba(146,146,148,.3);
}
.left_menu1, .left_menu2, .left_menu3 {
	display: block;
	margin: 0;
}
.menu_title {
	position: relative;
	display: block;
	padding: 30px 0 8px 0;
	margin: 0;
	
}
.title_text{
	display: inline;
    font-size: 22px;
    font-weight: 700;
    line-height: 24px;
    letter-spacing: -.2px;
    color: #303038;
    display: block;
    margin: 10px 0 10px 0;
}
.indexbox{
	padding: 0 17px;
    border-radius: 8px;
    box-shadow: 1px 1px 10px 0 #484b6c14;
    border: solid 1px #e3e9ed;
    background-color: #fff;
    box-sizing: border-box;
    display: block;
    margin: 0;
}
ul {
	list-style: none;
	padding: 0;
}
li {
	display: list-item;
	font-size: 18px;
    font-weight: 500;
    line-height: 24px;
    letter-spacing: -.8px;
    color: #303038;
    word-break: break-all;
    padding: 5px 0 5px 2px;
}
a {
	text-decoration: none;
	color: #858585;
}
a:hover {
	font-weight: bold;
	color: black;
}
.my_main {
	box-sizing: border-box;
	font-size: 80px;
	text-align: center;
	text-decoration: underline;
	
}
.my_form {
	margin: 30px 60px 30px 60px;
	display: flex;
	position: relative;
	width: 90%;
	height: 700px;
    flex-direction: column;
    align-items: center;
}
.my {
	font-size: 70px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    padding: 10px 0px 30px 0px;
    color: rgb(58, 58, 58);
    text-align: center;
}
.my_box {
	display: table;
    padding: 80px 0 30px 0; 
}
.box{
	display: block;
    position: relative;
    width: 100%;
    height: 200px;
    border: solid 1px #dadada;
    background: white;
    box-sizing: border-box;
    vertical-align: top;
    margin: 0px 0px 0px;
    background-color: #f9fbfc;
}
.int2 {
	display: block;
	font-size: 30px;
    font-weight: normal;
    margin: 0px;
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    border: none;
    padding: 40px 15px;
    text-align: center;
}
.my1+.my2, .my2+.my3 {
	padding-left: 10px;
}
.my1, .my2, .my3{
	display: table-cell;
	width: 310px;
    table-layout: fixed;
    vertical-align: middle;
}
.mytext1 {
	font-size: 15px;
    font-weight: normal;
    text-align: center;
    padding : 40px 0 5px 0;
}
.mytext2 {
	font-size: 15px;
    font-weight: normal;
    text-align: center;
    padding : 5px 0 30px 0;
}

</style>

</head>
<body>
	<div class="wrap">

		<div class="nav" >
			<div class="profile_area">
				<div class="profile_wrap">
					<a href="../member/myPage.do">
						<img id="pImg" alt="프로필이미지" src="../img/profile_none.png" width="110" height="110">
					</a>
					<div class="profile">
						<p class="use_nickname">dewf22님</p>
					</div>
				
				</div>
			</div>
			
			<div class="left">
				<div class="left_menu">
					<div class="left_menu1">
						<div class="menu_title">
							<h2 class="title_text">나의 프로필</h2>
						</div>
						
						<div class="indexbox">
							<ul>
								<li>
									<a href="../member/modifyForm.do">프로필 수정</a>
								</li>
								<li>
									<a href="../member/deleteForm.do">회원탈퇴</a>
								</li>
							</ul>
						</div>
					</div>
				
					
					<div class="left_menu2">
						<div class="menu_title">
							<h2 class="title_text">나의 활동</h2>
						</div>
						
						<div class="indexbox">
							<ul>
								<li>
									<a href="../board/myProduct.do">중고거래</a>
								</li>
								<li>
									<a href="../storeboard/myDongne.do">동네생활</a>
								</li>
							</ul>
						</div>
					</div>
					
					<div class="left_menu3">
						<div class="menu_title">
							<h2 class="title_text">마켓 알림</h2>
						</div>
						
						<div class="indexbox">
							<ul>
								<li>
									<a href="#">공지사항</a>
								</li>
								<li>
									<a href="#">자주 묻는 질문</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		
		</div>
		
		<div class="container">
			 <c:if test="${req_mem == null}">
			 	
			 	<div class="my_form">
					<label class="my">마이 페이지</label>
					<div class="my_box">
						<div class="my1">
							<div class="box">
								<div class="int2" > 
								나의 게시글 
									<p class="mytext1"> 내가 등록한 게시글을 모두 모아 </p>
									<p class="mytext2"> 한눈에 확인하고 관리할 수 있습니다.</p>
								</div>	
												
							</div>
						</div>
						<div class="my2">
							<div class="box">
								<div class="int2" > 
								회원 정보 수정
									<p class="mytext1"> 가입하실 때 입력하신 고객님의 회원정보를</p>
									<p class="mytext2"> 수정/관리할 수 있습니다.</p>
								</div>
							</div>
						</div>
						<div class="my3">
							<div class="box">
								<div class="int2" > 
								회원 탈퇴 
									<p class="mytext1"> 더 이상 이용을 원하지 않으실 경우 </p>
									<p class="mytext2"> 회원 탈퇴가 가능합니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

			 </c:if>
			 <c:if test="${req_mem != null}">
            	<jsp:include page="${req_mem}" />
    		 </c:if>	
		</div>
	
	</div>
</body>
</html>

















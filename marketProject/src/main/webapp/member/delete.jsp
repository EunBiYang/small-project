<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script type="text/javascript">


/*
	if(${result > 0}) {
		alert("회원 탈퇴가 완료되었습니다.");
	} else {
		alert("회원 탈퇴에 실패하였습니다.");
	}
	location.href = "../main/index.jsp";
	
*/



</script>

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
.deletebox {
	box-sizing: border-box;
    width: 500px;
    margin: 0 auto;
    padding: 20px 0 20px;
    text-align: center;
}
.image {
	padding: 20px 0 20px ;
}
h2 {
	font-size: 32px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}
a {
	font-size: 16px;
	font-weight: normal;
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
	
	<div class="deletebox">
		
		<div class="image">
			<img src="../img/check_green.png" width="140" height="140">
		</div>
	
		<div>
			<c:if test="${result > 0 }">
				<h2>회원 탈퇴가 완료되었습니다.</h2>
			</c:if>
			
			<c:if test="${result < 0 }">
				<h2>회원 탈퇴 실패하였습니다.</h2>
			</c:if>
		</div>
		
		<div>		
			<a>그동안 이용해주셔서 감사합니다.</a>
		</div>
		
		<div class="btn_area">
			<input class="button-12" type="button" value="메인페이지" onclick="location.href='../main/index.jsp'">
		</div>
		
	</div>
	
	

	

</body>
</html>
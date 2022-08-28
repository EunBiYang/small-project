<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 신청</title>

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
.deletebox{
	box-sizing: border-box;
    width: 500px;
    height: 800px;
    margin: 0 auto;
    padding: 40px 0 20px;
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
.btn_area {
	padding-top: 60px;
}
.btn_s{
    width: 70px;
    height: 35px;
    border: 1px solid #bfbfbf;
    background: #fff;
    font-weight: bold;
    font-size: 14px;
    color: black;
    cursor: pointer;
}

</style>

</head>
<body>
	
	<div class="deletebox">
	
		<div class="image">
			<img src="../img/check_orange.png" width="140" height="140">
		</div>

		<div>		
			<h2>회원 탈퇴신청을 하시겠습니까?</h2>
		</div>
		
		<div class="btn_area">
			<form action="delete.do" name="frm">
				<input type="hidden" name="id" value="${id}">
				<input class="btn_s" type="submit" value="확인">
				<input class="btn_s" type="button" value="취소" onclick="location.href='../member/myPage.jsp'">
			</form>			
		</div>
	
	</div>
</body>
</html>
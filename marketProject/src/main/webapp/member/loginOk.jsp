<%@page import="java.net.URLDecoder"%>
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
.okbox {
	box-sizing: border-box;
    width: 600px;
    margin: 0 auto;
    padding: 40px 0 20px;
    text-align: center;
}
h2 {
	font-size: 28px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}
.image {
	padding: 20px 0 20px ;
}
p{
	margin: 0;
	color: green;
	padding: 20px;
	font-weight: bold;
	
}

</style>
</head>
<body>

	<div class="okbox">
	
		<div class="image">
			<img src="../img/check_green.png" width="100" height="100">
		</div>
	
		<div>
			<h2>${memId}님 로그인 되었습니다.</h2>
		</div>
		
		<div>
			<p>3초 후 메인페이지로 이동합니다.</p> 
			<meta http-equiv="refresh" content="3; url=/main/main.do">
		</div>
		
	</div>

	
</body>
</html>












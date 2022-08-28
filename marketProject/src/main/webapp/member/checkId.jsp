<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복체크</title>

<script type="text/javascript">

function checkIdClose() {
	opener.frm.id.value = "${id}";
	window.close();	
	opener.frm.nickname.focus();
}

function doubleCheck() {
     var frm = document.checkIdForm;
	     
     if(!frm.id.value) {
    	 alert("아이디를 입력해주세요");
    	 frm.id.focus();
     } else {
    	 frm.submit();
     }
}
	
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
body{
	margin: 0
}
.title{
    min-height: 6px;
    color: #fff;
    background-color: black;
    padding: 1px 15px;
    box-sizing: border-box;
    font-weight: bold;
    font-size: 12px;
}
.content1{
	position: relative;
	box-sizing: border-box;
	padding: 20px 15px;
	display: flex;
    flex-direction: column;
    align-items: center;
}
form{
	width: 100%;
	background : #f3f3f3;
	padding : 10px 15px;
	display: flex;
    flex-direction: column;
    align-items: center;
}
.content2{
	margin: 0 auto;
	position: relative;
	width: 60%;
	padding: 15px 15px;
	display: flex;
	align-items: center;
}
p{
	color: green;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 15px;
	text-align: center;
}
label {
	display: table-cell ;
	vertical-align: middle;
	text-align: center;
	font-size: 15px;
    font-weight: normal;
    padding-right: 10px; 
    width: 35%;
}
.id_box {
	display: table-cell ;
	position: relative;
    width: 100%;
}
.box{
	display: block;
    position: relative;
    width: 100%;
    height: 40px;
    border: solid 1px #dadada;
    background: white;
    box-sizing: border-box;
    vertical-align: top;
    margin: 0px 0px 0px;
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
.btn_area {
	padding: 10px 0 10px;;
}
.btn_s{
    width: 80px;
    height: 30px;
    border-radius: 5px;
    border: 1px solid  #3b3d3e;
    background:  #3b3d3e;
    font-weight: normal;
    font-size: 14px;
    color: #fff;
    cursor: pointer;
}

</style>

</head>
<body >
	
	<div class="popup">
		<div class="title">
			<h1>ID 중복체크</h1>
		</div>
		
		<div class="content1">
			<c:if test="${result}">
				<p>${id}는 사용중 입니다.</p>
			
				<form action="checkId.do" name="checkIdForm">
					<div class="content2">
						<label>사용할 아이디</label> 
						<div class="id_box">
							<div class="box">
								<input class="int2" type="text" name="id">
							</div>
						</div>
					</div>
					
					<div class="btn_area">
						<input class="btn_s" type="button" value="중복체크" onclick="doubleCheck()">
					</div>
				</form>		
			</c:if>
		</div>
	
		<div class="content1">
			<c:if test="${!result}">
				<p>${id} 사용 가능합니다.</p>
				
				<div class="btn_area">
					<input class="btn_s" type="button" value="사용하기" onclick="checkIdClose()">
				</div>
				
			</c:if>
		</div>
		
	</div>

</body>
</html>
<%@page import="market.dao.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result > 0}){
		alert("삭제 되었습니다");
		window.history.go(-2);
	 }
	else{ alert("삭제 실패");}
	
	
</script>
</head>
<body>

</body>
</html>
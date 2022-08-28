<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result > 0}){
		alert("댓글수정 성공");
		
	 }
	else alert("댓글수정 실패");
	
	location.href="storeboardView.do?seq=${seq}";
</script>
</head>
<body>

</body>
</html>
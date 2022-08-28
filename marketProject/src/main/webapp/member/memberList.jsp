<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.memberlistbox {
	box-sizing: border-box;
    width: 800px;
    margin: 0 auto;
}
h2 {
	font-size: 32px;
    font-weight: bold;
    color: rgb(58, 58, 58);
}
table {
	font-size: 14px;
	text-indent: initial;
	text-align: center;
}
.tbl_mem {
	position: relative;
    width: 100%;
    table-layout: fixed;
    border-spacing: 0;
    border-collapse: collapse;
    word-wrap: break-word;
    word-break: break-all;
    border: 0;
    border-bottom: 1px solid #e5e5e5;
}
thead {
	display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
	display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
th {
	display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    padding: 15px 0 15px;
    background: #f9f9f9;
}
td {
	display: table-cell;
    vertical-align: inherit;
}
th, td {
	font-size: 14px;
    line-height: 25px;
    text-align: center;
    color: #333;
    border: 0;
    border-top: solid 1px #e5e5e5;
}
.pagebox {
	padding: 20px 10px;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    position: relative;
    height: 40px;
    font-size: 14px;
    font-weight: bold;
}
.pre_end {color: gray; text-decoration: none;}
.paging {color: black; text-decoration: none;}
.currentPaging {color: blue; text-decoration: none;}


</style>
</head>
<body>
   <div class="memberlistbox">
		<h2>회원 리스트</h2>
		
		<table border="1" class="tbl_mem">
			<thead>
				<tr>
					<th>이름</th>
			        <th>아이디</th>
			        <th>닉네임</th>
			        <th>성별</th>
			        <th width="150">이메일</th>
			        <th width="150">전화번호</th>
			        <th>가입일</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td class="name">${ dto.getName()}</td>
						<td>${ dto.getId()}</td>
						<td>${ dto.getNickname()}</td>
						<c:if test="${dto.getGender()=='남자'}">
							<td>남자</td>
						</c:if>
						<c:if test="${dto.getGender()!='남자'}">
							<td>여자</td>
						</c:if>

						<td>${dto.getEmail1()}@${dto.getEmail2()}</td>
						<td>${dto.getTel1()}-${dto.getTel2()}-${dto.getTel3()}</td>
						<td>${dto.getRegdate().substring(0, dto.getRegdate().indexOf(" "))}</td>
					</tr>
				</c:forEach>
			</tbody>
   		</table>
   	</div>
   
   <!-- 페이징 -->
		<div class="pagebox">
			<c:if test="${startPage > 3 }">
				<a class="pre_end" href="memberList.do?pg=${startPage - 1}">◀ &nbsp;</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i== pg}">
					<a class="currentPaging">[${i}]</a>	
				</c:if>
				
				<c:if test="${i!= pg}">
					<a class="paging" href="memberList.do?pg=${i}">[${i}]</a>
				</c:if>
			
 			</c:forEach>
			
			<c:if test="${endPage < totalP }">
				<a class="pre_end" href="memberList.do?pg=${endPage + 1}">&nbsp; ▶</a>
			</c:if>

		</div> 
   
   
   
   
   <a href="../main/index.jsp">메인화면</a> &nbsp;
</body>
</html>



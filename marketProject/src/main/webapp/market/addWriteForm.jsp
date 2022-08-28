<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 물건 올리기</title>
<link type="text/css" rel="stylesheet" href="../css/market.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/addWriteForm.js"></script>	
</head>

<body>
<section id="content">
	<h1 class="head-title" style="font-family: PyeongChangPeace-Bold;">내 물건 올리기</h1>
	<form action="addWriteResult.do" enctype="multipart/form-data" method="post" name="add">
	<input type="hidden" name="city" value="">
	<input type="hidden" name="gu" value="">
	<table class="addForm">
		<thead>
			<tr><th colspan="2" height="8px"></th></tr>
		</thead>
		<tbody>
			<tr height="200px" align="center" style="float: left;">
				<th scope="row" colspan="2">
					<input type="file" name="image" id="image" size="45">
               		<input type="file" name="image2" size="45">
               		<input type="file" name="image3" size="45">
				</th>
			</tr>
			<tr>
				<th scope="row" class="even">제목</th>
				<td class="even"><input type="text" name="title" placeholder="제목을 입력해주세요" ></td>
			</tr>

			<tr>
				<th scope="row" >가격</th>
				<td ><input type="text" name="price" placeholder="가격을 입력하세요" size="40"></td>
			</tr>
			<tr>
				<th scope="row" class="even">지역선택</th>
				<td class="even" align="left">
					<span id="category1"></span> 
					<span id="category2"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" >내용</th>
				<td ><textarea  id="textarea" name="content" rows="15" cols="40" 
				placeholder="게시글의 내용을 작성해 주세요.&#13;&#10;가품 및 판매 금지 품목은 &#13;&#10;게시가 제한 될 수 있습니다."></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" >
					<button type="button" class="button-42" onclick="checkWrite();">물건등록</button>
					<button type="reset" class="button-42">다시작성</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/storeRegistration.js"></script>
<script type="text/javascript">
function checkWrite() {
	   var frm = document.add;
	   var file = document.getElementById("image1").value;
	   
	if (!frm.storeName.value) {
			alert("가게이름을 입력해 주세요.");
			frm.storeName.focus();
		} else if (!frm.storePlace.value) {
			alert("가게위치 입력해 주세요.");
			frm.storePlace.focus();
		} else if (!frm.storeNum.value) {
			alert("가게번호를 입력해 주세요.");
			frm.storeNum.focus();
		} else if (!frm.storeCategory.value) {
			alert("카테고리를 선택해 주세요.");
			frm.storeCategory.focus();
		} else if (!frm.storeContent.value) {
			alert("내용을 입력해 주세요.");
		} else if (!file) {
			alert("파일을 선택해 주세요.");
		}  else {
			frm.submit();
		}
	}
</script>
</script>
<script>
window.onload = function(){
    document.getElementById("storePlace").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("storePlace").value = data.address; // 주소 넣기
                
            }
        }).open();
    });
}
</script>
<script type="text/javascript">
$(function() {
	$("#category1").load("category-data.html #category1-1", function(){
		$(this).show();
	});

	$(document).on("change", "#category1 > select", function() {
		$("#category2").empty().hide();
		$("#category3").empty().hide();

		var target = $(this).find("option:selected").attr("data-target");
		var selector = "category-data.html "+target;//공백!
		
		//다음 항목 로드
		$("#category2").load(selector, function() {
			$(this).show();
		});
	});
	
	// 2depth에 대한 select 태그 이벤트 설정
	$(document).on("change", "#category2 > select", function() {
		
		if($(this).find("option:selected").index() > 0){
			//모든 select 태그 값을 추출
			var data1 = $("#category1 > select > option:selected").val();
			var data2 = $("#category2 > select > option:selected").val();
		}
	});
});
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
	font-weight: 100;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff')
		format('woff');
}

#content{
	margin-top: 10px;
}
.head-title {
    font-size: 40px;
    font-weight: 600;
    letter-spacing: -0.6px;
    text-align: center;
    color: #212529;
    margin-bottom: 40px;
}
td {
	align-items: center;
	height: 70px;
	margin-top: 100px;
}

.button_1 {
	background-color: initial;
	background-image: linear-gradient(-180deg, gray, black);
	border-radius: 6px;
	box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-size: 15px;
	font-family: LotteMartHappy;
	height: 40px;
	line-height: 40px;
	outline: 0;
	overflow: hidden;
	padding: 3px;
	pointer-events: auto;
	position: relative;
	text-align: center;
	touch-action: manipulation;
	user-select: none;
	-webkit-user-select: none;
	vertical-align: top;
	white-space: nowrap;
	width: 100px;
	z-index: 9;
	border: 0;
	transition: box-shadow .2s;
}
table.addForm {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: auto;
	width: 65%;
	margin-bottom: 56px;
}

thead {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: black;
	margin: 20px 10px;
}

table.addForm tbody th {
	font-family: PyeongChangPeace-Bold;
	font-size: 20px;
	width: 150px;
	padding: 10px;
}

table.addForm td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
}

table.addForm .even {
	background: #e9e9e9;
}
input::placeholder {font-family:LotteMartHappy; color:#d5c4a1;}
textarea::placeholder {font-family:LotteMartHappy;color:#d5c4a1;}

input, textarea, .hot-articles-nav-select {
    width: 250px;
    margin-left: 8px;
    appearance: none;
    box-sizing: border-box;
    font-size: 17px;
    letter-spacing: -0.6px;
    text-align: left;
    padding: 12px 16px;
    border-radius: 6px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(233, 236, 239);
    border-image: initial;
    color:#d5c4a1;
    font-family:LotteMartHappy;
}
.image_container {
    position: relative;
    width: 90px;
    height: 90px;    
}
</style>
</head>
<body>
<section id="content">
	<h1 class="head-title" style="font-family: PyeongChangPeace-Bold;">가게 수정하기</h1>
    <form action="storeboardModify.do" id="Modfiyform" name="storeboardModifyForm" enctype="multipart/form-data" method="post" >
    <input type="hidden" name="seq" value="${seq}">
    <input type="hidden" name="pg" value="${pg}"> 
     <table class="addForm">
		<thead>
			<tr><th colspan="2" height="8px"></th></tr>
		</thead>
       
      
   <tbody>
    <tr height="50px" align="center">
			<th scope="row" colspan="2">
            <input type="file" id="image1" name="image1" accept="image/*" onchange="setThumbnail(event);" />
             
            <div class="image_container" value=" ${dto.image1}" ></div>
            </th>
            </tr>
            <!--가게 사진 등록-->
      <!--아이디-->
      <tr>
       <th scope="row" class="even">아이디</th>
				<td class="even" >${dto.id}</td>
			</tr>
			
			  <!--이름-->
          <tr>
				<th scope="row" >이름</th>
				<td >${dto.name}</td>
			</tr>
    <!--가게 이름-->
        <tr>
				<th scope="row" class="even">가게 이름</th>
				<td class="even"><input type="text" name="storeName" value=" ${dto.storeName}" ></td>
			</tr>
				<!-- 가게 위치 -->
       <tr>
				<th scope="row">지역선택</th>
				<td>
					<span id="category1"  value=" ${dto.city}" ></span> 
					<span id="category2"  value=" ${dto.gu}" ></span>
				</td>
			</tr>
          <!--가게 위치-->
           <tr>
				<th scope="row" class="even">가게 상세 주소</th>
				<td class="even"><input type="text" name="storePlace" id="storePlace" value=" ${dto.storePlace}" size="40"></td>
			</tr>
         
          <!--가게 번호-->
          <tr>
				<th scope="row">가게 번호</th>
				<td><input type="text" name="storeNum" value=" ${dto.storeNum}"  size="40"></td>
			</tr>
          <!--가게 카테고리-->
          <tr>
				<th scope="row" class="even">카테고리선택</th>
				<td class="even">
            <select class="even"  id="storeCategory" name="storeCategory" value="${dto.storeCategory}" >
               <option value="카페" id="category2" name="category2">카페</option>
                <option value="음식" id="category3" name="category3">음식</option>
                </select>
                </td>
                </tr>
      
          <!--가게 소개-->
             <tr>
				<th scope="row" >가게 소개</th>
				<td > <textarea name="storeContent" rows="15" cols="40" 
				>${dto.storeContent}</textarea>
				</td>
			</tr>
       
        <tr>
				<td colspan="2" align="center">
					<input type="submit" value="가게 수정" class="button_1">  
                    <input type="reset" value="돌아가기" class="button_1" onclick="history.back();">
   	         </td>
			</tr>
		</tbody>
	</table>
	</form>
	</section>
   </div>    
</body>
</html>
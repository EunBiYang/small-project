<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 물건 올리기</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function checkWrite() {
	   var frm = document.add;
	   var file = document.getElementById("image").value;
	   
	if (!frm.title.value) {
			alert("제목을 입력해 주세요.");
			frm.name.focus();
		} else if (!frm.price.value) {
			alert("가격을 입력해 주세요.");
			frm.id.focus();
		} else if (!frm.city.value) {
			alert("지역을 선택해 주세요.");
			frm.city.focus();
		} else if (!frm.gu.value) {
			alert("동네를 선택해 주세요.");
			frm.gu.focus();
		} else if (!frm.content.value) {
			alert("내용을 입력해 주세요.");
		} else if (!file) {
			alert("파일을 선택해 주세요.");
		}  else {
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
	background-image: linear-gradient(-180deg,gray,black);
	border-radius: 6px;
	box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-size: 18px;
	font-family:LotteMartHappy;
	height: 40px;
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
	width: 55%;
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
	width: 100px;
	padding: 10px;
}

table.addForm td {
	width: 100px;
	padding: 10px;
	vertical-align: top;
}

table.addForm .even {
	background: #e9e9e9;
}
input::placeholder {font-family:LotteMartHappy; color:#d5c4a1;}
textarea::placeholder {font-family:LotteMartHappy;color:#d5c4a1;}

input, textarea, .hot-articles-nav-select {
    width: 400px;
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
</style>
</head>
<body>
   <h3 class="head-title" style="font-family: PyeongChangPeace-Bold;">수정 하기</h3>
   <form action="marketModify.do?seq=${seq}" enctype="multipart/form-data" method="post" name="add">
	<table class="addForm">
		<thead>
			<tr><th colspan="2" height="8px"></th></tr>
		</thead>
		<tbody>
			<tr height="180px" align="center" style="float: left;">
				<th scope="row" colspan="2">
					<input type="file" name="image" size="45" id="image">
               		<input type="file" name="image2" size="45" placeholder="${dto.image2}">
               		<input type="file" name="image3" size="45" placeholder="${dto.image3}">
				</th>
			</tr>
			<tr>
				<th scope="row" class="even">제목</th>
				<td class="even"><input type="text" name="title" value="${dto.title}" ></td>
			</tr>
			<tr>
				<th scope="row" class="even">가격</th>
				<td class="even"><input type="text" name="price"  size="40" value="${dto.price}"></td>
			</tr>
			
			<tr>
            <th scope="row" class="even">지역선택</th>
            <td class="even"><select name="city" id="region1" class="hot-articles-nav-select">
                  <option value="">지역을 선택하세요</option>
                  <option value="서울특별시">서울특별시</option>
                  <option value="부산광역시">부산광역시</option>
                  <option value="대구광역시">대구광역시</option>
                  <option value="인천광역시">인천광역시</option>
                  <option value="광주광역시">광주광역시</option>
                  <option value="대전광역시">대전광역시</option>
                  <option value="울산광역시">울산광역시</option>
                  <option value="세종특별자치시">세종특별자치시</option>
                  <option value="경기도">경기도</option>
                  <option value="강원도">강원도</option>
                  <option value="충청북도">충청북도</option>
                  <option value="충청남도">충청남도</option>
                  <option value="전라북도">전라북도</option>
                  <option value="전라남도">전라남도</option>
                  <option value="경상북도">경상북도</option>
                  <option value="경상남도">경상남도</option>
                  <option value="제주특별자치도">제주특별자치도</option>
               </select> 
               <select name="gu" id="region2" class="hot-articles-nav-select">
                  <option value="">동내를 선택하세요</option>
                  <option value="강남구">강남구</option>
                  <option value="강동구">강동구</option>
                  <option value="강북구">강북구</option>
                  <option value="강서구">강서구</option>
                  <option value="관악구">관악구</option>
                  <option value="광진구">광진구</option>
                  <option value="구로구">구로구</option>
                  <option value="금천구">금천구</option>
                  <option value="노원구">노원구</option>
                  <option value="도봉구">도봉구</option>
                  <option value="동대문구">동대문구</option>
                  <option value="동작구">동작구</option>
                  <option value="마포구">마포구</option>
                  <option value="서대문구">서대문구</option>
                  <option value="서초구">서초구</option>
                  <option value="성동구">성동구</option>
                  <option value="성북구">성북구</option>
                  <option value="송파구">송파구</option>
                  <option value="양천구">양천구</option>
                  <option value="영등포구">영등포구</option>
                  <option value="용산구">용산구</option>
                  <option value="은평구">은평구</option>
                  <option value="종로구">종로구</option>
                  <option value="중구">중구</option>
                  <option value="중랑구">중랑구</option>
               </select> 
            </td>
         </tr>
		
			<tr>
				<th scope="row" class="even">내용</th>
				<td class="even"><textarea name="content" rows="15" cols="40">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="button_1" onclick="checkWrite();">물건등록</button>
					<button type="reset" class="button_1">다시작성</button>
				</td>
			</tr>
		</tbody>
	</table>
   </form>
</body>
</html>
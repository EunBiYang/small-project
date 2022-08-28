<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네가게 메인화면</title>
<style type="text/css">

@import url("../css/dongne_main.css");
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#category1").load("category-data.html #category1-1", function() {
			$(this).show();
		});

		$(document).on("change", "#category1 > select", function() {
			$("#category2").empty().hide();//비우고 감춰라~!
			$("#category3").empty().hide();

			var target = $(this).find("option:selected").attr("data-target");
			var selector = "category-data.html " + target;//공백!

			//다음 항목 로드
			$("#category2").load(selector, function() {
				$(this).show();
			});
		});

		// 2depth에 대한 select 태그 이벤트 설정
		$(document).on("change", "#category2 > select", function() {

			if ($(this).find("option:selected").index() > 0) {
				//모든 select 태그 값을 추출
				var data1 = $("#category1 > select > option:selected").val();
				var data2 = $("#category2 > select > option:selected").val();
			}
			location.href = "storeboardList.do?city=" + data1 + "&gu=" + data2;
		});
	});
</script>
</head>
<body>
 <div name="region1" id="region1">
				<table>
					<tr>
						<td><img src="../img/storeicon.JPG" alt="동네가게 로고" class="dongne-logo"></td>
						<td><span id="category1"></span> <span id="category2"></span></td>
						<td><div class="registration">
							<c:if test="${memId != null }">
								<button type="button" class="registration-button" onclick="location.href='storeboardWriteForm.do'">가게등록</button>
							</c:if>
						</div></td>
					</tr>
				</table>
			</div>
 
 
 
 
 
 
<!-- banner -->
	<div class="banner-background">
		<responsive-container2>
		<div class="banner-container">
			<div class="banner-content">
				<h1>
					내 근처 
					<br> 
					동네가게를 찾고 계신가요?
				</h1>
				<div class="region-button">
					<img _img3 src="icon/location-pin-white.png">
					<p>동네 설정하고 가게를 찾아보세요!</p>
				</div>
			</div>
			<img _img4 src="icon/home-town.png" class="home-illust">
		</div>
		</responsive-container2>
	</div>
 
 <section class="home-main-section">
 	<div class="home-main-content">
 		<div class="home-main-image home-main-image-03">
 			<img class="home-main-image-03" alt="내 근처에서 찾는 동네가게" src="icon/home-main-image-03.png">
 		</div>
 		<div>
 			<h1 class="home-main-title">
 				내 근처에서 찾는
 				<br>
 				동네가게
 			</h1>
 			<p class="text-m">
 				우리 동네 가게를 찾고 있나요?
 				<br>
 				동네 주민이 남긴 진짜 후기를 함께 확인해보세요!
 			</p>
 		</div>
 	</div>
 </section>
 </responsive-container3> 
 

</body>
</html>
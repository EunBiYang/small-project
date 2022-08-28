<%@ page import="storeboard.bean.StoreBoardDTO"%>
<%@ page import="storeboard.dao.StoreBoardDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네가게 상세 페이지</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY">
</script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services">
</script>
<style type="text/css">
@import url("../css/storeboardView.css");
</style>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/marketScript.js?v=48"></script>
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
<script type="text/javascript">
$(document).ready(function(){
	$(".re").click(function(){
        var index=$('.re').index(this);
        $(".re_reply").eq(index).show();
     })
     
     $(".modify").click(function(){
        var index=$('.modify').index(this);
        $(".re_modify").eq(index).show();
     })
     
     
     $(".c").click(function(){
        var index=$('.c').index(this);
        $(".re_reply").eq(index).hide();
     })
     
     $(".m_c").click(function(){
        var index=$('.m_c').index(this);
        $(".re_modify").eq(index).hide();
  }); 
</script>
<script type="text/javascript">
   function isLogin(seq) {
      if(${memId == null}) {
         alert("먼저 로그인 하세요.");
      } else {
         location.href= "storeboardModifyWriteForm.do?seq=" + seq ;
      }
   }
</script>
<script type="text/javascript">
   function isDelete(seq) {
      if(${memId == null}) {
         alert("먼저 로그인 하세요.");
      } else {
         location.href= "storeboardDelete.do?seq=" + seq ;
      }
   }
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

<!-- 중단 상세내용 -->
<!-- 가게관련 글 -->
   <responsive-container2>
   <main>
      <router-outlet></router-outlet>
      <ba-detail class="ng-star-inserted">
      <article class="ng-star-inserted">
         <section>
            <ba-detail-image-appbar class="ng-star-inserted">
            <div class="image-container">
               <img src="../storage/${dto.getImage1()}" width= "100%;" height= "100%;">
            </div> 
            <div class="dark-cover"></div>
            <div class="appbar-container">
               <div class="appbar-content">
                  <app-row class="breadcrumbs">
                  <p class="">${dto.getStoreCategory() }</p>
                  </app-row>
                  <h1>${dto.getStoreName() }</h1>
               </div>
            </div>
            </ba-detail-image-appbar>
         </section>
         <section class="poi-info">
         	
         
            <app-ba-detail-info>
            <ul>
               <li class="ng-star-inserted">
                  <div>
                     <img src="icon/market.png" alt="가게소개">
                  </div>
                  <p class="info-content description" style="cursor: pointer;"> ${dto.getStoreContent() }</p>
               </li>
               <li class="ng-star-inserted">
                  <div>
                     <img src="icon/location.png" alt="가게위치">
                  </div>
                  <p class="info-addr"> ${dto.getStorePlace() }</p>
               </li>
               <li class="ng-star-inserted">
                  <div>
                     <img src="icon/phone.png" alt="전화">
                  </div>
                  <p class="info-content"> ${dto.getStoreNum() }</p>
               </li>
            </ul>
            </app-ba-detail-info>
         </section>

         <!-- 지도표시 -->
         <section class="poi-map ng-star-inserted">
            <ba-detail-map>
            <div class="title-container">
               <h2>찾아가는 길</h2>
            </div>
            <a>
               <div class="map-container">
                  <div id="map" style="width: 100%; height: 350px;"></div>

                  <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f09f38934873c3cea48137e82c9ae86&libraries=services"></script>
                  <script>
                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                     mapOption = {
                        center : new kakao.maps.LatLng(33.450701,
                              126.570667), // 지도의 중심좌표
                        level : 3
                     // 지도의 확대 레벨
                     };

                     // 지도를 생성합니다    
                     var map = new kakao.maps.Map(mapContainer,
                           mapOption);

                     // 주소-좌표 변환 객체를 생성합니다
                     var geocoder = new kakao.maps.services.Geocoder();

                     // 주소로 좌표를 검색합니다
                     geocoder
                           .addressSearch(
                                 '${dto.getStorePlace() }',
                                 function(result, status) {

                                    // 정상적으로 검색이 완료됐으면 
                                    if (status === kakao.maps.services.Status.OK) {

                                       var coords = new kakao.maps.LatLng(
                                             result[0].y,
                                             result[0].x);

                                       // 결과값으로 받은 위치를 마커로 표시합니다
                                       var marker = new kakao.maps.Marker(
                                             {
                                                map : map,
                                                position : coords
                                             });

                                       // 인포윈도우로 장소에 대한 설명을 표시합니다
                                       var infowindow = new kakao.maps.InfoWindow(
                                             {
                                                content : '<div style="width:150px;text-align:center;padding:6px 0;">${dto.getStoreName() }</div>'
                                             });
                                       infowindow
                                             .open(map, marker);

                                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                       map.setCenter(coords);
                                    }
                                 });
                  </script>

               </div>
               <div class="click-overlay"></div>
               </div>
               <div class="map-address">
                  <p class="address-road"></p>
               </div>
            </a> </ba-detail-map>
         </section>
      </article>
      </ba-detail>
   </main>

   <!-- 로그인시 수정, 삭제 -->
   <div id="modify" style="margin-left: 73%;">
      <a href="dongne_main.do" style=""><img src="../img/home.png">메인으로</a>
      <a href="#" onclick="isLogin(${dto.getSeq()})"><img src="../img/modify.PNG">수정</a>
      <a href="#" onclick="isDelete(${dto.getSeq()})"><img src="../img/delete.PNG">삭제</a>
      </div>
   <br>

	<hr>
	
   <!-- 댓글부분 -->
   <div class="user">
      <!-- 데이터  -->
      <a href="#"><img alt="user" src="../img/user.PNG" align="left"></a>
      <div id="nickname">${dto.getId()}</div>
      <div id="region">${dto.getCity()}${dto.getGu()}</div>
   </div>
   <hr>
   <br>
   <hr>
   <br>

   <div id="reply">

      <strong style="font-size: 20px;">댓글 ${reply_list.size()} </strong> 
      <br>
      <br>
      <br>

      <div id="reply_view">
         <c:forEach var="dto" items="${reply_list}">
            <c:if test="${dto.re_lev > 1}">
               <c:forEach var="i" begin="1" end="${dto.re_lev}" step="1">
                  <div style="float: left;">&nbsp;&nbsp;</div>
               </c:forEach>
               <%-- 한글 ㅁ 을 치고, 한자키를 누르면 특수키 창이 열림 --%>
            </c:if>

            <img alt="user" src="../img/user.PNG" align="left">
            <p style="font-size: 15px; margin-bottom: 4px;"><strong>닉네임</strong></p>
            <p style="font-size: 15px;">${dto.storeContent}</p>
            <p style="font-size: 13px; color: gray; display: inline;">${dto.logtime}</p>
            <a class="re" href="#" style="font-size: 13px; color: gray;" onclick="return false;"></a>
            <!-- 작성자만 삭제.수정 가능하게끔 수정 -->
            <a class="modify" href="#" style="font-size: 13px; color: gray; float: right;" onclick="return false;"></a>
            <a href="replyDelete.do?seq=${dto.seq}&re_ref=${dto.re_ref}" style="font-size: 13px; color: gray; float: right; margin-right: 3px;">삭제</a>
            <hr style="height: 1px; border: 0; background-color: #dcdcdc; margin-top: 8px;">

            <!-- 작성자 상태일 경우만  수정 가능-->
            <div class="re_modify" id="CommentWriter"
               style="vertical-align: middle; display: none;">
               <p style="margin-bottom: 10px;">닉네임(수정)</p>
               <form action="replyModify.do?seq=${seq}" method="post">
                  <input type="hidden" name="re_lev" value="${dto.getRe_lev()}">
                  <input type="hidden" name="re_ref" value="${dto.getRe_ref()}">
                  <input type="hidden" name="re_seq" value="${dto.getRe_seq()}">
                  <textarea id="replyContent" name="reply_content" rows=1; cols=30;
                     placeholder="수정할 내용 입력하세요"></textarea>
                  <input id="reply_submit" type="submit" value="등록"> 
                  <a class="m_c" href="#" style="font-size: 13px; color: gray; float: right; margin-right: 3px;" onclick="return false;">취소</a>
               </form>
            </div>

            <!-- 로그인 상태일 경우만 등록가능하게 수정-->
				<div class="re_reply" id="CommentWriter"
					style="vertical-align: middle; display: none;">
					<p style="margin-bottom: 10px;">닉네임(수정)</p>
					<form action="replyWrite.do?seq=${seq}" method="post"  name="re_replyFrm">
						<input type="hidden" name="re_lev" value="${dto.getRe_lev()}">
						<input type="hidden" name="re_ref" value="${dto.getRe_ref()}">
						<input type="hidden" name="re_seq" value="${dto.getRe_seq()}">
						<textarea id="replyContent" name="reply_content" rows=1; cols=30;
							placeholder="댓글을 남겨보세요"></textarea>
						<input id="reply_submit" type="submit" value="등록" ><a
							class="c" href="#"
							style="font-size: 13px; color: gray; float: right; margin-right: 3px;"
							onclick="return false;">취소</a>
					</form>
				</div>
            <br>

         </c:forEach>

      </div>

      <br><br><br><br><br>
   </div>

   <!-- 로그인 상태일 경우만 등록가능 -->
   <div id="CommentWriter" style="vertical-align: middle;">
      <p style="margin-bottom: 10px;">닉네임(수정)</p>
      <form action="replyWrite.do?seq=${seq}" method="post" name="replyFrm">
         <input type="hidden" name="re_lev" value="${dto.getRe_lev()}">
         <input type="hidden" name="re_ref" value="${dto.getRe_ref()}">
         <input type="hidden" name="re_seq" value="${dto.getRe_seq()}">
         <textarea id="replyContent" name="reply_content" rows=1; cols=30; placeholder="댓글을 남겨보세요"></textarea>
         <input id="reply_submit" type="button" value="등록" onclick="replyCheck();">
      </form>
   </div>

   <hr style="color: gray;">
   <br>
   </responsive-container2>
  
   
</body>
</html>
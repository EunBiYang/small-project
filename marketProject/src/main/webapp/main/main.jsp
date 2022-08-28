<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네친구 같은,동친마켓!</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">

<link type="text/css" rel="stylesheet" href="../css/main.css">
</head>
<body >
   <!-- head 부분 -->
   <div style="">
   <header class="gnb-root" >
      <a style="" href="../main/main.jsp" style="margin-left: 220px;"><img alt="logo" src="../img/dongchin.JPG" height="100px;"></a>&nbsp;&nbsp;&nbsp;
      <a  href="../market/marketMain.do"><img style="overflow: hidden;" alt="marketlogo" src="../img/marketlogo.JPG" height="50x;"></a>&nbsp;&nbsp;
      <a  href="../storeboard/dongne_main.do" id="atag"><img style="overflow: hidden;" alt="storelogo" src="../img/storelogo.JPG" height="50px;"></a>
      <c:if test="${memId == null }">
         <a href="../member/loginForm.do" style="float:right; margin-right:40px;  margin-top: 50px;">로그인</a>
      </c:if>
      
      <c:if test="${memId != null }">
        <a href="../member/myPage.do" style="float:right; margin-right: 30px; margin-top: 50px;">나의 정보</a>
         <a href="../member/logout.do" style="float:right; margin-right: 30px; margin-top: 50px;">로그아웃 <strong>|</strong></a></c:if>
   </header>
   </div>

   <!-- content 부분 -->
   <section id="mainSection">
      <c:if test="${req == null}">
         <!-- 소개 부분 -->
         <article class="intro">
            <div id="intro1">
               <img id="introImg" alt="" src="../img/intro.JPG" >
            </div>
            <div id="intro2">   
               <h1><div style="display:inline; color: gray;">동친마켓</div>을 통해<br>중고거래부터<br> 주변가게 정보까지<br> 편리하게 찾아보세요!</h1>
            </div>
         </article>
         <!-- 중고거래 부분 -->   
         <article class="market">
            <div id="market1">
               <img id="imgMarket" src="../img/market1.png" >
            </div>
            
            <div id="market2" style="text-align: center; ">
               <button class="button1" type="button" onclick="location.href='../market/marketMain.do'">
               	중고마켓<br><P style="font-size: 20px;">우리 동내 중고 거래 물건을 구경해보세요!</P>
               </button>
            </div>
         </article>
         
         <!-- 동네가게부분 -->
         <article class="shop" style="text-align: center; ">
               <img id="imgMarket" src="../img/store.JPG" >
               <div id="market2" style="text-align: center; ">
               <button class="button2" type="button" onclick="location.href='../storeboard/dongne_main.do'">
               	동네가게<br><P style="font-size: 20px;">근처에 동내 가게들을 찾아보세요!</P>
               </button>
               </div>
         </article>
      </c:if>
      
      <c:if test="${req != null}">
            <jsp:include page="${req}" />
      </c:if>
      
   </section>


 <!-- footer 부분 -->
   <hr style="width: 100%;">
   <footer>
   <table style="margin: auto;">
      <tr>
         <td>
			<a href="https://ko-kr.facebook.com/daangn/" target="_blank">
				<img src="../storeboard/icon/logo-facebook.png" alt="페이스북 링크">
			</a> 
			<a href="https://blog.naver.com/daangn" target="_blank">
				<img src="../storeboard/icon/logo-naver.png" alt="네이버 링크">
			</a> 
			<a href="https://www.youtube.com/channel/UC8tsBsQBuF7QybxgLmStihA" target="_blank">
				<img src="../storeboard/icon/logo-youtube.png" alt="유투브 링크">
			</a> 
			<a href="https://www.instagram.com/daangnmarket/" target="_blank">
				<img src="../storeboard/icon/logo-instagram.png" alt="인스타그램 링크">
			</a> 
			<a href="https://twitter.com/daangnmarket" target="_blank"> 
				<img src="../storeboard/icon/logo-twitter.png" alt="트위터 링크">
			</a>

            <div id="infor">
            <p><strong>대표</strong> 이젠사팀 | <strong>사업자번호</strong> 3025-8250077</p>
            <p><strong>직업정보제공사업 신고번호</strong> 010-1623-0051</p>
            <p><strong>주소</strong> 서울특별시 서초구 서초4 서초대로77길 55 동</p>
            <p><strong>전화</strong>1544-1256 | <strong>고객문의</strong>cs@dongchinservice.com</p>
            </div>
            
         </td>
      </tr>
   </table>
   </footer>
   
</body>
</html>
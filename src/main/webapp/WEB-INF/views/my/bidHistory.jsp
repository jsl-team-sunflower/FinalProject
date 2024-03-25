<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
 <div class="mypage__container">
      <div class="mypage__sidebar">
        <h2 style="font-weight: bold">
          ${principal.username}<span style="font-size: 16px; font-weight: normal">님</span>
        </h2>
        <h3><b>온라인경매관리</b></h3>
        
         <div><a href="mypage?id=${principal.username}">등록한 상품내역</a></div>
        <div><a href="bidHistory?id=${principal.username}">진행중인 응찰내역</a></div>
        <div><a href="completeBidHistory?id=${principal.username}">완료된 응찰내역</a></div>
        <div><a href="payHistory">결제/구매내역</a></div>
        <h3><b>회원정보관리</b></h3>
        <div><a href="infoUpdate">회원정보수정</a></div>
      </div>
      <div class="mypage__main">
        <h2 class="mypage__main__title">응찰내역</h2>
        <ul class="myform__main__list">
        <c:forEach var="list" items="${list}" varStatus="status">
        <c:if test="${list.state == 1 }">
          <li>
          
          <a href="/auction/detail?productNum=${list.productNum}">
          	<input id="${list.productNum}" type="hidden" value="${list.startTime.plusDays(7)}">
            <c:forEach var="imglist" items="${list.attach}" varStatus="status">
						    <input id="${list.productNum}" type="hidden" value="${list.startTime.plusDays(7)}">
						    	<c:choose>
						    	<c:when test="${status.first}">
						    	<div >
						      		<img class="mypage__img" src="/photo/${imglist.uploadPath}/${imglist.uuid}_${imglist.uploadFile}" alt="...">
						      	</div>
						      	</c:when>
						      	</c:choose>
					      	</c:forEach>
            <div>물건번호: ${list.productNum}</div>
            <div>물건이름 : ${list.productName}</div>
            <div>작성자 : ${list.productWriter }</div>
            <div>가격: ${list.tenderPrice }</div>
            <div>남은시간: <span id="productNum:${list.productNum}의EndTime"></span></div>
          </a>
          </li>
          </c:if>
          </c:forEach>
          
        </ul>
      </div>
    </div>
<%@ include file="../footer.jsp" %>
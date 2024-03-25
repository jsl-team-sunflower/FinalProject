<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="/javascript/popup_2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../header.jsp"%>
<div class="pay__main__container">
<div>
<div class="order__img">
	<img src="/resources/images/payComplete.png"/>
	</div>
	<div class="order__main">
	<div>주문번호: ${vo.orderNum }</div>
	<div>주문자 이름: ${vo.orderName }</div>
	<div>상품명: ${product.productName }</div>
	<div>가격: ${product.tenderPrice}원</div>
	</div>
</div>


</div>
<%@ include file="../footer.jsp"%>

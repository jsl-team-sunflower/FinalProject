<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<meta charset="UTF-8">
<style>
body {
	margin-top: 50px;
}

.steps .step {
	display: block;
	width: 100%;
	margin-bottom: 35px;
	text-align: center;
	flex-shrink: 1;
}

.steps .step .step-icon-wrap {
	display: block;
	position: relative;
	width: 100%;
	height: 80px;
	text-align: center
}

.steps .step .step-icon-wrap::before, .steps .step .step-icon-wrap::after
	{
	display: block;
	position: absolute;
	top: 50%;
	width: 50%;
	height: 3px;
	margin-top: -1px;
	background-color: #e1e7ec;
	content: '';
	z-index: 1
}

.steps .step .step-icon-wrap::before {
	left: 0
}

.steps .step .step-icon-wrap::after {
	right: 0
}

.steps .step .step-icon {
	display: inline-block;
	position: relative;
	width: 80px;
	height: 80px;
	border: 1px solid #e1e7ec;
	border-radius: 50%;
	background-color: #f5f5f5;
	color: #374250;
	font-size: 38px;
	line-height: 81px;
	z-index: 5;
	padding-top: 20px;
	display: inline-block;
}

.steps .step .step-title {
	margin-top: 16px;
	margin-bottom: 0;
	color: #606975;
	font-size: 14px;
	font-weight: 500
}

.steps .step:first-child .step-icon-wrap::before {
	display: none
}

.steps .step:last-child .step-icon-wrap::after {
	display: none
}

.steps .step.completed .step-icon-wrap::before, .steps .step.completed .step-icon-wrap::after
	{
	background-color: #0da9ef
}

.steps .step.completed .step-icon {
	border-color: #0da9ef;
	background-color: #0da9ef;
	color: #fff
}

@media ( max-width : 576px) {
	.flex-sm-nowrap .step .step-icon-wrap::before, .flex-sm-nowrap .step .step-icon-wrap::after
		{
		display: none
	}
}

@media ( max-width : 768px) {
	.flex-md-nowrap .step .step-icon-wrap::before, .flex-md-nowrap .step .step-icon-wrap::after
		{
		display: none
	}
}

@media ( max-width : 991px) {
	.flex-lg-nowrap .step .step-icon-wrap::before, .flex-lg-nowrap .step .step-icon-wrap::after
		{
		display: none
	}
}

@media ( max-width : 1200px) {
	.flex-xl-nowrap .step .step-icon-wrap::before, .flex-xl-nowrap .step .step-icon-wrap::after
		{
		display: none
	}
}

.bg-faded, .bg-secondary {
	background-color: #f5f5f5 !important;
}

.card {
	margin: 30px;
}
</style>
</head>
<body>
	<div class="container padding-bottom-3x mb-1">
		<div class="card mb-3">
			<div class="p-4 text-center text-white text-lg bg-dark rounded-top"
				style="background: #ccc; height: 30px; font-size: 20px;">
				<span class="text-uppercase">Tracking Order No - </span> <span
					class="text-medium">${vo.orderNum }</span> <br>
			</div>
			<div
				class="d-flex flex-wrap flex-sm-nowrap justify-content-between py-3 px-2 bg-secondary col-lg-12"
				style="height: 60px;">
				<br>
				<div class="w-100 text-center py-1 px-2 col-lg-4">
					<span class="text-medium">화폐단위:</span> 
				</div>
				<div class="w-100 text-center py-1 px-2 col-lg-4">
					<span class="text-medium">주문상태:</span>
					<c:choose>
					<c:when test="${vo.orderState eq 0 }">
  미구매
 </c:when>
						<c:when test="${vo.orderState eq 1 }">
  입금대기중
 </c:when>
						<c:when test="${vo.orderState eq 2}">
  결제완료
 </c:when>
						<c:when test="${vo.orderState eq 3}">
  배송준비중 
 </c:when>
 				<c:when test="${vo.orderState eq 4}">
  배송중
 </c:when>
 				<c:when test="${vo.orderState eq 5}">
  배송완료 
 </c:when>
 </c:choose>
				</div>
				<div class="w-100 text-center py-1 px-2 col-lg-4">
					<span class="text-medium">주문날짜: </span><fmt:formatDate value="${vo.orderDate }" pattern="yyyy년 MM월 dd일 HH:mm"/> 
				</div>
			</div>
		</div>
		<div>
			<div class="card-body">
				<div
					class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x"
					style="margin-top: 75px;">
					<div
						class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x"
						style="display: flex;">

						<!-- 
							Delivery Status		: ds
							default				: 0
							Confirmed Order		: 1
							Processing Order	: 2
							Quality Check		: 3
							
							Product Dispatched	: 4
							Product Delivered	: 5
						-->
						<c:set var="ds" value="${ds}" />

						<c:set var="status" value="${ds >= 1 ? 'completed' : ''}" />
						<div class="step ${status}">
							<div class="step-icon-wrap">
								<div class="step-icon">
									<i class="pe-7s-cart"></i>
								</div>
							</div>
							<h4 class="step-title">입금대기중</h4>
						</div>
						<c:set var="status" value="${ds >= 2 ? 'completed' : ''}" />
						<div class="step ${status}">
							<div class="step-icon-wrap">
								<div class="step-icon">
									<i class="pe-7s-config"></i>
								</div>
							</div>
							<h4 class="step-title">결제완료</h4>
						</div>
						<c:set var="status" value="${ds >= 3 ? 'completed' : ''}" />
						<div class="step ${status}">
							<div class="step-icon-wrap">
								<div class="step-icon">
									<i class="pe-7s-medal"></i>
								</div>
							</div>
							<h4 class="step-title">배송준비중</h4>
						</div>
						<c:set var="status" value="${ds >= 4 ? 'completed' : ''}" />
						<div class="step ${status}">
							<div class="step-icon-wrap">
								<div class="step-icon">
									<i class="pe-7s-car"></i>
								</div>
							</div>
							<h4 class="step-title">배송중</h4>
						</div>
						<c:set var="status" value="${ds >= 5 ? 'completed' : ''}" />
						<div class="step ${status}">
							<div class="step-icon-wrap">
								<div class="step-icon">
									<i class="pe-7s-home"></i>
								</div>
							</div>
							<h4 class="step-title">배송완료</h4>
						</div>


					</div>
				</div>
			</div>
		</div>
		<div
			class="d-flex flex-wrap flex-md-nowrap justify-content-center justify-content-sm-between align-items-center">
			<div class="text-left text-sm-right"
				style="text-align: right; margin-right: 35px;">
			</div>
		</div>
	</div>
</body>
</html>
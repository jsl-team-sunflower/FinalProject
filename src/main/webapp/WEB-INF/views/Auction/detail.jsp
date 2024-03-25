<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="content-fluid">
	<div class="container">
	
		<div class="hyeon__row">
			<div class="hyeon__detail col-lg-12">
				<!-- 이미지 -->
				<div class="hyeon__image col-md-7">
					<div class="hyeon__carousel">
						<input type="radio" name="slides" checked="checked" id="slide-1">
						<input type="radio" name="slides" id="slide-2"> <input
							type="radio" name="slides" id="slide-3"> <input
							type="radio" name="slides" id="slide-4"> <input
							type="radio" name="slides" id="slide-5"> <input
							type="radio" name="slides" id="slide-6">
						<ul class="hyeon__carousel__slides">
							<c:forEach var="imglist" items="${vo.attach}">
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="/photo/${imglist.uploadPath}/${imglist.uuid}_${imglist.uploadFile}"
											alt="">
									</div>
								</figure>
							</li>
							</c:forEach>
						</ul>
						<ul class="hyeon__carousel__thumbnails">
							<c:forEach var="imglist" items="${vo.attach}" varStatus="status">
							<li><label for="slide-${status.count}">
							<img src="/photo/${imglist.uploadPath}/${imglist.uuid}_${imglist.uploadFile}"
									alt=""></label></li>
							</c:forEach>
						</ul>
					</div>
				</div>
					<!-- //이미지  -->
					
					<!-- 상품 가격 등록 -->
				<div class="hyeon__info col-md-5">
					<p>${vo.productName}</p>
					<div class="hyeon__date">
						<h2>
							D-<span class="hyeon__nowdate">10</span>
						</h2>
					</div>
					<div class="hyeon__price">
						<span class="hyeon__nowprice">현재 가격</span> ${vo.tenderPrice}원
					</div>
					<div class="hyeon__line">
					</div>
					<div class="hyeon__tender">
						<div class="hyeon__tenderPrice">
						<form name="tender" method="post" action="/auction/tender" onsubmit="return check()">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="text" id="hyeon__insertPrice" name="tenderPrice" placeholder="입찰 금액 입력">
							<button type="button" class="btn btn-default" id="hyeon__tenderbtn">
								<i class="glyphicon glyphicon-usd"></i>
							</button>
						</form>
						</div>
					</div>
				</div>
				<!-- 상품 가격등록 -->
				
			</div>
		</div>
	</div>
</div>

<script>
	/* 금액 ',' 구분자 넣기 */
	const input = document.querySelector('#hyeon__insertPrice');

	input.addEventListener('keyup', function(e) {
		var value = e.target.value;
		value = Number(value.replaceAll(',', ''));
		if (isNaN(value)) {
			input.value = 0;
		} else {
			const formatValue = value.toLocaleString('ko-KR');
			input.value = formatValue;
		}
	})
	
	function check() {
		const insertPrice = document.querySelector('#hyeon__insertPrice');
		const nowPrice = document.querySelector('.hyeon__nowprice');
		
		if(tender.tenderPrice.value=="") {
			alert("입찰 금액을 입력해주세요.");
		}
		if(parseInt(insertPrice)<=parseInt(nowPrice)) {
			alert("입찰 금액은 현재 가격보다 높아야합니다.");
		}
	}
</script>

<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$("#hyeon__tenderbtn").on("click", function(){
	const productNum = ${vo.productNum}
	const id = '<c:out value="${principal.username}"/>';
	const tenderPrice = $("#hyeon__insertPrice").val();
	
	if(id == '') {
		alert("로그인 후 이용해주세요.");
		return;
	}else if(tenderPrice == '') {
		alert("입찰 금액을 입력해주세요.");
	}
	
	const data={
			"productNum":productNum, 
			"id":id,
			"tenderPrice":tenderPrice
	};
	
	$.ajax({
		type:'post',
		url:'<c:url value="/auction/tender"/>',
		data: JSON.stringify(data),
		contentType: 'application/json',
		beforeSend: function(xhr){
			xhr.setRequestHearder(header, token);
		},
		success:function(response) {
			if(response === 'Success'){
				alert("입찰이 완료되었습니다.")
				$(".hyeon__nowprice").val(tenderPrice);
			}else{
				alert("로그인 후 이용해주세요.")
			}
		}, error:function(){
			alert("통신실패");
		}
	})//
});
</script>

<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="content-fluid">
	<div class="container">
		<div class="hyeon__row">
			<div class="hyeon__detail col-lg-12">
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
				<div class="hyeon__info col-md-5">
					<p>${vo.productName}</p>
					<div class="hyeon__date">
						<h2>
							D-<span class="hyeon__nowdate">${vo.dday}</span>
						</h2>
					</div>
					<div class="hyeon__price">
						<span class="hyeon__nowprice">현재 가격</span> ${vo.endPrice}원
					</div>
					<div class="hyeon__line">
					</div>
					<div class="hyeon__tender">
						<div class="hyeon__tenderPrice">
							<input type="text" id="hyeon__insertPrice" placeholder="입찰 금액 입력">
							<button type="submit" class="btn btn-default" id="hyeon__tenderbtn">
								<i class="glyphicon glyphicon-usd"></i>
							</button>
						</div>
					</div>
				</div>
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
</script>
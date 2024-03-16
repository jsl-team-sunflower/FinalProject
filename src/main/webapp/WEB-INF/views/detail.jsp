<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="content-fluid">
	<div class="container">
		<div class="row">
			<div class="detail col-lg-12">
				<div class="image col-md-7">
					<div class="carousel">
						<input type="radio" name="slides" checked="checked" id="slide-1">
						<input type="radio" name="slides" id="slide-2"> <input
							type="radio" name="slides" id="slide-3"> <input
							type="radio" name="slides" id="slide-4"> <input
							type="radio" name="slides" id="slide-5"> <input
							type="radio" name="slides" id="slide-6">
						<ul class="carousel__slides">
							<li class="carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg"
											alt="">
									</div>
								</figure>
							</li>
							<li class="carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/96428/pexels-photo-96428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/2558605/pexels-photo-2558605.jpeg?auto=compress&cs=tinysrgb&w=600"
											alt="">
									</div>
								</figure>
							</li>
						</ul>
						<ul class="carousel__thumbnails">
							<li><label for="slide-1"><img
									src="https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
									alt=""></label></li>
							<li><label for="slide-2"><img
									src="https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
									alt=""></label></li>
							<li><label for="slide-3"><img
									src="https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg"
									alt=""></label></li>
							<li><label for="slide-4"><img
									src="https://images.pexels.com/photos/96428/pexels-photo-96428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
									alt=""></label></li>
							<li><label for="slide-5"><img
									src="https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
									alt=""></label></li>
							<li><label for="slide-6"><img
									src="https://images.pexels.com/photos/2558605/pexels-photo-2558605.jpeg?auto=compress&cs=tinysrgb&w=600"
									alt=""></label></li>
						</ul>
					</div>
				</div>
				<div class="info col-md-5">
					<p>여기는 상품명</p>
					<div class="date">
						<h2>
							D-<span class="nowdate">10</span>
						</h2>
					</div>
					<div class="price">
						<span class="nowprice">현재 가격</span> 137,390원
					</div>
					<div class="line">
					</div>
					<div class="tender">
						<div class="tenderPrice">
							<input type="text" id="insertPrice" placeholder="입찰 금액 입력">
							<button type="submit" class="btn btn-default" id="tenderbtn">
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
	const input = document.querySelector('#insertPrice');

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
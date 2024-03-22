<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container-fluid">
	<div class="container">
		<div class="productRegistTitle">
			<h2>의뢰 신청</h2>
		</div>
		<div class="productForm col-lg-4">
		<div class="productFormTitle">
			신청서
		</div>
			<form name="product" method="post" enctype="multipart/form-data" action="/product/regist" onsubmit="return check()">
				<div class="productWrite">
					<input type="text" name="productname" id="productname" placeholder="상품명 입력">
					<input type="text" id="writer" name="writer" placeholder="의뢰인 입력">
					<input tupe="text" id="startprice" name="startprice" placeholder="시작가 입력">
					<input type="file" name="uploadfile" id="uploadfile" multiple="multiple">
					<div class="product-btn">
						<button type="button" class="regist btn_see">미리보기</button>&nbsp;&nbsp;
						<input type="submit" value="저장" class="regist btn_ok">&nbsp;&nbsp;
					</div>
				</div>
			</form>
		</div> <!-- 의뢰 신청 -->
		<div class="preview col-lg-8">
		<div class="preview-title">
			미리보기
		</div>
		<div class="previewimage col-md-6">
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
				<div class="preview-info col-md-6">
					<p>여기는 상품명</p>
					<div class="preview-date">
						<h2>
							D-<span class="preview-nowdate">10</span>
						</h2>
					</div>
					<div class="preview-price">
						<span class="preview-nowprice">현재 가격</span> 137,390원
					</div>
					<div class="preview-line">
					</div>
					<div class="preview-tender">
						<div class="preview-tenderPrice">
							<input type="text" id="preview-insertPrice" placeholder="입찰 금액 입력" readonly>
							<button type="submit" class="btn btn-default" id="preview-tenderbtn">
								<i class="glyphicon glyphicon-usd"></i>
							</button>
						</div>
					</div>
				</div>
		</div>
	</div> <!-- container -->
</div>


<script>
	const input = document.querySelector('#startprice');
	
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

		if (product.productname.value == "") {
			alert("물품명을 입력해주세요.");
			product.productname.focus();
			return false;
		}
		if (product.writer.value == "") {
			alert("의뢰자를 입력해주세요.");
			product.writer.focus();
			return false;
		}
		var uploadFile = document.getElementById("uploadfile").value;

		/* if(uploadFile.includes('')){
			alert("첨부파일 이름에 공백이 포함되어 있습니다. 공백을 제거해 주세요.");
			return false;
		} */

		return true;
	}
</script>

<script>
	$(function() {
		$("#uploadfile").on('change',function(e) {
			if ($("#uploadfile").val() != "") {
				var ext = $("#uploadfile").val().split('.')
						.pop().toLowerCase();
				if ($.inArray(ext, [ 'gif', 'jpg', 'png',
						'jpeg' ]) == -1) {
					//ext에 저장된 값이 []배열에 저장되지 않았으면 -1 return
					alert("이미지만 첨부할 수 있습니다.");
					$("#uploadfile").val("");
					return false;
				}
			}
		})
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container-fluid">
	<div class="container">
		<div class="hyeon__productRegistTitle">
			<h2>의뢰 신청</h2>
		</div>
		<div class="hyeon__productForm col-lg-4">
		<div class="hyeon__productFormTitle">
			신청서
		</div>
			<form name="product" method="post" enctype="multipart/form-data" action="/auction/regist" onsubmit="return check()">
				<div class="hyeon__productWrite">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="text" id="hyeon__productname" name="productName" placeholder="상품명 입력">
					<input type="text" id="hyeon__writer" name="productWriter" value="${principal.username}" readonly>
					<input type="text" id="hyeon__startprice" name="startPrice" value="0">
					<span class="hyeon__pwrite">시작가를 입력해주세요.</span>
					<input type="file" name="uploadfile" id="hyeon__uploadfile" multiple="multiple">
					<div class="hyeon__product-btn">
						<button type="button" class="hyeon__regist btn_see" id="hyeon__previewer">미리보기</button>&nbsp;&nbsp;
						<input type="submit" value="저장" class="hyeon__regist btn_ok">&nbsp;&nbsp;
					</div>
				</div>
			</form>
		</div> <!-- 의뢰 신청 -->
		<div class="hyeon__preview col-lg-8">
		<div class="hyeon__preview-title">
			미리보기
		</div>
		<div class="hyeon__previewimage col-md-6">
					<div class="hyeon__carousel">
						<input type="radio" name="slides" checked="checked" id="slide-1">
						<input type="radio" name="slides" id="slide-2"> <input
							type="radio" name="slides" id="slide-3"> <input
							type="radio" name="slides" id="slide-4"> <input
							type="radio" name="slides" id="slide-5"> <input
							type="radio" name="slides" id="slide-6">
						<ul class="hyeon__carousel__slides">
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg"
											alt="">
									</div>
								</figure>
							</li>
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/96428/pexels-photo-96428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
											alt="">
									</div>
								</figure>
							</li>
							<li class="hyeon__carousel__slide">
								<figure>
									<div>
										<img
											src="https://images.pexels.com/photos/2558605/pexels-photo-2558605.jpeg?auto=compress&cs=tinysrgb&w=600"
											alt="">
									</div>
								</figure>
							</li>
						</ul>
						<ul class="hyeon__carousel__thumbnails">
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
				<div class="hyeon__preview-info col-md-6">
					<p class="hyeon__previewer-product">상품명</p>
					<div class="hyeon__preview-date">
						<h2>
							<span class="hyeon__preview-nowdate">남은 시간</span>
						</h2>
					</div>
					<div class="hyeon__preview-price">
						<span class="hyeon__preview-nowprice">현재 가격</span> <span class="hyeon__previewer-price">000,000원</span>
					</div>
					<div class="hyeon__preview-line">
					</div>
					<div class="hyeon__preview-tender">
						<div class="hyeon__preview-tenderPrice">
							<input type="text" id="hyeon__preview-insertPrice" placeholder="입찰 금액 입력" readonly>
							<button type="submit" class="btn btn-default" id="hyeon__preview-tenderbtn" disabled="disalbed">
								<i class="glyphicon glyphicon-usd"></i>
							</button>
						</div>
					</div>
				</div>
		</div>
	</div> <!-- container -->
</div>


<script>
	function check() {

		if (product.productname.value == "") {
			alert("상품명을 입력해주세요.");
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
	
	const input = document.querySelector('#hyeon__startprice');
	
	input.addEventListener('keyup', function(e) {
		var value = e.target.value;
		value = Number(value.replaceAll(',', ''));
		if (isNaN(value)) {
			input.value = 0;
		} else {
			const formatValue = value.toLocaleString('ko-KR');
			input.value = formatValue;
		}
	});
	
	$("#hyeon__previewer").on("click", function(){
		const productName = $("#hyeon__productname").val();
		
		$(".hyeon__previewer-product").html(productName);
		$(".hyeon__previewer-price").html(input.value+"원");
        $(".hyeon__preview-nowdate").html("7일 0시간 0분 0초");
	});//click
</script>

<%@ include file="../footer.jsp" %>
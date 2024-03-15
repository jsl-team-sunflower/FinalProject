<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="content-fluid">
	<div class="container">
		<div class="row">
			<div class="index col-lg-12">
				<div class="image col-md-7">
				<!-- 긁은 거 -->
					<div class="carousel">
		            <input type="radio" name="slides" checked="checked" id="slide-1">
		            <input type="radio" name="slides" id="slide-2">
		            <input type="radio" name="slides" id="slide-3">
		            <input type="radio" name="slides" id="slide-4">
		            <input type="radio" name="slides" id="slide-5">
		            <input type="radio" name="slides" id="slide-6">
		            <ul class="carousel__slides">
		                <li class="carousel__slide">
		                    <figure>
		                        <div>
		                            <img src="https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
		                        </div>
		                    </figure>
		                </li>
		                <li class="carousel__slide">
		                    <figure>
		                        <div>
		                            <img src="https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
		                        </div>
		                    </figure>
		                </li>
		                <li class="carousel__slide">
		                    <figure>
		                        <div>
		                            <img src="https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg" alt="">
		                        </div>
		                    </figure>
		                </li>
		                <li class="carousel__slide">
		                    <figure>
		                        <div>
		                            <img src="https://images.pexels.com/photos/96428/pexels-photo-96428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
		                        </div>
		                    </figure>
		                </li>
		                <li class="carousel__slide">
		                    <figure>
		                        <div>
		                            <img src="https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
		                        </div>
		                    </figure>
		                </li>
		                <li class="carousel__slide">
		                    <figure>
		                        <div>
		                            <img src="https://images.pexels.com/photos/2071873/pexels-photo-2071873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
		                        </div>
		                    </figure>
		                </li>
		            </ul>    
	            <ul class="carousel__thumbnails">
	                <li>
	                    <label for="slide-1"><img src="https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></label>
	                </li>
	                <li>
	                    <label for="slide-2"><img src="https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></label>
	                </li>
	                <li>
	                    <label for="slide-3"><img src="https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg" alt=""></label>
	                </li>
	                <li>
	                    <label for="slide-4"><img src="https://images.pexels.com/photos/96428/pexels-photo-96428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></label>
	                </li>
	                <li>
	                    <label for="slide-5"><img src="https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></label>
	                </li>
	                <li>
	                    <label for="slide-6"><img src="https://images.pexels.com/photos/2071873/pexels-photo-2071873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></label>
	                </li>
	            </ul>
	        </div>
				<!-- 긁은 거 -->
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
					<div class="tender">
						<div class="tenderPrice">
							<input type="text" id="insertPrice" placeholder="입찰 금액 입력">
							<button type="submit" class="btn btn-default" id="tenderbtn">
							<i class="glyphicon glyphicon-usd"></i></button>
						</div>
						<button type="button" class="btn btn-default" id="tender" onclick="javascript:insertTender();">입찰</button>
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
  if(isNaN(value)) {
    input.value = 0;
  }else {
    const formatValue = value.toLocaleString('ko-KR');
    input.value = formatValue;
  }
})

/* 입찰 버튼 클릭 시 가려둔 text box, button 보이기 */
function insertTender(){
	const btn = document.getElementsByClassName("tenderPrice")[0];
	
	if(btn.style.visibility==='hidden') {
		btn.style.visibility='visible';
	} else {
		btn.style.visibility='hidden';
	}
}
</script>

<!--  data-toggle="modal" data-target="#myModal"
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      	<h5>입찰 금액 입력</h5>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
	        	<div class="tenderitem">
				<input type="text" class="form-control" rows="3" id="tenderPrice" placeholder="">
				</div>
				<div class="tenderitem">
	        	<button type="button" class="btn btn-primary" id="btnTender">입찰</button>
	        	</div>
	      </div>
	    </div>
	  </div>
	</div>
</div> -->
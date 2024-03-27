<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="content-fluid">
	<div class="container">
	
		<div class="hyeon__row">
			<div class="hyeon__detail col-lg-12">
			
				<div class="hyeon__image col-md-7">
				<input id="${vo.productNum }"type="hidden" 
				value="${vo.startTime.plusDays(7) }">
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
							<span class="hyeon__nowdate" id="productNum:${vo.productNum}의EndTime"></span>
						</h2>
					</div>
					<div class="hyeon__price">
					<c:choose>
						<c:when test="${vo.state==1}">
							<span class="hyeon__nowprice" >현재 가격</span> <span class="hyeon__pricenow">${vo.tenderPrice}</span>원
						</c:when>
						<c:when test="${vo.state==0}">
							<span class="hyeon__nowprice" >낙찰 가격</span> <span class="hyeon__pricenow">${vo.tenderPrice}</span>원
						</c:when>
					</c:choose>
					</div>
					<div class="hyeon__line">
					</div>
					<div class="hyeon__tender">
						<div class="hyeon__tenderPrice">
						<c:choose>
							<c:when test="${vo.state==1}">
								<form name="tender" method="post" action="/auction/tender">
									<input type="text" id="hyeon__insertPrice" name="tenderPrice" placeholder="입찰 금액 입력">
									<button type="button" class="btn btn-default" id="hyeon__tenderbtn">
										<i class="glyphicon glyphicon-usd"></i>
									</button>
								</form>
							</c:when>
							<c:when test="${vo.state==0}">
								<form name="tender" method="post">
									<input type="text" id="hyeon__insertPrice" name="tenderPrice" placeholder="종료된 경매입니다." readonly>
									<button type="button" class="btn btn-default" id="hyeon__tenderbtn" disabled='disabled'>
										<i class="glyphicon glyphicon-usd"></i>
									</button>
								</form>
							</c:when>
						</c:choose>
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
	
	function check(tenderPrice){
		var nowPrice = "${vo.tenderPrice}";
		
		tenderPrice=tenderPrice.replace(',','');
		nowPrice= nowPrice.replace(',','');
		
		tenderPirce=parseInt(tenderPrice);
		nowPrice=parseInt(nowPrice);
		
		if(tenderPrice<=nowPrice) {
			alert("입찰 금액은 현재 가격보다 높아야합니다.");
			document.querySelector('#hyeon__insertPrice').value = "";
			return false;
		}
		return true;
	}
	
</script>

<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$("#hyeon__tenderbtn").on("click", function(){
	const productNum = ${vo.productNum};
	const id = '<c:out value="${principal.username}"/>';
	const tenderPrice = $("#hyeon__insertPrice").val();
	
	if(id === '') {
		alert("로그인 후 이용해주세요.");
		$(location).attr('href', 'http://localhost:8067/login');
		return;
	}else if(tenderPrice === '') {
		alert("입찰 금액을 입력해주세요.");
		return;
	}
	
	if(!check(tenderPrice)) {
		return;
	}
	
	const data={
			"productNum":productNum, 
			"id":id,
			"tenderPrice":tenderPrice
	};
	
	$.ajax({
		type:'post',
		url:"/auction/tender",
		data: JSON.stringify(data),
		contentType: 'application/json',
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success:function(response) {
			if(response === 'Success'){
				alert("입찰이 완료되었습니다.");
				$(".hyeon__pricenow").html(tenderPrice);
				$("#hyeon__insertPrice").val(null);
			}else{
				alert("로그인 후 이용해주세요.");
				$(location).attr('href', 'http://localhost:8067/login');
				return;
			}
		}, error:function(request, error){
			alert("fail");
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	})//
});

/* function timeCalculOne(){
    var Time = document.getElementById("${vo.productNum}").value;
    // 두 개의 날짜 생성
    var date1 = new Date(); 
    var date2 = new Date(Time); 

    // 날짜 연산
    var diffInMilliseconds = date2.getTime() - date1.getTime();
	var productNum=${vo.productNum};
	var state=${vo.state};
	
    var data={
    		"productNum":productNum
    };

    if(diffInMilliseconds==0){
	    	$.ajax({
	    		type:'post',
	    		url:"/auction/tenderState",
	    		data: JSON.stringify(data),
	    		contentType:'application/json',
	    		beforeSend: function(xhr){
	    			xhr.setRequestHeader(header, token);
	    		},
	    		success:function(response){
	    			$("#hyeon__insertPrice").attr("placeholder", "종료된 경매입니다.");
	   				$("#hyeon__insertPrice").attr("readonly",true); 
	   				$("#hyeon__tenderbtn").attr("disabled",true);
	    		}, error:function(request, error){
	    			alert("fail");
	    			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    		}
	    	})//ajax
    }//if
    
    // 밀리초를 일, 시간, 분, 초로 변환
    var days = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
    var hours = Math.floor((diffInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((diffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((diffInMilliseconds % (1000 * 60)) / 1000);

    // 결과 출력
    var findId = "productNum:" + ${vo.productNum} + "의EndTime";
    var clockDiv = document.getElementById(findId);
    clockDiv.innerHTML = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
}

setInterval(timeCalculOne, 1000);  */
</script>

<%@ include file="../footer.jsp" %>
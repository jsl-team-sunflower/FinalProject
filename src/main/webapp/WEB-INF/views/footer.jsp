<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.social {
    display: flex;
    margin-right: 10px;
    justify-content: space-evenly;
}
.social a {
    display: flex;
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background-color: #f9e6d4;
    color: #fba543;
    font-size: 14px;
    -webkit-transition: all all 0.5s ease-out 0s;
    -moz-transition: all all 0.5s ease-out 0s;
    -ms-transition: all all 0.5s ease-out 0s;
    -o-transition: all all 0.5s ease-out 0s;
    transition: all all 0.5s ease-out 0s;
}
.social a:hover,
.social a:focus {
    background-image: -moz-linear-gradient(0deg, #ffbd27 0%, #feb000 100%);
    background-image: -webkit-linear-gradient(0deg, #ffbd27 0%, #feb000 100%);
    background-image: -ms-linear-gradient(0deg, #ffbd27 0%, #feb000 100%);
    color: #fff;
    box-shadow: 2.5px 4.33px 15px 0px rgba(254, 176, 0, 0.4);
}

.btn-primary {
    color: #000;
    background-color: #fdcc00;
    border-color: #2e6da4;
    margin: -15px;
    margin-bottom: auto;
}
</style>
	<div class="scroll_top-box">
		
			<div class="chat">
				<a href="http://localhost:8090/Anonymous/index.jsp" onclick="window.open(this.href, '_blank', 'width=620, height=535 location=no'); return false;" class="btn btn-primary" >1:1 상담</a>
			</div>
					
			<div class="box-inner">
				<a href="#" class="btn-scroll_top js-scroll_top show"><i
					class="icon-scroll_top"></i></a>
			</div>
		</div>
<div class="container-fluid"><hr></div>
    <footer id="footer">
	<div class="footer_wrap">
		<div class="row">
			<div class="col-lg-3 footerlogo">
				<img src="/resources//images/HIMAWARI.png" alt="" id="footer-img">
				<div class="social" style="margin-right: 100px; font-size: 35px;">
				<br>
					<a href="#"><i class="fab fa-facebook-f"></i></a>
					<a href="#"><i class="fab fa-twitter"></i></a>
					<a href="#"><i class="fab fa-instagram"></i></a>
				</div>	
			</div>
			<div class="col-lg-9">
				<p> HIMAWARI이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 
				HIMAWARI은 통신판매중개자이며 통신판매의 당사자가 아닙니다.</p>
				<p>따라서 HIMAWARI은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
				<p>HIMAWARI 웹사이트의 콘텐츠(이미지/문자/영상/화면 등)에 대한 무단 복제, 배포, 전송, 게시, 크롤링/스크래핑 등 행위는 저작권법,<br> 
				부정경쟁방지 및 영업비밀보호에 관한 법률 등 관련 법령에 의하여 금지됩니다.</p>
			</div>
		</div>
		<p>
           
           </p>
	</div>
</footer>



<script>
function timeCalculList(){
    <c:forEach items="${list}" var="list" >
        var Time = document.getElementById("${list.productNum}").value;
        // 두 개의 날짜 생성
        var date1 = new Date(); 
        var date2 = new Date(Time); 

        // 날짜 연산
        var diffInMilliseconds = date2.getTime() - date1.getTime();

        // 밀리초를 일, 시간, 분, 초로 변환
        var days = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diffInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diffInMilliseconds % (1000 * 60)) / 1000);

        // 결과 출력
        var findId = "productNum:" + ${list.productNum} + "의EndTime";
        var clockDiv = document.getElementById(findId);
        clockDiv.innerHTML = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
    </c:forEach>
}

function timeCalculOne(){
        var Time = document.getElementById("${vo.productNum}").value;
        // 두 개의 날짜 생성
        var date1 = new Date(); 
        var date2 = new Date(Time); 

        // 날짜 연산
        var diffInMilliseconds = date2.getTime() - date1.getTime();

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

setInterval(timeCalculList, 1000);
 setInterval(timeCalculOne, 1000);

</script>

</body>
</html>
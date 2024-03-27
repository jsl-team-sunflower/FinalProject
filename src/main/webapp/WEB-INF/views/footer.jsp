<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <footer id="footer">
	<div class="footer_wrap">
		<div class="row">
			<div class="col-lg-3 footerlogo">
				<img src="/resources//images/HIMAWARI.png" alt="" id="footer-img">
			</div>
			<div class="col-lg-9">
				<p> HIMAWARI이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 
				HIMAWARI은 통신판매중개자이며 통신판매의 당사자가 아닙니다.</p>
				<p>따라서 HIMAWARI은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
				<p>HIMAWARI 웹사이트의 콘텐츠(이미지/문자/영상/화면 등)에 대한 무단 복제, 배포, 전송, 게시, 크롤링/스크래핑 등 행위는 저작권법, 
				부정경쟁방지 및 영업비밀보호에 관한 법률 등 관련 법령에 의하여 금지됩니다.</p>
			</div>
		</div>
		<p>
           
           </p>
	</div>
</footer>



<script>
/* var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

    function timeCalculList(){
    <c:forEach items="${list}" var="list">
        var Time = document.getElementById("${list.productNum}").value;
        // 두 개의 날짜 생성
        var date1 = new Date(); 
        var date2 = new Date(Time); 

        // 날짜 연산
        var diffInMilliseconds = date2.getTime() - date1.getTime();
		var productNum=${list.productNum};
        
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
        			location.replace(location.href);
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
        var findId = "productNum:" + ${list.productNum} + "의EndTime";
        var clockDiv = document.getElementById(findId);
        clockDiv.innerHTML = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
    </c:forEach>
}

setInterval(timeCalculList, 1000); */
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="/javascript/popup_2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%@ include file="../header.jsp"%>
<div class="pay__main__container">
      <h3 class="pay__main__title">상품확인</h3>
      <table class="pay__main__table">
        <thead>
          <tr>
            <th scope="col">상품명</th>
            <th scope="col">낙찰가</th>
        
            <th scope="col">배송일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">
              <c:forEach var="imglist" items="${vo.attach}">
										<img style="width:200px;"
											src="/photo/${imglist.uploadPath}/${imglist.uuid}_${imglist.uploadFile}"
											alt=""><span style="margin-left:20px;">${vo.productName}</span>
							</c:forEach>
							
            </th>
            <td>${vo.tenderPrice }원</td>
            <td>${vo.startTime.toLocalDate().plusDays(17) }</td>
          </tr>
        </tbody>
      </table>
      
      
      <h3 class="pay__main__title">배송주소</h3>

      <div class="pay__table__box">
      <form name="order" id="order">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <table class="table">
          <h4 class="pay__main__table__title">주문고객</h4>
          <tr>
            <th>이름</th>
            <td>
              <input type="text" class="pay__table__name"  id="name" value="${user.name }" />
            </td>
          </tr>
          <tr>
            <th>휴대폰</th>
            <td>
              <input class="pay__table__name" type="text" id="tel" value="${user.phone }" />
            </td>
          </tr>
          <tr>
             <th>배송주소</th>
            <td>
              <input class="pay__table__address" type="text" id="address" value="${user.address }" />
              
          </tr>
        </table>
        <div class="pay__table__divider"></div>
        <table class="table">
          <h4 class="pay__main__table__title">배송정보</h4>


<input type="hidden" name="productNum" value="${vo.productNum }"/>
<input type="hidden" name="orderState" value="1"/>
          <tr>
            <th>배송지</th>
            <td>
              <span><input type="checkbox" id="modifyCheckbox" /> </span>주문자 정보와 동일
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td><input class="pay__table__name"  name="orderName" id="editableName" type="text" /></td>
          </tr>
          <tr>
            <th>휴대폰</th>
            <td>
             <input class="pay__table__name" name="orderPhone" id="editableTel" type="text" />
            </td>
          </tr>
          <tr>
            <th>배송주소</th>
            <td>
              <input class="pay__table__address" name="orderAddress" id="editableAddress" type="text" /><button
                type="button"
                class="pay__table__address--btn"
                onclick="sample6_execDaumPostcode()"
              >
                주소찾기
              </button>
            </td>
          </tr>
          
        </table>
         </form>
      </div>
    </div>
    <div class="pay__bottom">
      <button type="submit" class="pay__bottom__btn" onclick="fn_order('${vo.tenderPrice}','${user.name }','${vo.productName}')">결제하기</button>
    </div>
   
    <script>
	//체크박스 상태에 따라 수정 가능한 테이블을 표시하거나 숨김
	document
			.getElementById('modifyCheckbox')
			.addEventListener(
					'change',
					function() {
						var nameField = document.getElementById('editableName');
						var telField = document.getElementById('editableTel');
						var addressField = document
								.getElementById('editableAddress');

						// 체크박스 선택 여부에 따라 수정 가능한 테이블의 값을 설정
						if (this.checked) {
							// 체크된 경우, readonly 테이블의 값을 가져와서 수정 가능한 테이블에 설정
							nameField.value = document.getElementById('name').value;
							telField.value = document.getElementById('tel').value;
							addressField.value = document
									.getElementById('address').value;
						} else {
							// 체크 해제된 경우, 모든 입력 필드 초기화
							nameField.value = '';
							telField.value = '';
							addressField.value = '';
						}
					});
</script>
<script>
function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.querySelector('#editableAddress').value = data.zonecode+' '+ addr+ extraAddr;
				} else {
					document.querySelector('#editableAddress').value = '';
				}
			}
		}).open();
	}
	</script>
	<script>
	function fn_order(price,name,productName) {
		console.log(price,name,productName)
		if (!order.editableName.value) {
			alert("이름을 입력하세요");
			order.editableName.focus();
			return false;
		}
		if (!order.editableTel.value) {
			alert("휴대폰을 입력하세요");
			order.editableTel.focus();
			return false;
		}
		if (!order.editableAddress.value) {
			alert("주소를 입력하세요");
			order.editableAddress.focus();
			return false;
		}
		
		var msg = "${msg}"; // 자바 속성값을 자바 변수에 저장 할 수 있다.
		
		
		IMP.init("imp44553606")
		IMP.request_pay({
			pg : 'kakaopay.TC0ONETIME',
			amount : price,
			buyer_name : name,
			name : productName
		}, function(response) {
			//결제 후 호출되는 callback함수
			if ( response.success ) { //결제 성공
				console.log(response);
				var form = document.order;
				form.method = "post";
				form.action = "/pay/order";
				form.submit();
			} else {
				alert('결제실패 : ' + response.error_msg);
			}
		})
		
		
	}
	</script>
<%@ include file="../footer.jsp"%>

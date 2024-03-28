<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<!-- 그래프 -->
<link rel="stylesheet" href="hyeon.css">
<div class="content-fluid">
	<div class="container">

		<div class="hyeon__row">
			<div class="hyeon__detail col-lg-12">

				<div class="hyeon__image col-md-7">
					<input id="${vo.productNum }" type="hidden"
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
								<li><label for="slide-${status.count}"> <img
										src="/photo/${imglist.uploadPath}/${imglist.uuid}_${imglist.uploadFile}"
										alt=""></label></li>
							</c:forEach>
						</ul>
					</div>
					<div class="blank-height" style="border-bottom: 1px solid #ccc;"></div>
					<div class="blank-height"></div>
					<!-- 그래프가 들어오는 곳 -->
					<div class="graph">
						<div id="chart01"></div>

					</div>
					<!-- 그래프가 들어오는 곳 -->
				</div>


				<div class="hyeon__info col-md-5" style="position: sticky; top: 0;">
					<p>${vo.productName}</p>
					<div class="hyeon__date">
						<h2>
							D-<span class="hyeon__nowdate"
								id="productNum:${vo.productNum}의EndTime"></span>
						</h2>
					</div>
					<div class="hyeon__price">
						<c:choose>
							<c:when test="${vo.state==2}">
								<span class="hyeon__nowprice">현재 가격</span>
								<span class="hyeon__pricenow">${vo.tenderPrice}</span>원
						</c:when>
							<c:when test="${vo.state==0}">
								<span class="hyeon__nowprice">낙찰 가격</span>
								<span class="hyeon__pricenow">${vo.tenderPrice}</span>원
						</c:when>
						</c:choose>
					</div>
					<div class="hyeon__line"></div>
					<div class="hyeon__tender">
						<div class="hyeon__tenderPrice">
							<c:choose>
								<c:when test="${vo.state==2}">
									<form name="tender" method="post" action="/auction/tender">
										<input type="text" id="hyeon__insertPrice" name="tenderPrice"
											placeholder="입찰 금액 입력">
										<button type="button" class="btn btn-default"
											id="hyeon__tenderbtn">
											<i class="glyphicon glyphicon-usd"></i>
										</button>
									</form>
								</c:when>
								<c:when test="${vo.state==0}">
									<form name="tender" method="post">
										<input type="text" id="hyeon__insertPrice" name="tenderPrice"
											placeholder="종료된 경매입니다." readonly>
										<button type="button" class="btn btn-default"
											id="hyeon__tenderbtn" disabled='disabled'>
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="chart.js">	</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
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

	function check(tenderPrice) {
		var nowPrice = "${vo.tenderPrice}";

		tenderPrice = tenderPrice.replace(',', '');
		nowPrice = nowPrice.replace(',', '');

		tenderPirce = parseInt(tenderPrice);
		nowPrice = parseInt(nowPrice);

		if (tenderPrice <= nowPrice) {
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

	$("#hyeon__tenderbtn").on("click",function() {
		
				const productNum = ${vo.productNum};				
				const id = '<c:out value="${principal.username}"/>';
				const tenderPrice = $("#hyeon__insertPrice").val();

				if (id === '') {
					alert("로그인 후 이용해주세요.");
					$(location).attr('href', 'http://localhost:8067/login');
					return;
				} else if (tenderPrice === '') {
					alert("입찰 금액을 입력해주세요.");
					return;
				}

				if (!check(tenderPrice)) {
					return;
				}

				const data = {
					"productNum" : productNum,
					"id" : id,
					"tenderPrice" : tenderPrice
				};

				$.ajax({
					type : 'post',
					url : "/auction/tender",
					data : JSON.stringify(data),
					contentType : 'application/json',
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(response) {
						
						if (response === 'Success') {
							alert("입찰이 완료되었습니다.");
							$(".hyeon__pricenow").html(tenderPrice);
							$("#hyeon__insertPrice").val(null);
							window.location.reload();
						} else {
							alert("로그인 후 이용해주세요.");
							$(location).attr('href',
									'http://localhost:8067/login');
							return;
						}
					},
					error : function(request, error) {
						alert("fail");
						alert("code: " + request.status + "\n" + "message: "
								+ request.responseText + "\n" + "error: "
								+ error);
					}
				})//
				
			});
</script>

<script>
function makeGraph() {
    Highcharts.chart('chart01', {
        title: {
            text: null
        },
        subtitle: {
            text: null
        },
        yAxis: {
            title: {
                text: '1k 단위',
                style: {
                    fontSize: '16px' // y축 제목 폰트 크기 변경
                }
            },
            labels: {
                style: {
                    fontSize: '12px' // y축 레이블 폰트 크기 변경
                }
            }
        },
        xAxis: {
            title: {
                text: '입찰 횟수',
                style: {
                    fontSize: '16px' // x축 제목 폰트 크기 변경
                }
            },
            accessibility: {
                rangeDescription: null
            }
        },
        legend: {
            align: 'right',
            verticalAlign: 'bottom',
            itemStyle: {
                fontSize: '12px' // 레전드의 폰트 크기 변경
            }
        },
        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false,
                    style: {
                        fontSize: '14px' // 시리즈 레이블의 폰트 크기를 14px로 설정
                    }
                },
                pointStart: 1
            }
        },
        series: [{
            name: '입찰가격',
            data: ${Ilist}, // 데이터 입력 부분에 대한 정보가 없으므로 수정이 필요합니다.
        }],
        credits: {
            enabled: false
        },
        tooltip: {
            shared: false,
            crosshairs: true,
            fontSize: '16px',
        },
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }
    });
}

$(document).ready(function() {
    makeGraph();
    // 주기적으로 그래프 업데이트
    setInterval(makeGraph, 5000);
});
</script>



<%@ include file="../footer.jsp"%>
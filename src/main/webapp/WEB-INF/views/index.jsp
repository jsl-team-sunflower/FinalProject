<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="header.jsp"%>

<!-- 영상 스르릉 영역 시작 -->

<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="/resources//images/mainImage1.jpg" alt="" >
		</div>
		<div class="item">
			<img src="/resources//images/mainImage2.jpg" alt="">
		</div>
		<div class="item">
			<img src="/resources//images/mainImage3.jpg" alt="">
		</div>
	</div>
	<!-- Controls -->
	<div class="prevControl">
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev" id="left-control"> <span
			class="sr-only">Previous</span>
		</a>
	</div>
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>
	<div class="nextControl">
		<a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next" id="right-control"> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>


<div class="blank-height"></div>
<!-- 영상 스르릉 영역 끝 -->


<div class="content-fluid HWAN_mainClass">
	<div class="HWAN__container">
		<div class="row HWAN__mainClassRow">
		
			<!-- 오른쪽 content 영역 -->
			<div class="col-lg-10 HWAN__ContentSection">
				<div class="HWAN__home-title-section ">
					<h2 class="HWAN__h2title" id="ongoingAuction">
						진행경매 <a class="wrap-right" href="/auction/onauction"> <span
							class="title-total">전체 작품보기</span> <svg width="18" height="18"
								viewBox="0 0 18 18" fill="none"
								xmlns="http://www.w3.org/2000/svg">
	   							<path d="M13 9L4 9" stroke="#111111"
									style="transition: all 0.1s ease 0s;"></path>
	   							<path d="M7 14.25L13 9L7 3.75" stroke="#111111"
									style="transition: all 0.1s ease 0s;"></path>
	   						</svg>
						</a>
					</h2>
				</div>

				<div class="row HWAN__ContentSectionRow">
					<div class="col-sm-7 col-md-3">

						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test10.jpg" alt="..." id="index__img">
							</div>
							<a class="info-img" href="/auction/onauction">
								<div class="info-img_content">
									<h4>"Don't Go" Series - Things to Keep - #.1.</h4>
									<div class="price">
										<h5>시작가</h5>
										<p>KRW 8,000,000 ~15,000,000</p>
									</div>
									<div class="price" style="color:#f00">
										<h5>현재가</h5>
										<p>KRW 8,000,000 ~15,000,000</p>
									</div>
								</div>
							</a>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">박소담</div>
							<div class="HWAN__close-date glyphicon glyphicon-time">
	      					  D-3일 21:18:28</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test4.jpg" alt="..." id="index__img">
							</div>
							<a class="info-img" href="/">
								<div class="info-img_content">
									<h4>"Don't Go" Series - Things to Keep - #.1.</h4>
									<div class="info-detail">
										<p class="texture">oil on canvas</p>
										<p class="size">100×80cm (40)</p>
									</div>
									<div class="price">
										<h5>추정가</h5>
										<p>KRW 8,000,000 ~15,000,000</p>
									</div>
								</div>
							</a>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">김선우</div>
							<div class="HWAN__close-date glyphicon glyphicon-time">
	      					  D-3일 21:18:28</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test1.jpg" alt="..." id="index__img">
							</div>
							<a class="info-img" href="/">
								<div class="info-img_content">
									<h4>"Don't Go" Series - Things to Keep - #.1.</h4>
									<div class="info-detail">
										<p class="texture">oil on canvas</p>
										<p class="size">100×80cm (40)</p>
									</div>
									<div class="price">
										<h5>추정가</h5>
										<p>KRW 8,000,000 ~15,000,000</p>
									</div>
								</div>
							</a>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">이우한</div>
							<div class="HWAN__close-date glyphicon glyphicon-time">
	      					  D-3일 21:18:28</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test5.jpg" alt="..." id="index__img">
							</div>
							<a class="info-img" href="/">
								<div class="info-img_content">
									<h4>"Don't Go" Series - Things to Keep - #.1.</h4>
									<div class="info-detail">
										<p class="texture">시작가</p>
										<p class="size">1,000,000</p>
									</div>
									<div class="price">
										<h5>현재가</h5>
										<p>KRW 8,000,000 ~15,000,000</p>
									</div>
								</div>
							</a>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">전지현</div>
							<div class="HWAN__close-date glyphicon glyphicon-time">
	      					  D-3일 21:18:28</div>
						</div>
					</div>

				</div>
				<!-- 진행경매 -->

				<div class="HWAN__home-title-section ">
					<h2 class="HWAN__h2title" id="scheduleAuction">
						상시경매 <a class="wrap-right" href="/auction/ScheduleAuction"> <span
							class="title-total">전체 작품보기</span> <svg width="18" height="18"
								viewBox="0 0 18 18" fill="none"
								xmlns="http://www.w3.org/2000/svg">
	   							<path d="M13 9L4 9" stroke="#111111"
									style="transition: all 0.1s ease 0s;"></path>
	   							<path d="M7 14.25L13 9L7 3.75" stroke="#111111"
									style="transition: all 0.1s ease 0s;"></path>
	   						</svg>
						</a>
					</h2>
				</div>

				<div class="row HWAN__ContentSectionRow">
					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test3.jpg" alt="..." id="index__img">
							</div>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">박소담</div>
							<div class="HWAN__close-date">3일 21:18:28</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test2.jpg" alt="..." id="index__img">
							</div>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">김선우</div>
							<div class="HWAN__close-date">4일 01:18:28</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test10.jpg" alt="..." id="index__img">
							</div>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">이우한</div>
							<div class="HWAN__close-date">2일 10:24:28</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test11.jpg" alt="..." id="index__img">
							</div>
						</div>
						<div class="HWAN__caption">
							<div class="HWAN__productTiltle">전지현</div>
							<div class="HWAN__close-date">2일 10:24:28</div>
						</div>
					</div>

				</div>
				<!-- //예정경매 -->

				<div class="HWAN__home-title-section ">
					<h2 class="HWAN__h2title" id="ResultAuction">
						경매결과 <a class="wrap-right" href="/auction/ResultAuction"> <span
							class="title-total">전체 작품보기</span> <svg width="18" height="18"
								viewBox="0 0 18 18" fill="none"
								xmlns="http://www.w3.org/2000/svg">
	   							<path d="M13 9L4 9" stroke="#111111"
									style="transition: all 0.1s ease 0s;"></path>
	   							<path d="M7 14.25L13 9L7 3.75" stroke="#111111"
									style="transition: all 0.1s ease 0s;"></path>
	   						</svg>
						</a>
					</h2>
				</div>

				<div class="row HWAN__ContentSectionRow">
					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test1.jpg" alt="..." id="index__img">
							</div>
							<div class="HWAN__caption">
								<div class="HWAN__productTiltle">박소담</div>
								<div class="HWAN__close-date">3일 21:18:28</div>
							</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test2.jpg" alt="..." id="index__img">
							</div>
							<div class="HWAN__caption">
								<div class="HWAN__productTiltle">김선우</div>
								<div class="HWAN__close-date">4일 01:18:28</div>
							</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test4.jpg" alt="..." id="index__img">
							</div>
							<div class="HWAN__caption">
								<div class="HWAN__productTiltle">이우한</div>
								<div class="HWAN__close-date">2일 10:24:28</div>
							</div>
						</div>
					</div>

					<div class="col-sm-7 col-md-3">
						<div class="HWAN__thumbnail">
							<div class="img-tab">
								<img src="/resources/images/test3.jpg" alt="..." id="index__img">
							</div>
							<div class="HWAN__caption">
								<div class="HWAN__productTiltle">전지현</div>
								<div class="HWAN__close-date">2일 10:24:28</div>
							</div>
						</div>
					</div>

				</div>
				<!-- //경매결과 -->
			</div>
			<!-- //오른쪽 content 영역 -->

			<!-- 왼쪽 사이드바 -->
			<div class="col-lg-2 HWAN__sideBar">
				<h2 class="HWAN__h2title">Category</h2>

				<div class="HWAN__panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel HWAN__panel-default">
						<div class="HWAN__panel-heading" role="tab" id="headingOne">
							<a type="button" class="__category-on" title="선택됨"
								href="#ongoingAuction">
								<p>진행경매</p>
							</a>
						</div>
					</div>
					<div class="panel HWAN__panel-default">
						<div class="HWAN__panel-heading" role="tab" id="headingTwo">
							<a type="button" class="__category-on" href="#scheduleAuction">
								<p>상시경매</p>
							</a>
						</div>
					</div>
					<div class="panel HWAN__panel-default">
						<div class="HWAN__panel-heading" role="tab" id="headingThree">
							<a type="button" class="__category-on" href="#ResultAuction">
								<p>경매결과</p>
							</a>
						</div>
					</div>
				</div>

			</div>
			<!-- //왼쪽 사이드바 -->

		</div>
		<!-- //row -->



	</div>
	<!-- //content  -->
</div>
		<div class="scroll_top-box">
		
			<div class="chat">
				<a href="http://localhost:8090/Anonymous/index.jsp" onclick="window.open(this.href, '_blank', 'width=620, height=535 location=no'); return false;" class="btn btn-primary" >1:1 상담</a>
			</div>
					
			<div class="box-inner">
				<a href="#" class="btn-scroll_top js-scroll_top show"><i
					class="icon-scroll_top"></i></a>
			</div>
		</div>


<%@ include file="footer.jsp"%>
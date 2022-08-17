<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<link href="/resources/dist/Smartshop - Multipurpose eCommerce Template + Admin/smartshop/css/plugins/xzoom.css" rel="stylesheet">
<link href="/resources/dist/Smartshop - Multipurpose eCommerce Template + Admin/smartshop/css/plugins/magnific-popup.css" rel="stylesheet">
<!-- PAGE TITLE
        ================================================== -->
<style>
.img{
   width:500px;
 height:500px; 
   object-fit : cover;  
}
</style> 
<section class="page-title-section bg-img cover-background"
	data-background="/resources/bootstrap/img/bg/page-title.png">
	<div class="container">
	<c:set var="pvo" value="${pdto.pvo }" />
<span class="input-group-text" id="ses" style="display: none">${ses.mno }</span>
<span class="input-group-text" id="pvoWriter" style="display: none">${pvo.writer }</span>
		<div class="title-info text-center">
			<h1>Item Detail</h1>
		</div>
		<div class="breadcrumbs-info text-center">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a id="list"
					href="/product/list?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&kw=${pgvo.kw}&orderBy=${pgvo.orderBy}">List</a></li>
				<li><a href="#">Item Detail</a></li>
			</ul>
		</div>

	</div>
</section>
<!-- PRODUCT DETAILS
        ================================================== -->
<section class="md">
	<div class="container">

		<!-- product section -->
		<div class="row mb-6 mb-md-7 mb-lg-9">
			<div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">

				<!-- product left start -->
				<div class="xzoom-container">
					<img class="img mb-1-9 mx-auto border rounded" id="xzoom-magnific"
						src="/upload/${fn:replace(pdto.imageList[0].saveDir,'\\','/')}/${pdto.imageList[0].uuid }_${pdto.imageList[0].imageName }"
						alt="..." />
					<div class="xzoom-thumbs no-margin">
						<c:forEach items="${pdto.imageList }" var="ivo">
							<img class="xzoom-gallery5" style="width: 60px; height: 60px; "
								src="/upload/${fn:replace(ivo.saveDir,'\\','/')}/${ivo.uuid }_${ivo.imageName }">
						</c:forEach>
					</div>
				</div>
				<!-- product left end -->
			</div>
			
			<div class="col-lg-7 ps-lg-2-3">

				<div class="product-detail">
					<div class="display-25 mb-2">${pvo.category }</div>
					<h2 class="mb-4">${pvo.pname }</h2>
					<p class="rating-text d-none">
						<span>SKU:</span> <span class="font-500 theme-color" id="pnoVal">${pvo.pno }</span>
					</p>

					<div class="dropdown mb-5">
						<a class="dropdown-toggle"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false"><img src="/resources/bootstrap/img/avatar/user-dropdown.jpg" alt="..." class="rounded-circle"><span class="d-inline-block mt-1 ms-1 display-28">${pdto.nickName }</span></a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="#">회원정보보기</a></li>
							<li><a class="dropdown-item" href="/chat/list?mno=${pvo.writer }">채팅하기</a></li>
							<li><a class="dropdown-item" href="/report/register?mno=${pvo.writer }">신고하기</a></li>
						</ul>
					</div>
					

					<div class="mb-4">
						<div class="mb-2">
							<span class="me-5 display-28">시작가</span>
							<span class="display-23 font-weight-700" id="reservePriceVal"><fmt:formatNumber value="${pvo.reservePrice }" pattern="#,###" /></span>원
						</div>
						<div>
							<span class="me-5 display-28">현재가</span>
							<span class="display-23 font-weight-700 text-primary" id="maxPrice"><fmt:formatNumber value="${pdto.maxPrice }" pattern="#,###" /></span>원
						</div>
					</div>
					
					<ul id="timeBoard"
						class="countdown count-style-one text-start m-0 p-0">
						<!-- start days -->
						<li><span id="days">00</span>
							<p class="timeRefDays text-center">days</p></li>
						<!-- end days -->
						<!-- start hours -->
						<li><span id="hours">00</span>
							<p class="timeRefHours">hours</p></li>
						<!-- end hours -->
						<!-- start minutes -->
						<li><span id="minutes">00</span>
							<p class="timeRefMinutes">minutes</p></li>
						<!-- end minutes -->
						<!-- start seconds -->
						<li><span id="seconds">00</span>
							<p class="timeRefSeconds">seconds</p></li>
						<!-- end seconds -->
					</ul>

					<div class="row">
						<div class="col-5 col-md-4">
							<label>시작시간:</label>
							<div class="mb-4 ">
								<span>${pvo.regAt }</span>
							</div>

						</div>
						<div class="col-5 col-md-4">
							<label>종료시간:</label>
							<div class="mb-4 ">
								<span id="endTime">${pvo.endTime }</span>
							</div>
						</div>
						<div class="row">
							<div class="col-4 col-lg-2">
								<label>Qty:</label> <span> ${pvo.readCount }</span>
							</div>

						</div>
						<div class="row mb-4">
							<div class="col-lg-12">

								<c:choose>
									<c:when
										test="${pvo.status == 0 && ses.mno ne pvo.writer && ses ne null}">
										
											
										<button type="button" id="bidModal"
											class="butn-style2 me-3 mb-2 mb-md-0" data-bs-toggle="modal"
											data-bs-target="#centered">입찰하기</button>
										<c:if test="${itck eq 0}">
										<button type="button" id="itSbmBtn"
											class="butn-style2 me-3 mb-2 mb-md-0" ><i class="far fa-heart"></i></button>
											<!-- <i class="far fa-heart" id="itSbmBtn" style="cursor:pointer;"></i> -->
											<span id="readCk" style="display: none;">true</span>
											<span id="mnoVal" style="display: none;">${ses.mno }</span>
											<span id="pnoVal" style="display: none;">${pvo.pno }</span>
										</c:if>
										<c:if test="${itck eq 1}">
										<button type="button" id="itDelBtn"
											class="butn-style2 me-3 mb-2 mb-md-0" ><i class="fas fa-heart"></i></button>
											<span id="readCk" style="display: none;">true</span>
											<span id="mnoVal" style="display: none;">${ses.mno }</span>
											<span id="pnoVal" style="display: none;">${pvo.pno }</span>
											</c:if>
									</c:when>
									<c:when test="${ses eq null }">
										<a href="/member/login"
											class="butn-style2 me-3 mb-2 mb-md-0 mt-2">로그인 후 이용해주세요</a>
									</c:when>
								</c:choose>
								<!-- Vertically centered -->
								<div class="modal fade" id="centered" tabindex="-1"
									aria-labelledby="centeredLabel" aria-hidden="true">
									<div
										class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="centeredLabel">입찰하기</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form action="/buy_bid/add" method="post" id="bidAddForm">
													<div class="form-group">
														<input type="hidden" name="buyer" value="${ses.mno }">
														<input type="hidden" name="pno" value="${pvo.pno }">
														<input type="hidden" name="bidStatus" value="0"> <label>입찰
															금액 입력</label> <input type="number" class="form-control"
															name="bidPrice" placeholder="입찰 금액을 입력해주세요"
															id="bidPriceVal"
															>
													</div>
												</form>
												<div class="form-check">
													<input class="form-check-input is-checked" type="checkbox"
														value="" id="flexCheckDefault"> <label
														class="form-check-label is-checked" for="flexCheckDefault">
														입찰은 취소할 수 없습니다. 모든 약관에 동의합니다.</label>
													<p class="text-center text-danger" id="errorMsg"></p>
												</div>
											</div>
											<div class="modal-footer">

												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary" id="addBtn"
													disabled>입찰하기</button>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-lg-7">
								<c:if test="${ses.mno eq pvo.writer }">
									<a
										href="/product/modify?pno=${pvo.pno }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&kw=${pgvo.kw}&orderBy=${pgvo.orderBy}&mno=0"
										id="modBtn" class="butn-style2 me-3 mb-2 mb-md-0"
										style="display: none;">수정</a>
									<button class="butn-style2 me-3 mb-2 mb-md-0 modBtnFake" id="">수정</button>
									<button type="button" class="butn-style2 dark"
										data-bs-toggle="modal" data-bs-target="#staticBackdrop"
										id="Remove">삭제</button>
									<form action="" method="post" id="productRmForm"
										style="display: none;">
										<input type="hidden" id="pno" value="" name="pno"> <input
											type="hidden" value="${pgvo.pageNo }" name="pageNo">
										<input type="hidden" value="${pgvo.qty }" name="qty">
										<input type="hidden" value="${pgvo.type }" name="type">
										<input type="hidden" value="${pgvo.kw }" name="kw">
										<input type="hidden" value="${pgvo.orderBy }" name="orderBy">
									</form>
								</c:if>
								<!-- static Modal -->
								<div class="modal fade" id="staticBackdrop"
									data-bs-backdrop="static" data-bs-keyboard="false"
									tabindex="-1" aria-labelledby="staticBackdropLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">삭제요청</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">정말 삭제하시겠습니까?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													id="productRemove">예</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">아니요</button>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- end product section -->
			
			<!-- Img Modal-->
<button type="button" id="imgModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="display: none;">
    Open modal
  </button>
<div class="modal" id="myModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Img Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <img class="mb-1-9 mx-auto" id="modalImg" src="" alt="..." style="border: 0;"/>
      
    </div>
  </div>
</div>
			<!-- product description -->
			<div class="row justify-content-center mb-6 mb-md-7">

				<div class="col-12">
					<div class="horizontaltab tab-style-two">
						<ul class="resp-tabs-list hor_1 text-start">
							<li><i class="ti-line-dashed d-md-block d-none"></i>Description</li>
							<li ><i class="ti-more d-md-block d-none" ></i>QnA<span id="qnaQty"></span></li>
							<li><i class="ti-star d-md-block d-none"></i>Reviews (2)</li>
						</ul>
						<div class="resp-tabs-container hor_1">
							<div>

								<p>${pvo.description }</p>

							</div>
							<div>
								<div class="row">
									<div class="col-lg-12 mb-1-9 mb-lg-0">

									
									<!-- form -->
							<div class="col-lg-12 mb-1-9 mb-lg-0">
                            <div class="common-block ">
                            <div class="inner-title">
                                <h4 class="mb-0">QnA</h4>
                            </div>
								<!-- <!— comment —> -->
								 <form class="mb-5">
								  <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="writer"  value=${ses.mno } id="questionWriter">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 mb-2">
                                        <label>상품 문의하기</label>
                                        <div class="form-group mb-1">
                                            <textarea rows="2" class="form-control" name="content" placeholder="문의 내용을 입력하세요." id="questionText" style="resize: none;"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="butn-style2" id="questionSbmBtn" style="float: right;">완료</button>
                            </form>
								<div class="comments-area mb-3" id="qnaZone"></div>
								
								<div class="text-center" style="visibility: hidden;"> 
									<button type="button" data-page="1" id="moreBtn" class="btn btn-light">MORE +</button>
								</div>
								
								</div>
								<!-- <!— end comment—> -->
								
                            
                        </div>

                            <!-- !- end form -> -->
									</div>
								</div>

							</div>
							<div>
								<div class="row">

									<div class="col-lg-6 order-lg-2 mb-1-9 mb-lg-0">
										<div class="common-block">

											<div class="mb-2-3 pb-2-3 border-bottom">

												<div class="media mb-4 product-review">
													<img class="me-3 rounded-circle w-60px"
														src="img/avatar/t-1.jpg" alt="...">
													<div class="media-body">
														<a href="#"
															class="mb-1 font-weight-600 text-extra-dark-gray">Jonal
															Doe</a> <span class="d-block text-primary">Sep 15,
															2018</span>
													</div>

													<span class="text-primary"> <i class="fas fa-star"></i>
														<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
													</span>

												</div>

												<p class="mb-0">Consectetur adipisicing elit, sed do
													eiusmod tempor incididunt ut labore et dolore magna aliqua.
													Ut enim ad minim veniam, quis nostrud exercitation ullamco
													laboris nisi ut aliquip.</p>

											</div>

											<div class="pb-4">

												<div class="media mb-4 product-review">
													<img class="me-3 rounded-circle w-60px"
														src="img/avatar/t-2.jpg" alt="...">
													<div class="media-body">
														<a href="#"
															class="mb-1 font-weight-600 text-extra-dark-gray">Marina
															Modra</a> <span class="d-block text-primary">Sep 15,
															2018</span>
													</div>

													<span class="text-primary"> <i class="fas fa-star"></i>
														<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
													</span>

												</div>

												<p class="mb-0">Excepteur sint occaecat cupidatat non
													proident, sunt in culpa qui officia deserunt mollit anim id
													est laborum. Sed ut perspiciatis unde omnis iste natus
													error sit voluptatem.</p>

											</div>

											<div class="text-start">
												<a href="#" class="butn-style2 small">Load More Reviews</a>
											</div>
										</div>
									</div>

									<div class="col-lg-6 order-lg-1">

										<div class="common-block">

											<div class="inner-title">
												<h4 class="mb-0">Leave Review</h4>
												<p class="mb-0">Leave review takes it to the next level.</p>
											</div>

											<form>

												<div class="row">

													<div class="col-sm-6">

														<div class="form-group">
															 <input type="text"
																class="form-control" name="writer" 
																value="${ses.mno }">
														</div>

													</div>
													<div class="col-sm-6">
													</div>

												</div>

												<div class="row">

													<div class="col-sm-12 mb-2">

														<div class="form-group">
															<label>Rating</label> <select
																class="form-control form-select">
																<option>5 Stars</option>
																<option>4 Stars</option>
																<option>3 Stars</option>
																<option>2 Stars</option>
																<option>1 Star</option>
															</select>
														</div>

													</div>

												</div>

												<div class="row">

													<div class="col-12 mb-4">

														<label>Comment</label>
														<div class="form-group mb-1">
															<textarea rows="2" class="form-control"
																placeholder="Tell us a few words"></textarea>
														</div>

													</div>

												</div>

												<button type="button" class="butn-style2">Submit
													Review</button>

											</form>

										</div>

									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="/resources/js/product.detail.js"></script>
<script src="/resources/js/product.qna.js"></script>
<script src="/resources/js/interest.register.js"></script>
<!-- <script src="/resources/js/buy_bid.add.js"></script> -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		let maxPrice = document.getElementById('maxPrice').innerText;
		let modBtn = document.getElementById('modBtnFake')
		let productRemove = document.getElementById('Remove')

		if (parseInt(maxPrice) > 0) {
			if (modBtn != null) {
				modBtn.disabled = true;
				productRemove.disabled = true;
			}
		}
	getQuestionList(document.getElementById('pnoVal').innerText);
	});
</script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/dist/Smartshop - Multipurpose eCommerce Template + Admin/smartshop/js/xzoom.js"></script>
<script src="/resources/dist/Smartshop - Multipurpose eCommerce Template + Admin/smartshop/js/jquery.magnific-popup.min.js"></script>
<jsp:include page="../common/footer.jsp" />

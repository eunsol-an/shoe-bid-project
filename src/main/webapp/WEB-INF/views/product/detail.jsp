<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- PAGE TITLE
        ================================================== -->
<section class="page-title-section bg-img cover-background" data-background="/resources/bootstrap/img/bg/page-title.png">
	<div class="container">
		<c:set var="pvo" value="${pdto.pvo }" />
		<span class="input-group-text" id="ses" style="display: none">${ses.mno }</span> <span class="input-group-text" id="pvoWriter" style="display: none">${pvo.writer }</span>
		<div class="title-info text-center">
			<h1>Item Details</h1>
		</div>
		<div class="breadcrumbs-info text-center">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a id="list" href="/product/list?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&kw=${pgvo.kw}&orderBy=${pgvo.orderBy}">List</a></li>
				<li><a href="#">Item Details</a></li>
			</ul>
		</div>

	</div>
</section>
<!-- PRODUCT DETAILS
        ================================================== -->
<section class="md">
	<div class="container col-lg-9">

		<!-- product section -->
		<div class="row mb-6 mb-md-7 mb-lg-9">
			<div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">

				<!-- product left start -->
				<div class="xzoom-container">
					<img class="img_detail mb-1-9 mx-auto border rounded" id="xzoom-magnific" src="/upload/${fn:replace(pdto.imageList[0].saveDir,'\\','/')}/${pdto.imageList[0].uuid }_${pdto.imageList[0].imageName }" alt="..." />
					<div class="xzoom-thumbs no-margin">
						<c:forEach items="${pdto.imageList }" var="ivo">
							<img class="xzoom-gallery5" style="width: 60px; height: 60px;" src="/upload/${fn:replace(ivo.saveDir,'\\','/')}/${ivo.uuid }_${ivo.imageName }">
						</c:forEach>
					</div>
				</div>
				<!-- product left end -->
			</div>

			<div class="col-lg-7 ps-lg-2-3">

				<div class="product-detail">
					<div class="col-sm-14 mb-3 ms-3">

						<div style="float: right;">
							<i class="eyei fa-solid fa-eye fa-lg"></i> <span> ${pvo.readCount }</span>&nbsp;
							<c:if test="${ses eq null}">
							<span><i class="far fa-heart fa-lg" style="color: red;"></i></span>
							${pdto.itQty }
							</c:if> 
							<c:choose>
								<c:when test="${pvo.status == 0 && ses ne null}">
									<c:if test="${itck eq 0}">
										<button type="button" id="itSbmBtn" class="itbutn">
											<i class="far fa-heart fa-lg" style="color: red;"></i>
										</button>
										${pdto.itQty }
										<span id="readCk" style="display: none;">true</span>
										<span id="mnoVal" style="display: none;">${ses.mno }</span>
										<span id="pnoVal" style="display: none;">${pvo.pno }</span>
									</c:if>
									<c:if test="${itck eq 1}">

										<button type="button" id="itDelBtn" class="itbutnon">
											<i class="fas fa-heart fa-lg" style="color: red; border: 6px; border-color: red;"></i>
										</button>
										${pdto.itQty }
										<span id="readCk" style="display: none;">true</span>
										<span id="mnoVal" style="display: none;">${ses.mno }</span>
										<span id="pnoVal" style="display: none;">${pvo.pno }</span>
									</c:if>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="ca mb-2">${pvo.category }</div>
					<h3 class="mb-4">${pvo.pname }</h3>
					<p class="rating-text d-none">
						<span>SKU:</span> <span class="font-500 theme-color" id="pnoVal">${pvo.pno }</span>
					</p>

					<div class="dropdown mb-5">
						<a class="dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"><img src="/upload/${fn:replace(pdto.mvo.memberImg,'\\','/')}" alt="..." class="rounded-circle"><span class="d-inline-block mt-1 ms-1 display-28">${pdto.mvo.nickName }</span></a>
						<c:if test="${ses.mno ne null }">
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item" href="/chat/list?mno=${pvo.writer }">채팅하기</a></li>
								<li><a class="dropdown-item" href="/report/register?mno=${pvo.writer }">신고하기</a></li>
							</ul>
						</c:if>
					</div>

					<ul id="timeBoard" class="countdown count-style-one text-start m-0 p-0 text-center">
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

					<div class="mt-3">
						<span class="msg-13">


							<div class="row">
								<div class="col">
									<!-- <label>시작시간:</label> -->
									<div class="mb-4 ca text-center">
										<i class="far fa-clock"> 등록일 </i> <span class="msg-13">${pvo.regAt }</span>
									</div>
								</div>

								<div class="col">
									<!-- <label>종료시간:</label> -->
									<div class="mb-4 ca text-center">
										<i class="far fa-clock"> 마감일 </i> <span class="msg-13" id="endTime">${pvo.endTime }</span>
									</div>
								</div>
							</div>

						</span>
					</div>



					<div class="row col-sm-12 mt-4 mx-auto">
						<div class="col me-2 py-2 text-center" style="background-color: #adb5bd; border-radius: 5px;">
							<span class="me-5 display-30 text-white">시작가</span> <span class="display-23 font-weight-700 text-white" id="reservePriceVal"><fmt:formatNumber value="${pvo.reservePrice }" pattern="#,###" /></span><span class="display-30 text-white"> 원</span>
						</div>
						<div class="col ms-2 py-2 text-center" style="background-color: #03a9f5; border-radius: 5px;">
							<span class="me-5 display-30 text-white">현재가</span> <span class="display-23 font-weight-700 text-white" id="maxPrice"><fmt:formatNumber value="${pdto.maxPrice }" pattern="#,###" /></span><span class="display-30 text-white"> 원</span>
						</div>
					</div>



					<div class="col-lg-12">

						<c:choose>
							<c:when test="${pvo.status == 0 && ses.mno ne pvo.writer && ses ne null}">


								<button type="button" id="bidModal" class="btn btn-dark col-12 me-3 mb-md-0 py-3 mt-3" data-bs-toggle="modal" data-bs-target="#centered">입찰하기</button>

							</c:when>
							<c:when test="${ses eq null }">
								<a href="/member/login" class="btn btn-dark col-12 me-3 mb-md-0 py-3 mt-3">로그인 후 이용해주세요</a>
							</c:when>
						</c:choose>


						<div class="col-log-12 mt-3">
							<div class="msg-13">슈비드(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다.</div>
						</div>










						<!-- Vertically centered -->
						<div class="modal fade" id="centered" tabindex="-1" aria-labelledby="centeredLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header border-0">
										<h5 class="modal-title" id="centeredLabel">입찰하기</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="/buy_bid/add" method="post" id="bidAddForm">
											<div class="form-group">
												<input type="hidden" name="buyer" value="${ses.mno }"> <input type="hidden" name="pno" value="${pvo.pno }"> <input type="hidden" name="bidStatus" value="0"> <label class="font-12">입찰 금액 입력</label> <input type="number" class="form-control" name="bidPrice" placeholder="입찰 금액을 입력해주세요" id="bidPriceVal">
											</div>
										</form>
										<div class="form-check">
											<input class="form-check-input is-checked" type="checkbox" value="" id="flexCheckDefault"> <label class="form-check-label is-checked msg-13" for="flexCheckDefault"> 입찰은 취소할 수 없습니다. 신중하게 결정해주세요.</label>
											<p class="text-center text-danger" id="errorMsg"></p>
										</div>
									</div>
									<div class="modal-footer border-0">


										<button type="button" class="btn btn-sm btn-dark" id="addBtn" disabled>입찰하기</button>
										<button type="button" class="btn btn-sm btn-dark" data-bs-dismiss="modal">닫기</button>
									</div>

								</div>

							</div>
						</div>
					</div>



					<div>
						<div class="d-flex justify-content-end">

							<c:if test="${ses.mno eq pvo.writer }">
								<a href="/product/modify?pno=${pvo.pno }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&kw=${pgvo.kw}&orderBy=${pgvo.orderBy}&mno=${ses.mno }" id="modBtn" class="btn btn-sm btn-dark me-3 mb-2 mb-md-0 py-3" style="display: none;">수정</a>

								<p id="inputText" class="mgs-caution mt-3"></p>

								<button class="btn btn-sm bg-white mb-md-0 modBtnFake" id="modBtnFake">수정</button>
								<button type="button" class="btn btn-sm bg-white mb-md-0" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="Remove">삭제</button>

								<form action="" method="post" id="productRmForm" style="display: none;">
									<input type="hidden" id="pno" value="" name="pno"> <input type="hidden" value="${pgvo.pageNo }" name="pageNo"> <input type="hidden" value="${pgvo.qty }" name="qty"> <input type="hidden" value="${pgvo.type }" name="type"> <input type="hidden" value="${pgvo.kw }" name="kw"> <input type="hidden" value="${pgvo.orderBy }" name="orderBy">
								</form>

							</c:if>
							<!-- static Modal -->
							<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header border-0 ">
											<h5 class="modal-title" id="staticBackdropLabel">삭제요청</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">정말 삭제하시겠습니까?</div>
										<div class="modal-footer border-0">
											<button type="button" class="btn btn-sm btn-dark" id="productRemove">예</button>
											<button type="button" class="btn btn-sm btn-dark" data-bs-dismiss="modal">아니요</button>
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
		<button type="button" id="imgModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="display: none;">Open modal</button>
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">

					<!-- Img Modal Header -->
					<div class="modal-header border-0">
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<img class="mb-1-9 mx-auto" id="modalImg" src="" alt="..." />

				</div>
			</div>
		</div>
		<!-- product description -->
		<div class="row justify-content-center mb-6 mb-md-7 mt-7">

			<div class="col-lg-12">
				<div class="horizontaltab tab-style-two">
					<ul class="resp-tabs-list hor_1 text-start">
						<li><i class="fas fa-info-circle d-md-block d-none"></i>상품설명</li>
						<li><i class="fas fa-question-circle d-md-block d-none"></i>질문/답변<span id="qnaQty"></span></li>
						<li><i class="fas fa-star d-md-block d-none"></i>판매자후기<span id="reviewQty"></span></li>
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
										<div class="common-block border-0">
											<div class="mb-5">
												<h4 class="mb-0">질문/답변</h4>
											</div>
											<!-- <!— comment —> -->
											<form class="mb-5">
												<div class="row">
													<div class="col-sm-12">
														<div class="form-group">
															<input type="hidden" class="form-control" name="writer" value=${ses.mno } id="questionWriter">
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
												<button type="button" class="btn btn-dark" id="questionSbmBtn" style="float: right;">완료</button>
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

						<!-- Strat Review -->
						<div>
							<div class="row">

								<div class="col-lg-12 mb-1-9 mb-lg-0">

									<div class="common-block border-0">

										<div class="mb-5">
											<h4 class="mb-0">후기 내역</h4>
										</div>

										<div class="table-responsive mt-5">
											<table class="table v-align-middle text-center" id="reviewTable">
												<thead>

												</thead>
												<tbody id="reviewZone">

												</tbody>
											</table>
											<div id="reviewEmpty" style="display: none;">
												<p class="text-center">후기가 없습니다.</p>
											</div>
											<div class="text-center" id="moreBtnZone"></div>
										</div>
										<div class="pagination text-small text-uppercase text-extra-dark-gray">
											<ul>

											</ul>
										</div>
									</div>
								</div>

							</div>

						</div>
						<!-- End Review -->

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<style>
.itbutn {
	background-color: white;
	border: 0px;
	margin-bottom: -10px
}

.itbutnon {
	background-color: white;
	border: 0px;
	margin-bottom: -10px
}
</style>
<script src="/resources/js/product.detail.js"></script>
<script src="/resources/js/product.qna.js"></script>
<script src="/resources/js/interest.register.js"></script>
<script src="/resources/js/review.list.js"></script>
<!-- <script src="/resources/js/buy_bid.add.js"></script> -->
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						let maxPrice = stringNumberToInt(document
								.getElementById('maxPrice').innerText);
						let modBtn = document.getElementById('modBtnFake')
						let productRemove = document.getElementById('Remove')
						if (parseInt(maxPrice) > 0) {
							if (modBtn != null) {
								modBtn.remove();
								document.getElementById('inputText').innerText = "입찰된 상품은 수정 및 삭제가 불가합니다.";
								productRemove.remove();
							}
						}
						getQuestionList(document.getElementById('pnoVal').innerText);
					});
</script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<jsp:include page="../common/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- PAGE TITLE
        ================================================== -->
<section class="page-title-section bg-img cover-background"
	data-background="img/bg/page-title.jpg">
	<div class="container">
		<c:set var="mvo" value="${mdto.mvo }" />
		<div class="title-info">
			<h1>My Profile</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a href="/member/mypage?mno=${mvo.mno }">My Profile</a></li>
			</ul>
		</div>

	</div>
</section>

<!-- ACCOUNT ORDERS
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<!-- left panel -->
			<div class="col-lg-4 col-sm-9 mb-2-3 mb-lg-0">

				<div class="account-pannel">

					<div class="p-4">

						<div class="text-center">
							<div class="pb-3">
								<c:forEach items="${mdto.imageList }" var="ivo">
									<img class="img-fluid rounded-circle img-thumbnail"
										src="/upload/${fn:replace(mdto.imageList[0].saveDir,'\\','/')}/${mdto.imageList[0].uuid }_${mdto.imageList[0].imageName }"
										alt="...">
								</c:forEach>
							</div>
							<h6 class="mb-0 display-28">${mvo.nickName }</h6>
							<small>가입일 ${mvo.regAt }</small>
						</div>
					</div>

					<div class="list-group">
						<a class="list-group-items" href="/buy_bid/list/${ses.mno }">
							<i class="ti-bag pe-2"></i>입찰내역</a>
						<a class="list-group-items active" href="/member/mypage?mno=${ses.mno }">
							<i class="ti-user pe-2"></i>내정보</a>
						<a class="list-group-items" href="account-wishlist.html">
							<i class="ti-heart pe-2"></i>찜목록</a> 
						<a class="list-group-items" href="/chat/list?mno=${ses.mno }">
							<i class="ti-tag pe-2"></i>쪽지함</a>
						<a class="list-group-items" href="account-tickets.html">
							<i class="ti-tag pe-2"></i>신고내용
							<span class="badge badge-pill">4</span></a>
					</div>

				</div>

			</div>
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-8">

				<div class="common-block">

					<div class="inner-title">
						<h4 class="mb-0">내정보</h4>
						<p class="mb-0">Time for a Sharp My profile.</p>
					</div>


					<div class="row">

						<div class="col-sm-6">
							<input type="hidden" value="${mvo.mno }" id="mnoVal">
							<div class="form-group">
								<label>아이디</label> <input type="text" class="form-control"
									name="id" value="${mvo.id }" disabled="disabled">
							</div>

						</div>

						<div class="col-sm-6">

							<div class="form-group">
								<label>닉네임</label> <input type="text" class="form-control"
									name="nickName" value="${mvo.nickName }" disabled="disabled">
							</div>

						</div>

					</div>

					<div class="row">

						<div class="col-sm-6">

							<div class="form-group">
								<label>이메일</label> <input type="email" class="form-control"
									name="email" value="${mvo.email }" disabled="disabled">
							</div>

						</div>

						<div class="col-sm-6">

							<div class="form-group">
								<label>등급</label> <input type="text" class="form-control"
									name="grade" value="${mvo.grade }" disabled="disabled">
							</div>

						</div>

					</div>

					<!-- <div class="row">
						<div class="col-sm-12 mb-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="terms-condition"> <label class="form-check-label"
									for="terms-condition">I agree to the <a href="#"
									class="text-primary">Terms & Conditions</a></label>
							</div>
						</div>

					</div> -->
					<c:if test="${ses.mno ==mdto.mvo.mno || ses.grade == 99}">
						<button type="button" class="butn-style2 mt-4">
							<a href="/member/modify?mno=${mvo.mno }">회원정보 수정</a>
						</button>
						<button type="button" class="butn-style2 mt-4"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop"
							id="Remove">회원탈퇴</button>
						<form action="" id="memberRmForm" style="display: none;"
							method="post">
							<input type="hidden" id="membernum" value="" name="mno">
							<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
							<input type="hidden" value="${pgvo.qty }" name="qty">
						</form>
					</c:if>
					<!-- static Modal -->

					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">회원탈퇴</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">정말 탈퇴하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="memberRemove">예</button>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">아니요</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- end right panel -->
		</div>
	</div>
</section>
<script src="/resources/js/member.mypage.js"></script>

<jsp:include page="../common/footer.jsp" />
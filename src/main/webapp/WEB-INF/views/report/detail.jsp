<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<section class="page-title-section bg-img cover-background" data-background="img/bg/page-title.jpg">
	<div class="container">
		<div class="title-info">
			<h1>REPORT</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a href="/report/list">신고 리스트</a></li>
				<li><a href="#">신고 내용</a></li>
			</ul>
		</div>
	</div>
</section>

<div class="container mb-5 mt-5">
	<div class="row">
		<div class="col-lg-8 mx-auto">
			<div class="common-block">
				<div class="inner-title">
					<h2 class="mb-0 display-26 display-lg-24">신고 내용</h2>
				</div>
				<!-- order tracking form -->
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							No.<span id="rpnoVal">${rpvo.rpno }</span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<span>신고 회원 : ${rpvo.nickName } </span>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<span>신고대상 회원 : ${rpvo.targetNickName}</span>
							</div>
						</div>
					</div>
					<div class="col-12 mb-2">
						<div class="form-group">
							<span>신고 제목</span>
							<div class="form-group mb-1">
								<span>${rpvo.reportTitle}</span>
							</div>
						</div>
					</div>
					<div class="col-12 mb-2">
						<div class="form-group">
							<span>신고 내용</span>
							<div class="form-group mb-1">
								<span>${rpvo.reportContent}</span>
							</div>
						</div>
					</div>
					<div class="col-12 mb-2">
						<div class="form-group">
							<span>신고 시간</span>
							<div class="form-group mb-1">
								<span>${rpvo.regAt}</span>
							</div>
						</div>
					</div>
					<a class="butn-style2" id="reportRemove">삭제하기</a>
				</div>

				<!-- end order tracking form -->

			</div>
		</div>
				<form action="" id="reportRmForm" style="display: none;"
					method="post">
					<input type="hidden" id="rpno" value="" name="rpno">
				</form>
	</div>
</div>

<script src="/resources/js/report.detail.js"></script>

<jsp:include page="../common/footer.jsp" />
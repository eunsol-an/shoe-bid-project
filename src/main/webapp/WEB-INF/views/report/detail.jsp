<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />


<section>
	<div class="container">
	<div class="col-lg-8 mx-auto">
					<div class="inner-title">
						<h4 class="mb-0 font-weight-500 text-extra-dark-gray">신고내용</h4>
					</div>
<div class="container mb-5 mt-5">
	<div class="row">
		<div class="col-lg-11 mx-auto">
			<div class="common-block">
				<!-- order tracking form -->
				<div class="row">
					<div class="col-12 mb-2 inner-title">
							<div class="form-group mb-1">
								<p class="mb-1" style="font-weight:550; font-size:20px; color:black;">${rpvo.reportTitle}</p>
							</div>
							<div class="col-12">
								<span>신고 회원 : ${rpvo.nickName }&emsp; </span>
								<span>신고대상 회원 : ${rpvo.targetNickName} </span>
								<span style="float:right">${fn:substring(rpvo.regAt, 0, (fn:length(rpvo.regAt)-3)) }</span>
						</div>
					</div>
					
					<div class="row">
						
						<div class="col-sm-6">
							<div class="form-group" style="float:right">
								
								
							</div>
						</div>
					</div>
					<div class="col-12 mb-2">
						<div class="form-group">
							<div class="form-group mb-1">
								<span>${rpvo.reportContent}</span>
							</div>
						</div>
					</div>
					
					<c:if test="${ses.grade == 99}">
					<a class="butn-style2" id="reportRemove">삭제하기</a>
					</c:if>
				</div>
				<!-- end order tracking form -->

			</div>
				<a href="/report/list/${ses.mno }" style="float:right">신고내역 리스트보기</a>
		</div>
				<form action="" id="reportRmForm" style="display: none;"
					method="post">
					<input type="hidden" id="rpno" value="" name="rpno">
				</form>
	</div>
</div>
	</div>
</div>
</section>
<script src="/resources/js/report.detail.js"></script>

<jsp:include page="../common/footer.jsp" />
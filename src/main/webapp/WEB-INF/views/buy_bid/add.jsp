<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />


<button type="button" class="butn-style1 fill large"
	data-bs-toggle="modal" data-bs-target="#centered">입찰하기</button>
<!-- Vertically centered -->
<div class="modal fade" id="centered" tabindex="-1"
	aria-labelledby="centeredLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="centeredLabel">입찰하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>입찰 금액 입력</label> <input type="number" class="form-control"
						name="bidPrice" placeholder="입찰 금액을 입력해주세요" id="bidPriceVal">
				</div>
				<div class="form-check">
					<input class="form-check-input is-checked" type="checkbox" value=""
						id="flexCheckDefault"> <label class="form-check-label is-checked"
						for="flexCheckDefault"> 입찰은 취소할 수 없습니다. 모든 약관에 동의합니다. </label>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addBtn" disabled>입찰하기</button>
			</div>
			<form action="/buy_bid/add" method="post" style="display:none;" id="bidAddForm">
			<input type="hidden" name="buyer" value="1">
			<input type="hidden" name="pno" value="1">
			<input type="hidden" name="bidPrice" value="" id="bidPrice">
			<input type="hidden" name="bidStatus" value="0">
			</form>
		</div>
	</div>
</div>

<script src="/resources/js/buy_bid.add.js" ></script>
<jsp:include page="../common/footer.jsp" />
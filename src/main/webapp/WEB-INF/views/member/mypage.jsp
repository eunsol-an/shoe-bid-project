<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<c:set var="mvo" value="${mdto.mvo }" />

<!-- ACCOUNT ORDERS
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<!-- left panel -->
			<jsp:include page="../common/mypageMenu.jsp"/>
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-10">

				<div class="common-block border-0">

					<div class="inner-title">
						<h4 class="mb-0">내 정보</h4>
					</div>

					<div class="row">
					
					<div class="row col-lg-8 col-md-10 col-sm-12">
						<div class="col-5">
							<div class="text-center">
								<div class="pb-3">
									<c:forEach items="${mdto.imageList }" var="ivo">
										<img class="img-fluid rounded-circle img-thumbnail"
											src="/upload/${fn:replace(mdto.imageList[0].saveDir,'\\','/')}/${mdto.imageList[0].uuid }_${mdto.imageList[0].imageName }"
											alt="...">
									</c:forEach>
								</div>
								<%-- <h6 class="mb-0 display-28">${mvo.nickName }</h6>
								<small>가입일 ${mvo.regAt }</small> --%>
							</div>
						</div>
						<div class="col-7 p-3">
							<input type="hidden" value="${mvo.mno }" id="mnoVal">
							<h5>${mvo.nickName }<span>(${mvo.id })</span></h5>
							<small>${mvo.email }</small>
							<div class="my-3">
								<c:if test="${ses.mno == mdto.mvo.mno || ses.grade == 99}">
									<a href="/member/modify?mno=${mvo.mno }" class="btn butn-style2 small">회원정보 수정</a>
									<button type="button" class="butn-style2 small"
										data-bs-toggle="modal" data-bs-target="#staticBackdrop"
										id="Remove">회원탈퇴</button>
									<form action="" id="memberRmForm" style="display: none;"
										method="post">
										<input type="hidden" id="membernum" value="" name="mno">
										<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
										<input type="hidden" value="${pgvo.qty }" name="qty">
									</form>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-12 p-4 ms-auto text-center">
						<div>회원등급</div>
						<h3>
							<c:choose>
								<c:when test="${mvo.grade<= 20 }">
									맨발
								</c:when>
								<c:when test="${mvo.grade <= 40 }">
									양말
								</c:when>
								<c:when test="${mvo.grade <= 60 }">
									슬리퍼
								</c:when>
								<c:when test="${mvo.grade <= 80 }">
									운동화
								</c:when>
								<c:otherwise>
									날개달린 운동화
								</c:otherwise>
							</c:choose>
						</h3>
					</div>


						<!-- 여기서부터 수정 예정 -->
						<%-- <div class="col-sm-6">
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
					<div>
						<c:if test="${ses.mno == mdto.mvo.mno || ses.grade == 99}">
							<a href="/member/modify?mno=${mvo.mno }" class="btn butn-style2 small">회원정보 수정</a>
							<button type="button" class="butn-style2 small"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop"
								id="Remove">회원탈퇴</button>
							<form action="" id="memberRmForm" style="display: none;"
								method="post">
								<input type="hidden" id="membernum" value="" name="mno">
								<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
								<input type="hidden" value="${pgvo.qty }" name="qty">
							</form>
						</c:if>
					</div> --%>
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
			</div>
			<!-- end right panel -->
		</div>
	</div>
</section>
<script>
let modify = '<c:out value="${modify}"/>';

if (parseInt(modify)){
	alert("회원정보가 수정되었습니다");
}
</script>
<script src="/resources/js/member.mypage.js"></script>

<jsp:include page="../common/footer.jsp" />
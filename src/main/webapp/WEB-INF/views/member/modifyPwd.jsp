<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- PASSWORD RECOVERY
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<div class="col-lg-4 mx-auto">

				<div class="common-block border-0">

					<div class="mb-5">
						<h4 class="mb-0 text-center">비밀번호 변경</h4>
					</div>

					<form method="post" action="/member/modifyPwd">

						<div class="row">

							<div class="col-sm-12">
								<div class="height-100">
									<div class="form-group">
										<label class="font-12">아이디</label> <input type="text" class="form-control input-style" name="id" placeholder="아이디을 입력해주세요" id="id" value="${mvo.id }" readonly="readonly">
									</div>
								</div>




								<div class="height-100">
									<div class="form-group">
										<label class="font-12">이메일</label> <input type="email" class="form-control input-style" name="email" placeholder="이메일을 입력해주세요" id="email" value="${mvo.email }" readonly="readonly">
									</div>

								</div>

								<div class="height-100">
									<div class="form-group">
										<label class="font-12">비밀번호</label> 
										<input type="password" class="form-control input-style" name="pwd" placeholder="비밀번호를 입력해주세요" id="pwd" required="required">

									<div class="check_font mgs-caution" id="pwdCheck"></div>
									</div>
								</div>

							</div>
						</div>


						<div class="height-120">
							<div class="form-group">
								<label class="font-12">비밀번호 확인</label> 
								<input type="password" class="form-control input-style" name="repwd" placeholder="비밀번호를 다시 입력해주세요" id="repwd" required="required">

							<div class="check_font mgs-caution" id="repwdCheck"></div>
							</div>
						</div>




						<!-- <div id="emailCheck"></div> -->

						<!-- <div class="row">
							<div class="col-sm-12">
								<a href="/member/login" class="m-link-muted">로그인</a>
							</div>

						</div> -->

						<div class="row">
							<div class="col-sm-12">
								<div style="text-align: center" class="font-13">
									<button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3" disabled="disabled" id="modifyBtn">비밀번호 변경</button>
									<!-- <button type="button" class="butn-style2 mt-4" onclick="location.href='/';">취소</button> -->
								</div>
							</div>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

</section>
<script src="/resources/js/member.modifyPwd.js"></script>
<jsp:include page="../common/footer.jsp" />
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
						<h4 class="mb-0 text-center">아이디 찾기</h4>
					</div>

					<form method="post" action="/member/searchIDResult">

						<div class="row">

							<div class="col-sm-12">
								<div class="text-center">
									<span class="font-14">가입 시 등록한 이메일을 입력하면<br>아이디의 일부를 알려드립니다.
									</span>
								</div>
								<div class="height-120">
									<div class="form-group mt-3">
										<label class="font-12">이메일</label> <input type="email" class="form-control input-style" name="email" placeholder="shoebid@shoebid.com" id="email">
									</div>

									<div id="emailCheck" class="mgs-caution"></div>
								</div>
							</div>
						</div>

						<button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3" id="findBtn">아이디찾기</button>
					</form>

				</div>

			</div>

		</div>
	</div>
</section>
<script src="/resources/js/member.findid.js"></script>
<jsp:include page="../common/footer.jsp" />
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

					<form method="post" action="/member/searchPwd">

						<div class="row">

							<div class="col-sm-12">
								<div class="text-center">
									<span class="font-14">가입 시 등록한 아이디와 이메일을 입력하면<br>비밀번호 변경이 가능합니다.
									</span>
								</div>

								<div class="form-group mt-3">
									<label class="font-12">아이디</label> 
									<input type="text" class="form-control input-style" name="id" placeholder="아이디를 입력해주세요" id="id">
								</div>



								<div class="height-120">
									<div class="form-group mt-3">
										<label class="font-12">이메일</label> 
										<input type="email" class="form-control input-style" name="email" placeholder="shoebid@shoebid.com" id="email">
									</div>

									<div id="emailCheck" class="mgs-caution"></div>
								</div>
							</div>
						</div>
						<!--  <div class="row">
                                    <div class="col-sm-12">
                                        <a href="/member/login" class="m-link-muted">로그인</a>
                                    </div>

                                </div> -->

						<button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3" id="findBtn">회원정보확인</button>
						<!-- <button type="button" class="col-5 btn btn-dark display-30 py-3 me-1 mt-1" onclick="location.href='/';">취소</button> -->

					</form>

				</div>

			</div>

		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />
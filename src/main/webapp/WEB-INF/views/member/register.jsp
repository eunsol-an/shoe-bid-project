<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- MEMBER REGISTER
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">

				<div class="common-block">

					<div class="inner-title">
						<h4 class="mb-0">회원가입</h4>
						<p class="mb-0">There's lots of fun in Register.</p>
					</div>

					<form action="/member/register" method="post"
						enctype="multipart/form-data">

						<div class="row">

							<div class="col-sm-6">

								<div class="form-group">
									<label>아이디</label> <input type="text"
										class="form-control" name="id" placeholder="5~12자 영문 소문자, 숫자"
										id="id" required="required">
									<button type="button" class="btn btn-success" id="idDupleCheck">아이디
										중복확인</button>
									<div class="check_font" id="idCheck"></div>
								</div>

							</div>

							<div class="col-sm-6">

								<div class="form-group">
									<label>닉네임</label> <input type="text" class="form-control"
										name="nickName" placeholder="2~8자" id="nickName"
										required="required">
									<button type="button" class="btn btn-success"
										id="nickNameDupleCheck">닉네임 중복확인</button>
									<div class="check_font" id="nickCheck"></div>
								</div>

							</div>

						</div>

						<div class="row">

							<div class="col-sm-6">

								<div class="form-group">
									<label>이메일</label> <input type="email" class="form-control"
										name="email" placeholder="Your email here" id="email"
										required="required">
									<button type="button">이메일 본인 인증</button>
									<div class="check_font" id="emailCheck"></div>
								</div>

							</div>

							<div class="col-sm-6">

								<div class="form-group">
									<label>프로필이미지</label> <input type="file" class="form-control"
										name="fileAttached" accept=".gif, .jpg, .png, .jpeg, .gif">
								</div>

							</div>

						</div>

						<div class="row">

							<div class="col-sm-6">

								<div class="form-group">
									<label>비밀번호</label> <input type="password" class="form-control"
										name="pwd" id="pwd" placeholder="8~20자" required="required">
								</div>
								<div class="check_font" id="pwdCheck"></div>

							</div>
							<!-- 비밀번호 재확인 -->
							<div class="col-sm-6">

								<div class="form-group">
									<label>비밀번호 확인</label> <input type="password"
										class="form-control" name="repwd" id="repwd" placeholder="8~20자"
										required="required">
								</div>
								<div class="check_font" id="repwdCheck"></div>

							</div>

						</div>

						<button type="submit" class="butn-style2 mt-4" id="regBtn">회원가입</button>

					</form>

				</div>
			</div>

		</div>
	</div>
</section>
<script src="/resources/js/member.register.js"></script>
<jsp:include page="../common/footer.jsp" />
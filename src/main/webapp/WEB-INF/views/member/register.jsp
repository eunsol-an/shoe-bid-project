<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- MEMBER REGISTER
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row">

			<div class="col-lg-5 mx-auto">

				<div class="common-block border-0">

					<div class="mb-5">
						<h4 class="mb-0 text-center">회원가입</h4>
						
					</div>

					<form action="/member/register" method="post" enctype="multipart/form-data">

						<div class="row">

							<div class="col-sm-12">
								<div class="form-group">
								<div class="height-100">
									<label class="font-12">아이디</label>
								<div class="input-group">
									<input type="text" class="form-control input-style" name="id" placeholder="5~12자 영문 소문자, 숫자" id="id" required="required">
									<button type="button" class="btn btn-light-style" id="idDupleCheck">중복확인</button>
								</div>
									<div class="check_font mgs-caution" id="idCheck"></div>
								</div>
									
								<div class="height-100">
									<label class="font-12">닉네임</label> 
								<div class="input-group">
									<input type="text" class="form-control input-style" name="nickName" placeholder="2~8자" id="nickName" required="required">
									<button type="button" class="btn btn-light-style" id="nickNameDupleCheck">중복확인</button>
								</div>	
									<div class="check_font mgs-caution" id="nickCheck"></div>
								</div>
									
								<div class="height-100">
									<label class="font-12">이메일</label>
								<div class="input-group">
									<input type="email" class="form-control input-style" name="email" placeholder="shoebid@shoebid.com" id="email" required="required">
									<button type="button" class="btn btn-light-style" id="emailDupleCheck">중복확인</button>
								</div>
									<div class="check_font mgs-caution" id="emailCheck"></div>
								</div>
								
								<div class="height-100">
									<label class="font-12">프로필이미지</label> 
									<input type="file" class="form-control input-style" name="fileAttached" accept=".gif, .jpg, .png, .jpeg, .gif">
								</div>
								</div>
							</div>
						</div>




						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<label class="font-12">비밀번호</label> 
									<input type="password" class="form-control input-style" name="pwd" id="pwd" placeholder="8~20자" required="required">
								</div>
								<div class="check_font mgs-caution" id="pwdCheck"></div>
							</div>
							
							<!-- 비밀번호 재확인 -->
							<div class="col-sm-6">
								<div class="form-group">
									<label class="font-12">비밀번호 확인</label>
									<input type="password" class="form-control input-style" name="repwd" id="repwd" placeholder="8~20자" required="required">
								</div>
								<div class="check_font mgs-caution" id="repwdCheck"></div>
							</div>

						</div>
						
						<div class="row">
                        <div class="col-sm-12">
						<div style="text-align: center" class="font-13">
						<button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3" id="regBtn" >회원가입</button>
						</div></div></div>
						
					</form>

				</div>
			</div>

		</div>
	</div>
</section>
<script src="/resources/js/member.register.js"></script>
<jsp:include page="../common/footer.jsp" />
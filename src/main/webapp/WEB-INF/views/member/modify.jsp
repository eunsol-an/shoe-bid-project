<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- MEMBER MODIFY
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row">

			<div class="col-lg-5 mx-auto">

				<div class="common-block border-0">

					<div class="mb-5">
						<h4 class="mb-0 text-center">회원정보수정</h4>

					</div>

					<form action="/member/modify" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${ses.mno }" name="mno" class="form-control input-style"> <span type="hidden" id="sesnick">${mdto.mvo.nickName }</span>
						<div class="row">

							<div class="col-sm-12">
								<div class="form-group">
									<div class="height-100">

										<label class="font-12">아이디</label> <input type="text" class="form-control input-style" name="id" value="${mdto.mvo.id }" readonly="readonly">
									</div>
								</div>

								<div class="height-100">
									<label class="font-12">닉네임</label>
									<div class="input-group">
										<input type="text" class="form-control input-style" name="nickName" id="nickName" value="${mdto.mvo.nickName }" required="required">
										<button type="button" class="btn btn-light-style" id="nickNameDupleCheck">닉네임 중복확인</button>
									</div>
									<div class="check_font" id="nickCheck"></div>
								</div>

							</div>

						</div>



						<div class="height-100">
							<label class="font-12">이메일</label>
							<div class="input-group">
								<input type="email" class="form-control input-style" name="email" value="${mdto.mvo.email }" readonly="readonly">
							</div>
						</div>






						<div class="height-100">
							<label class="font-12">프로필이미지</label> <input type="file" class="form-control input-style" name="fileAttached" accept=".gif, .jpg, .png, .jpeg, .gif" multiple> <input type="hidden" class="form-control input-style" id="" name="memberImg" value=${mdto.mvo.memberImg }>
						</div>





						<input type="hidden" value="${mdto.mvo.grade }" name="grade"> <input type="hidden" value="${mdto.mvo.reportCount }" name="reportCount">
						<c:if test="${ses.grade == 99 }">




							<div class="height-100">
								<label class="font-12">등급</label>
								<div class="input-group">
									<input type="text" class="form-control input-style" name="grade" value="${mdto.mvo.grade }">
								</div>
							</div>



							<div class="height-100">
								<label class="font-12">신고횟수</label> <input type="text" class="form-control input-style" name="reportCount" value="${mdto.mvo.reportCount }">
							</div>
				</div>


				</c:if>

				<div class="row">

					<div class="col-sm-6">

							<div class="form-group">
							<div class="height-100">
								<label class="font-12">비밀번호</label> 
								<div class="input-group">
								<input type="password" class="form-control input-style" name="pwd" placeholder="8~20자" id="pwd" required="required">
							</div>
								<div class="check_font msg-caution" id="pwdCheck"></div>
						</div></div>
						</div>


						<!-- 비밀번호 재확인 -->
						<div class="col-sm-6">
							<div class="form-group">
							<div class="height-100">
								<label class="font-12">비밀번호 확인</label> 
								<div class="input-group">
								<input type="password" class="form-control input-style" name="repwd" id="repwd" placeholder="8~20자" required="required">
							</div>
							
								<div class="check_font msg-caution" id="repwdCheck"></div>
						</div></div>

					</div>

					<div class="row">
						<div class="col-sm-12">
							<div style="text-align: center" class="font-13">
								<button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3" id="regBtn" disabled="disabled">회원정보수정</button>

							</div>
						</div>
					</div>


					</form>

				</div>
			</div>

		</div>
	</div>
</section>
<script src="/resources/js/member.modify.js"></script>
<jsp:include page="../common/footer.jsp" />
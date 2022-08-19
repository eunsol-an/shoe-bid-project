<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<div class="col-lg-4 mx-auto">

				<div class="common-block border-0">
					<div class="mb-4">
						<h4 class="mb-0 text-center">아이디 찾기 결과</h4>
					</div>

					
						<div class="col-sm-12 mb-3 text-center">
							<c:choose>
								<c:when test="${list.size() eq 0 }">
									<span class="font-14">가입 정보를 찾을 수 없습니다.</span>
								</c:when>

								<c:otherwise>
									<c:forEach items="${list }" var="id">
										<!-- <span class="font-14">입력하신 정보로 아래의 아이디를 찾았습니다.</span><br> -->
										<c:if test="${id ne null }">
											<c:set var="length" value="${fn:length(id)}" />
											<span class="font-14">
												회원님의 아이디는 ${fn:substring(id, 0, length-3) }
												<c:forEach begin="${fn:length(id)-2 }" end="${fn:length(id) }" step="1">*</c:forEach>입니다.<br> 
												전체 아이디는 관리자에게 문의해주세요.
											</span>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>

					
					<div class="d-flex justify-content-center mt-4">
						<c:if test="${list.size() eq 1 }">
						<button type="button" class="col-5 btn btn-dark display-30 py-3 me-1 mt-1" onclick="location.href='/member/login';">로그인</button>
						</c:if>
						<c:if test="${list.size() eq 0 }">
							<button type="button" class="col-5 btn btn-dark display-30 py-3 me-1 mt-1 " onclick="location.href='/member/searchID';">아이디 찾기</button>
						</c:if>
						<button type="button" class="col-5 btn btn-dark display-30 py-3 mt-1" onclick="location.href='/member/searchPwd';">비밀번호 찾기</button>
						<!-- <button type="button" class="btn btn-dark mt-2 mb-0 display-30" onclick="location.href='/';">취소</button> -->
					</div>
						</div>
				</div>

			</div>

		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp" />
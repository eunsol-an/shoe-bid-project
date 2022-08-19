<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<div class="col-lg-4 mx-auto">

				<div class="common-block border-0">

					<div class="mb-5">
						<h4 class="mb-0 text-center">비밀번호 변경</h4>
					</div>
					
					
					<div class="row">
						<div class="text-center">
							<span class="font-14">비밀번호가 변경되었습니다.</span>	
						</div>

					</div>
					
					<div class="d-flex justify-content-center mt-4">
					<button type="button" class="col-5 btn btn-dark display-30 py-3 me-1 mt-1"
					onclick="location.href='/member/login';">로그인
					</button>
					
					<button type="button" class="col-5 btn btn-dark display-30 py-3 me-1 mt-1"
						onclick="location.href='/';">메인화면으로가기</button>

				</div>

			</div>

		</div>
	</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<section class="page-title-section bg-img cover-background" data-background="img/bg/page-title.jpg">
	<div class="container">
		<div class="title-info">
			<h1>REPORT</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a href="#">신고하기</a></li>
			</ul>
		</div>
	</div>
</section>

<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<div class="common-block">
					<div class="inner-title">
						<h2 class="mb-0 display-26 display-lg-24">신고 할 내용을 작성해주세요.</h2>
					</div>
					<!-- order tracking form -->
					<form action="/report/register" method="post">
						<div class="row">
							<div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>회원 닉네임 : test200</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>신고대상 닉네임 : test201</label>
                                        </div>
                                    </div>
                                </div>
							<div class="col-12 mb-2">
								<%-- <input type="hidden" name="mno" value="${ses.mno }">
								<input type="hidden" name="targetMno" value="${mvo.mno }"> --%>
								<input type="text" name="mno" value=500>
								<input type="text" name="targetMno" value=600>
								<div class="form-group">
									<label>제목</label> 
									<input type="text" class="form-control" name="reportTitle" placeholder="reportTitle">
								</div>
							</div>
							<div class="col-12 mb-2">
								<div class="form-group">
									 <label>신고 내용</label>
                                        <div class="form-group mb-1">
                                            <textarea rows="2" class="form-control" name="reportContent" placeholder="신고할 내용을 작성해주세요"></textarea>
                                        </div>
								</div>
							</div>
						</div>
						<button type="submit" class="butn-style2">신고하기</button>
						

					</form>
					<!-- end order tracking form -->

				</div>
			</div>
		</div>
	</div>
</section>


<jsp:include page="../common/footer.jsp" />
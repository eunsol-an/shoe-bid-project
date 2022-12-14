<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />



<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mx-auto">
				<div>
					<div class="mb-5">
						<h2 class="mb-0 display-26 display-lg-24">신고 할 내용을 작성해주세요.</h2>
					</div>
					<!-- order tracking form -->
					<form action="/report/register" method="post">
						<div class="row">
							<div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>회원 닉네임 : ${ses.nickName }</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>신고대상 닉네임 : ${mvo.nickName }</label>
                                        </div>
                                    </div>
                                </div>
							<div class="col-12 mb-2">
								<input type="hidden" name="mno" value=${ses.mno }>
								<input type="hidden" name="targetMno" value=${mvo.mno }>
								<div class="form-group">
									<label>제목</label> 
									<input type="text" class="form-control" name="reportTitle" placeholder="제목" required="required">
								</div>
							</div>
							<div class="col-12 mb-2">
								<div class="form-group">
									 <label>신고 내용</label>
                                        <div class="form-group mb-1">
                                            <textarea rows="2" class="form-control" name="reportContent" placeholder="신고할 내용을 작성해주세요" required="required"></textarea>
                                        </div>
								</div>
							</div>
						</div>
						<button type="submit" class="col-12 btn btn-dark py-3">신고하기</button>
						

					</form>
					<!-- end order tracking form -->

				</div>
			</div>
		</div>
	</div>
</section>


<jsp:include page="../common/footer.jsp" />
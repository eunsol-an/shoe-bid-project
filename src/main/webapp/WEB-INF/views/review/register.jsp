<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<c:set var="pvo" value="${pdto.pvo }" />

<section class="md">
            <div class="container">
                <div class="row justify-content-center">

                    <!-- right panel -->
                    <div class="col-lg-8">

                        <div class="common-block">

                            <div class="inner-title">
                                <h4 class="mb-0">${nickName }님에게 보내는 후기</h4>
                            </div>

                            <form action="/review/register" method="post">
                            <input type="hidden" name="pno" value="${pvo.pno }">
                            <input type="hidden" name="sendMno" value="${ses.mno }">
                            <input type="hidden" name="recvMno" value="${recvMno }">

                                <div class="row mb-4">

                                    <div class="col-sm-3">

                                        <div>
                                            <img class="mb-1-9 mx-auto border rounded" id="xzoom-magnific"
											src="/upload/${fn:replace(pdto.imageList[0].saveDir,'\\','/')}/${pdto.imageList[0].uuid }_${pdto.imageList[0].imageName }"
											alt="..." />
                                        </div>

                                    </div>

                                    <div class="col-sm-9">

                                        <h4>${pvo.pname }</h4>
                                        <div>
                                        	<span class="me-2 display-30">판매자</span>
                                        	<span>${pdto.mvo.nickName }</span>
                                       	</div>
                                        <div>
                                        	<span class="me-2 display-30">낙찰자</span>
                                        	<span>${buyerNick }</span>
                                       	</div>
                                        <div>
											<span class="me-2 display-30">낙찰가</span>
											<span class="display-25 font-weight-700" id="maxPrice"><fmt:formatNumber value="${pdto.maxPrice }" pattern="#,###" /></span>원
										</div>

                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-sm-12 mb-2">
                                    
	                                    <div class="form-group" id="myform">
										    <fieldset>
										        <div class="text-start">별점 평가</div>
										        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">⭐</label>
										        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">⭐</label>
										        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">⭐</label>
										        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">⭐</label>
										        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">⭐</label>
										    </fieldset>
										</div>

                                    </div>
                                    
                                    <div class="col-sm-12">

                                        <div class="form-group">
                                            <label>후기 작성</label>
                                            <textarea rows="5" class="form-control" maxlength="50" placeholder="50자내로 입력해주세요" name="content"></textarea>
                                        </div>

                                    </div>

                                </div>

                                <button type="submit" class="butn-style2 mt-4">작성하기</button>

                            </form>

                        </div>

                    </div>
                    <!-- end right panel -->
                </div>
            </div>
        </section>

<jsp:include page="../common/footer.jsp"/>
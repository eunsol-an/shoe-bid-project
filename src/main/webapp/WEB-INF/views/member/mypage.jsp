<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- PAGE TITLE
        ================================================== -->
        <section class="page-title-section bg-img cover-background" data-background="img/bg/page-title.jpg">
            <div class="container">

                <div class="title-info">
                    <h1>My Profile</h1></div>
                <div class="breadcrumbs-info">
                    <ul class="ps-0">
                        <li><a href="/">Home</a></li>
                        <li><a href="/member/mypage?mno=${mvo.mno }">My Profile</a></li>
                    </ul>
                </div>

            </div>
        </section>
        
        <!-- ACCOUNT ORDERS
        ================================================== -->
        <section class="md">
            <div class="container">
                <div class="row justify-content-center">

                    <!-- left panel -->
                    <div class="col-lg-4 col-sm-9 mb-2-3 mb-lg-0">

                        <div class="account-pannel">

                            <div class="p-4">

                                <div class="text-center">
                                    <div class="pb-3">
                                        <img class="img-fluid rounded-circle img-thumbnail" src="img/avatar/t-3.jpg" alt="...">
                                    </div>
                                    <h6 class="mb-0 display-28">${mvo.nickName }</h6>
                                    <small>Joined ${mvo.regAt }</small>
                                </div>
                            </div>

                            <div class="list-group">
                                <a class="list-group-items" href="account-orders.html"><i class="ti-bag pe-2"></i>입찰내역<span class="badge badge-pill">6</span></a>
                                <a class="list-group-items active" href="account-profile.html"><i class="ti-user pe-2"></i>내정보</a>
                                <a class="list-group-items" href="account-wishlist.html"><i class="ti-heart pe-2"></i>찜목록<span class="badge badge-pill">3</span></a>
                                <a class="list-group-items" href="account-tickets.html"><i class="ti-tag pe-2"></i>My Tickets<span class="badge badge-pill">4</span></a>
                            </div>

                        </div>

                    </div>
                    <!-- end left panel -->

                    <!-- right panel -->
                    <div class="col-lg-8">

                        <div class="common-block">

                            <div class="inner-title">
                                <h4 class="mb-0">내정보</h4>
                                <p class="mb-0">Time for a Sharp My profile.</p>
                            </div>


                                <div class="row">

                                    <div class="col-sm-6">
										<input type="hidden" value="${mvo.mno }" id="mnoVal">
                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input type="text" class="form-control" name="id" value="${mvo.id }" disabled="disabled">
                                        </div>

                                    </div>

                                    <div class="col-sm-6">

                                        <div class="form-group">
                                            <label>닉네임</label>
                                            <input type="text" class="form-control" name="nickName" value="${mvo.nickName }" disabled="disabled">
                                        </div>

                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-sm-6">

                                        <div class="form-group">
                                            <label>이메일</label>
                                            <input type="email" class="form-control" name="email" value="${mvo.email }" disabled="disabled">
                                        </div>

                                    </div>

                                    <div class="col-sm-6">

                                        <div class="form-group">
                                            <label>등급</label>
                                            <input type="text" class="form-control" name="grade" value="${mvo.grade }" disabled="disabled">
                                        </div>

                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-12 mb-2">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="terms-condition">
                                            <label class="form-check-label" for="terms-condition">I agree to the <a href="#" class="text-primary">Terms & Conditions</a></label>
                                        </div>
                                    </div>

                                </div>

                                <button type="button" class="butn-style2 mt-4"><a href="/member/modify?mno=${mvo.mno }">회원정보 수정</a></button>
                                <button type="button" class="butn-style2 mt-4" id="memberRemove">회원탈퇴</button>
								<form action="" id="memberRmForm" style="display: none;" method="post">
  									<input type="hidden" id="membernum" value="" name="mno">  	
 								</form>

                        </div>

                    </div>
                    <!-- end right panel -->
                </div>
            </div>
        </section>
        <script src="/resources/js/member.mypage.js"></script>

<jsp:include page="../common/footer.jsp"/>
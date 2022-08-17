<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<section class="md">
            <div class="container">
                <div class="row justify-content-center">

                    <div class="col-lg-6">

                        <div class="common-block">

                            <div class="inner-title">
                                <h4 class="mb-0">로그인</h4>
                            </div>

                            <form action="/member/login" method="post">

                                <div class="row">

                                    <div class="col-sm-12">

                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input type="text" class="form-control" name="id" placeholder="아이디">
                                        </div>

                                    </div>

                                    <div class="col-sm-12">

                                        <div class="form-group">
                                            <label>비밀번호</label>
                                            <input type="password" class="form-control" name="pwd" placeholder="비밀번호">
                                        </div>

                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-check" style="text-align: center">
                                        <button type="submit" class="butn-style2 mt-4 mb-4">로그인</button>
                                        <ul style="text-align: center">
                                        	<li style="display: inline;"><a href="/member/register">회원가입</a></li>&emsp;
                                        	<li style="display: inline;"><a href="/member/searchID">아이디찾기</a></li>&emsp;
                                        	<li style="display: inline;"><a href="/member/searchPwd">비밀번호재설정</a>
                                        </ul>
                                        </div>
                                    </div>
                                    

                                </div>

                                

                            </form>

                        </div>

                    </div>

                </div>
            </div>
        </section>

<jsp:include page="../common/footer.jsp"/>
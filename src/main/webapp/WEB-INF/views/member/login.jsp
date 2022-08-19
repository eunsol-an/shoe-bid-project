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
                                <h4 class="mb-0 text-center">로그인</h4>
                            </div>

                            <form action="/member/login" method="post">

                                <div class="row">

                                    <div class="col-sm-12">

                                        <div class="form-group">
                                        <div class="height-100">
                                            <label class="font-12">아이디</label>
                                            <input type="text" class="form-control input-style" name="id" placeholder="아이디">
                                        </div>
                                        </div>

                                    </div>

                                    <div class="col-sm-12">

                                        <div class="form-group">
                                        <div class="height-100">
                                            <label class="font-12">비밀번호</label>
                                            <input type="password" class="form-control input-style" name="pwd" placeholder="비밀번호">
                                        </div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div style="text-align: center" class="font-13">
                                        <button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3">로그인</button>
                                        <ul style="text-align: center" class="p-0 font-13">
                                        	<li style="display: inline;"><a href="/member/register">회원가입</a></li>&nbsp;|
                                        	<li style="display: inline;"><a href="/member/searchID">아이디 찾기</a></li>&nbsp;|
                                        	<li style="display: inline;"><a href="/member/searchPwd">비밀번호 찾기</a>
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
<script>
let notLogin = '<c:out value="${notLogin}"/>';

if (parseInt(notLogin)){
	alert("아이디또는 비밀번호를 다시 확인하세요 SHOE-BID에 등록되지 않은 아이디거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
}

</script>
<jsp:include page="../common/footer.jsp"/>
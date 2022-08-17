<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- TABLES
        ================================================== -->
        <c:choose>
        <c:when test="${ses.grade == 99 }">
        <section class="md">
            <div class="container">
                <div class="row justify-content-center">
                <!-- left panel -->
				<jsp:include page="../common/mypageMenu.jsp"/>
				<!-- end left panel -->
				<!-- right panel -->
                <div class="col-lg-10">
                <div class="common-block border-0">

                    <div class="position-relative elements-block">

                        <div class="inner-title">
                            <h4 class="mb-0">회원 리스트</h4>
                        </div>

                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th>회원번호</th>
                                        <th>아이디</th>
                                        <th>이메일</th>
                                        <th>닉네임</th>
                                        <th>등급</th>
                                        <th>신고횟수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list }" var="mvo">
                                    <tr>
                                        <td>${mvo.mno }</td>
                                        <td>${mvo.id }</td>
                                        <td>${mvo.email }</td>
                                        <td><a href="/member/mypage?mno=${mvo.mno }">${mvo.nickName }</a></td>
                                        <td>${mvo.grade }</td>
                                        <td>${mvo.reportCount }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination text-small text-uppercase text-extra-dark-gray">
                            <ul>
                            <c:if test="${pgn.prev }">
                            <li class="page-item">
                                    <a class="page-link" aria-label="Previous" href="/member/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                                </li>
                            </c:if>
                            <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
                                <li class="page-item ${pgn.pgvo.pageNo == i ? 'active': '' }"><a href="/member/list?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
                            </c:forEach>
                            <c:if test="${pgn.next }">
                                <li class="page-item">
                                    <a class="page-link" href="/member/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                                </li>
                            </c:if>
                            </ul>
                        </div>
                        </div>

                    </div>

				</div>
                </div>
                <!-- end right panel -->
                </div>
            </div>
        </section>
        </c:when>
        <c:otherwise>
			<section class="md">
			    <div class="container">
			        <div class="row justify-content-center">
			            <div class="col-lg-8">
			
			                <div class="text-center p-5">
			
			                    <div class="mb-5">
			                        <h2>권한이 필요한 페이지입니다.</h2>
			                    </div>
			
			                    <a href="/member/mypage?mno=${ses.mno }" class="btn btn-dark wide m-1"><span><i class="fas fa-arrow-left me-2"></i>마이페이지로 돌아가기</span></a>
			                    <a href="/product/list" class="btn btn-dark wide m-1"><span>다른 상품 둘러보기<i class="fas fa-arrow-right me-2"></i></span></a>
			
			                </div>
			
			            </div>
			        </div>
			    </div>
			</section>
		</c:otherwise>
        </c:choose>

<jsp:include page="../common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="common/header.jsp" />
<jsp:include page="common/nav.jsp" />

<!-- BANNER
================================================== -->
<div class="owl-carousel owl-theme text-center">
    <div class="item"><img src="/resources/bootstrap/img/slider/slide-09.png" alt="..." /></div>
    <div class="item"><img src="/resources/bootstrap/img/slider/slide-08.png" alt="..." /></div>
    <div class="item"><img src="/resources/bootstrap/img/slider/slide-07.png" alt="..." /></div>
</div>


<!-- CATEGORY
================================================== -->
<section>
    <div class="container">
        <div class="row mt-n1-9 text-center">
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=s" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-4.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Sneakers</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=a" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-5.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Sandals</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=i" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-6.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Slippers</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=l" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-7.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Loafers</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=f" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-8.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Flat</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=b" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-9.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Boots</h3>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- FEATURED PRODUCTS
================================================== -->
<section class="pt-5">
    <div class="container">
        <div class="text-center mb-1-9 mb-lg-2-3">
            <h2 class="mb-0">New In</h2>
            <p class="text-muted">최신 경매 상품</p>
        </div>
        <div class="row mt-n1-9">
        <c:forEach items="${list }" var="pvo">
            <div class="col-sm-6 col-lg-3 mt-1-9 listBox">
                <div class="product-grid-four">
                    <div class="product-img rounded-3 box">
                    
                        <a href="/product/detail?pno=${pvo.pno }&mno=${ses.mno>0? ses.mno :'0'} "><img class="img" src="/upload/${fn:replace(pvo.productImg,'\\','/')}" alt="..."></a>
                        
                    
                    </div>
                    <div class="ms-2">
                     
	                    <h3 class="h6"><a href="/product/detail?pno=${pvo.pno }&mno=${ses.mno>0? ses.mno :'0'}">${pvo.pname }</a></h3>
	             
                    
	                    <div>
							<span class="badge bg-secondary">시작가</span>
							<span class="display-29 text-muted text-decoration-line-through"><fmt:formatNumber value="${pvo.reservePrice }" pattern="#,###" />원</span>
						</div>
						<div>
							<span class="badge bg-primary">현재가</span>
							<span class="font-weight-600 display-29 text-muted"><fmt:formatNumber value="${pvo.highestPrice }" pattern="#,###" />원</span>
						</div>
	                    <div class="display-29 text-muted mt-2"><i class="far fa-clock"></i> ${pvo.endTime }</div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
</section>

<!-- OFFER BANNER
        ================================================== -->
        <section class="py-0">
            <div class="container">
                <div class="row mt-n4">
                    <div class="col-md-6 mt-4">
                        <div class="bg-img cover-background py-2-3 py-md-6 px-1-6 px-md-1-9" data-background="/resources/bootstrap/img/bg/banner-1.png">
                            <h4 class="mb-1-9">경매? 그거 어떻게 하는건데?<br><span class="">SHOE-BID 이용 방법 보러가기!</span></h4>
                            <a href="/about" class="btn btn-sm btn-dark"><span>서비스 안내</span></a>
                        </div>
                    </div>
                    <div class="col-md-6 mt-4">
                        <div class="bg-img cover-background py-2-3 py-md-6 px-1-6 px-md-1-9" data-background="/resources/bootstrap/img/bg/banner-2.png">
                            <h4 class="mb-1-9">신발, 타이어보다 싸다!<br><span class="">스니커즈 구경하러가기!</span></h4>
                            <a href="/product/list?type=s" class="btn btn-sm btn-dark"><span>둘러보기</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<!-- SERVICES
================================================== -->
<!-- <section class="p-0">
    <div class="container">
        <div class="row mt-n4">
            <div class="col-sm-6 col-lg-3 mt-4">
                <div class="text-center">
                    <img src="img/icons/icon-10.png" class="mb-3" alt="...">
                    <h3 class="h5">Free Shipping</h3>
                    <p class="mb-0">Free shipping over $100</p>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 mt-4">
                <div class="text-center">
                    <img src="img/icons/icon-11.png" class="mb-3" alt="...">
                    <h3 class="h5">Money Return</h3>
                    <p class="mb-0">Guarantee under 7 days</p>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 mt-4">
                <div class="text-center">
                    <img src="img/icons/icon-12.png" class="mb-3" alt="...">
                    <h3 class="h5">Gift Voucher</h3>
                    <p class="mb-0">Get $15 off your order</p>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 mt-4">
                <div class="text-center">
                    <img src="img/icons/icon-13.png" class="mb-3" alt="...">
                    <h3 class="h5">Support 24 / 7</h3>
                    <p class="mb-0">Support online 24 hours a day</p>
                </div>
            </div>
        </div>
    </div>
</section> -->

<!-- LOOKBOOk
================================================== -->
<section>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7 mb-1-9 mb-lg-0">
                <div class="pe-xl-1-9 position-relative">
                    <img src="/resources/bootstrap/img/bg/banner-3.png" style="border-radius:40px;">
                </div>
            </div>
            <div class="col-lg-5">
                <div class="ps-xl-6">
                    <h2 class="h1 w-xl-80 mb-1-6 mb-lg-1-9">오늘 단 하루!<br>럭키드로우!</h2>
                    <p class="mb-1-6 mb-lg-1-9">슈비드와 오프 블랙의 콜라보 한정판 제품입니다<br>신규 회원 가입시 럭키드로우 자동 응모됩니다</p>
                    <a href="/member/register" class="text-uppercase small border-bottom border-color-black text-dark">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
let isLogout = '<c:out value="${isLogout}"/>';

if (parseInt(isLogout)){
	alert("로그아웃 되었습니다");
}
</script>
<jsp:include page="common/footer.jsp" />
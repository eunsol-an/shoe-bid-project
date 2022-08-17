<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- PAGE TITLE
        ================================================== -->
<style>
.box{
  width: 300px;
 height: 300px; 
 position: relative;
}
.img{
position: absolute;

   width:100%;
 height:100%; 
   object-fit : cover;  
}
</style>
<section class="page-title-section bg-img cover-background border-0"
   data-background="/resources/bootstrap/img/bg/page-title.png">
   <div class="container">

      <div class="title-info text-center">
         <h1>SHOP</h1>
      </div>
      <div class="breadcrumbs-info text-center">
         <ul class="ps-0">
            <li><a href="/">Home</a></li>
            <li><a href="/product/list">All</a></li>
            <c:if test="${pgn.ppgvo.type eq 's'}"><li><a href="/product/list?type=${pgn.ppgvo.type}">Sneakers</a></li></c:if>
            <c:if test="${pgn.ppgvo.type eq 'a'}"><li><a href="/product/list?type=${pgn.ppgvo.type}">Sandals</a></li></c:if>
            <c:if test="${pgn.ppgvo.type eq 'i'}"><li><a href="/product/list?type=${pgn.ppgvo.type}">Slippers</a></li></c:if>
            <c:if test="${pgn.ppgvo.type eq 'l'}"><li><a href="/product/list?type=${pgn.ppgvo.type}">Loafers</a></li></c:if>
            <c:if test="${pgn.ppgvo.type eq 'f'}"><li><a href="/product/list?type=${pgn.ppgvo.type}">Flat</a></li></c:if>
            <c:if test="${pgn.ppgvo.type eq 'b'}"><li><a href="/product/list?type=${pgn.ppgvo.type}">Boots</a></li></c:if>
         </ul>
      </div>

   </div>
</section>

<!-- CATEGORY
================================================== -->
<section class="pt-1 pb-3">
   <div class="container">
   <!-- search area -->
         <div class="col-12 col-lg-3 order-3 order-lg-2 ms-auto my-5">
            <div class="product-search">
               <form action="/product/list" method="get">
                  <div class="psearch-content">
                                    <div class="col-auto  my-md-0">
                                        <select class="w-auto d-inline-block form-select" name="orderBy">
                                            <option value="reg">선택</option>
                                            <option value="reg" ${pgn.ppgvo.orderBy eq 'reg' ? 'selected':'' }>등록순</option>
                                            <option value="end" ${pgn.ppgvo.orderBy eq 'end' ? 'selected':'' }>마감순</option>
                                            <option value="highestUp" ${pgn.ppgvo.orderBy eq 'highestUp' ? 'selected':'' }>현재가격순↑</option>
                                            <option value="highestDown" ${pgn.ppgvo.orderBy eq 'highestDown' ? 'selected':'' }>현재가격순↓</option>
                                            <option value="reserveUp" ${pgn.ppgvo.orderBy eq 'reserveUp' ? 'selected':'' }>시작가순↑</option>
                                            <option value="reserveDown" ${pgn.ppgvo.orderBy eq 'reserveDown' ? 'selected':'' }>시작가순↓</option>
                                        </select>
                                    </div>
                     <div class="search-wrapper">
                        <input type="text" name="kw"
                           class="search-field border-start rounded" value=${pgn.ppgvo.kw }>
                     </div>
                     <button type="submit" class="search-submit"
                        style="min-width: auto;">
                        <i class="ti-search"></i>
                     </button>
                  </div>
               </form>
            </div>
         </div>
         <!-- end search area -->
      <div class="row  text-center">
         <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
            <a href="/product/list?type=s" class="categoty-style2">
               <h3 class="font-weight-500 mb-0 bg-light rounded-pill py-3">${pgn.ppgvo.type eq 's'?'>':''}
                  Sneakers</h3>
            </a>
         </div>
         <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
            <a href="/product/list?type=a" class="categoty-style2">
               <h3 class="font-weight-500 mb-0 bg-light rounded-pill py-3">${pgn.ppgvo.type eq 'a'?'>':''}
                  Sandals</h3>
            </a>
         </div>
         <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
            <a href="/product/list?type=i" class="categoty-style2">
               <h3 class="font-weight-500 mb-0 bg-light rounded-pill py-3">${pgn.ppgvo.type eq 'i'?'>':''}
                  Slippers</h3>
            </a>
         </div>
         <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
            <a href="/product/list?type=l" class="categoty-style2">
               <h3 class="font-weight-500 mb-0 bg-light rounded-pill py-3">${pgn.ppgvo.type eq 'l'?'>':''}
                  Loafers</h3>
            </a>
         </div>
         <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
            <a href="/product/list?type=f" class="categoty-style2">
               <h3 class="font-weight-500 mb-0 bg-light rounded-pill py-3">${pgn.ppgvo.type eq 'f'?'>':''}
                  Flat</h3>
            </a>
         </div>
         <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
            <a href="/product/list?type=b" class="categoty-style2">
               <h3 class="font-weight-500 mb-0 bg-light rounded-pill py-3">${pgn.ppgvo.type eq 'b'?'>':''}
                  Boots</h3>
            </a>
         </div>
      </div>
   </div>
</section>
<!-- PRODUCT LIST
        ================================================== -->
<section class="pt-2">
   <div class="container ">
      <div
         class="col-lg-12 col-12 order-1 order-lg-2 mb-1-9 mb-lg-0">
         <%-- <c:if test="${ses.mno ne null && ses ne null }">
            <div class="col-md-1  text-md-end">
               <a href="/product/register" class="btn btn-info mb-4">register</a>
            </div>
         </c:if> --%>
         

         <!-- FEATURED PRODUCTS
         ================================================== -->
         <div class="my-5">
            <div class="container">
               <div class="row mt-n1-9">
                  <c:forEach items="${list }" var="pvo">
                     <div class="col-sm-6 col-lg-3 mt-1-9 ">
                        <div class="product-grid-four">
                           <div class="product-img rounded-3 box">
                    <a href="/product/detail?pno=${pvo.pno }&pageNo=${pgn.ppgvo.pageNo }&qty=${pgn.ppgvo.qty}&type=${pgn.ppgvo.type}&kw=${pgn.ppgvo.kw}&mno=${ses.mno>0? ses.mno: '0'}&orderBy=${pgn.ppgvo.orderBy}">
                                 <img class="img" src="/upload/${fn:replace(pvo.productImg,'\\','/')}" alt="...">
                              </a>
                           </div>
                           <div class="ms-2">
                           
                              <h3 class="h6">
                                 <a href="/product/detail?pno=${pvo.pno }&mno=${ses.mno>0? ses.mno: '0'}&pageNo=${pgn.ppgvo.pageNo }&qty=${pgn.ppgvo.qty}&type=${pgn.ppgvo.type}&kw=${pgn.ppgvo.kw}&orderBy=${pgn.ppgvo.orderBy}">${pvo.pname }</a>
                              </h3>
                
                           
                              <div>
                                 <span class="badge bg-secondary">시작가</span>
                                 <span class="display-29 text-muted text-decoration-line-through"><fmt:formatNumber value="${pvo.reservePrice }" pattern="#,###" />원</span>
                              </div>
                              <div>
                                 <span class="badge bg-primary">현재가</span>
                                 <span class="font-weight-600 display-29 text-muted"><fmt:formatNumber value="${pvo.highestPrice }" pattern="#,###" />원</span>
                              </div>
                              <%-- <div class="display-29 text-muted">종료시간:${pvo.endTime }</div> --%>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
         </div>

         <!-- pagination -->
         <div
            class="pagination text-small text-uppercase text-extra-dark-gray mt-4">
            <ul class="ps-0">
               <c:if test="${pgn.prev }">
                  <li><a
                     href="/product/list?pageNo=${pgn.startPage-1 }&qty=${pgn.ppgvo.qty}&type=${pgn.ppgvo.type}&kw=${pgn.ppgvo.kw}&orderBy=${pgn.ppgvo.orderBy}"><i
                        class="fas fa-long-arrow-alt-left me-1 d-none d-sm-inline-block"></i>
                        Prev</a></li>
               </c:if>
               <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
                  <li class="${pgn.ppgvo.pageNo == i ? 'active':'' }"><a
                     href="/product/list?pageNo=${i }&qty=${pgn.ppgvo.qty}&type=${pgn.ppgvo.type}&kw=${pgn.ppgvo.kw}&orderBy=${pgn.ppgvo.orderBy}">${i }</a></li>
               </c:forEach>
               <c:if test="${pgn.next }">
                  <li><a
                     href="/product/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.ppgvo.qty}&type=${pgn.ppgvo.type}&kw=${pgn.ppgvo.kw}&orderBy=${pgn.ppgvo.orderBy}">Next
                        <i
                        class="fas fa-long-arrow-alt-right ms-1 d-none d-sm-inline-block"></i>
                  </a></li>
               </c:if>
            </ul>
         </div>
         <!-- end pagination -->

      </div>
      <!-- end right panel section -->
   </div>

</section>

<jsp:include page="../common/footer.jsp" />
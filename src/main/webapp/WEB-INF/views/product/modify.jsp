<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>  
<jsp:include page="../common/nav.jsp"/>  
<section class="page-title-section bg-img cover-background"
	data-background="img/bg/page-title.jpg">
	<div class="container">

		<div class="title-info">
			<h1>Shop Product Modify</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="home-shop-1.html">Home</a></li>
				<li><a href="#">Shop Product Modify</a></li>
			</ul>
		</div>
	</div>
</section>
<div class="container">
<form action="/product/modify" method="post" enctype="multipart/form-data">
     <div class="mb-3">
     <input type="hidden" value="${pdto.pvo.pno }" name="pno">
	<input type="hidden" value="${pgvo.pageNo }" name="pageNo">
	<input type="hidden" value="${pgvo.qty }" name="qty">
      <label for="pname">상품 이름:</label>
      <input type="text" class="form-control" id="pname" placeholder="상품이름 입력" name="pname" value=${pdto.pvo.pname } required>
    </div>  
    <div class="mb-3 mt-3">
      <label for="category">카테고리:</label>
      	<input type="text" class="form-control" id="category" placeholder="카테고리 입력" name="category" value=${pdto.pvo.category } required>
    </div>
    <div class="mb-3">
      <label for="price">시작가:</label>
      <input type="text" class="form-control" id="reservePrice" placeholder="시작금액 입력" name="reservePrice" value=${pdto.pvo.reservePrice } required>
    </div>    
    <div class="mb-3">
      <div class="form-check">
  <input type="radio" class="form-check-input" id="radio1" name="endTime" value="1" checked>
  <label class="form-check-label" for="radio1">1일</label>
</div>
<div class="form-check">
  <input type="radio" class="form-check-input" id="radio2" name="endTime" value="2">
  <label class="form-check-label" for="radio2">2일</label>
</div>
<div class="form-check">
  <input type="radio" class="form-check-input" id="radio3" name="endTime" value="3">
  <label class="form-check-label" for="radio3">3일</label>
</div>
    </div> 
    <div class="mb-3">
      <label for="description">상품설명:</label>
      <textarea rows="5" class="form-control" name="description" required>${pdto.pvo.description }</textarea>
    </div>
   <input type="file" class="form-control" name="fileAttached"  accept=".gif, .jpg, .png, .jpeg, .gif"  multiple required>
    <button type="submit" class="btn btn-primary" id="regBtn">Submit</button>
  </form>
</div>
<div class="container mt-3">
  <ul class="list-group list-group-flush">
  <c:forEach items="${pdto.imageList }" var="ivo">
    <li class="list-group-item d-flex justify-content-between align-items-center">
    ${ivo.imageName }
    <span class="badge bg-primary rounded-pill">${ivo.imageSize }</span>    
    <button data-uuid="${ivo.uuid }"
     class="btn btn-outline-danger btn-sm fileDelBtn">X</button>
  </li>
  </c:forEach>
  </ul>
</div>
<script src="/resources/js/product.modify.js"></script>
<jsp:include page="../common/footer.jsp"/>  
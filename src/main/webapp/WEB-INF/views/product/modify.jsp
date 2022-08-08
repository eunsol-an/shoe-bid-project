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
	<input type="hidden" value="${pgvo.type }" name="type">
	<input type="hidden" value="${pgvo.kw }" name="kw">
      <label for="pname">상품 이름:</label>
      <input type="text" class="form-control" id="pname" placeholder="상품이름 입력" name="pname" value=${pdto.pvo.pname } required>
    </div>  
    <c:set value="${pdto.pvo.category }" var="category"/>
    <div class="mb-3">
      <label for="validationCustom06">카테고리</label>
        <select class="form-select form-control" id="category" aria-label="Default select example" name="category">
          <option value="sneakers" ${category eq 'sneakers' ? 'selected':''}>Sneakers</option>
          <option value="sandals" ${category eq 'sandals' ? 'selected':''}>Sandals</option>
          <option value="slippers" ${category eq 'slippers' ? 'selected':''}>Slippers</option>
          <option value="loafers" ${category eq 'loafers' ? 'selected':''}>Loafers</option>
          <option value="flat" ${category eq 'flat' ? 'selected':''}>Flat</option>
          <option value="boots" ${category eq 'boots' ? 'selected':''}>Boots</option>
         </select>
    </div>  
    <div class="mb-3">
      <label for="price">시작가:</label>
      <input type="text" class="form-control" id="reservePrice" placeholder="시작금액 입력" name="reservePrice" value=${pdto.pvo.reservePrice } required>
    </div>    
     <div class="mb-3">
      <label for="validationCustom06">기간</label>
        <select class="form-select form-control" id="endTime" aria-label="Default select example" name="endTime">
          <option value="1">1일</option>
          <option value="2">2일</option>
          <option value="3">3일</option>
         </select>
    </div> 
    <div class="mb-3">
      <label for="description">상품설명:</label>
      <textarea rows="5" class="form-control" name="description" required>${pdto.pvo.description }</textarea>
    </div>
    <input type="hidden" class="form-control" id="" placeholder="상품이름 입력" name="productImg" value=${pdto.pvo.productImg }>
   <input type="file" class="form-control" name="fileAttached"  accept=".gif, .jpg, .png, .jpeg, .gif"  multiple >
    <button type="submit" class="btn btn-primary" id="regBtn">Submit</button>
  </form>
</div>
<script src="/resources/js/product.modify.js"></script>
<jsp:include page="../common/footer.jsp"/>  
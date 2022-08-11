<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>  
<jsp:include page="../common/nav.jsp"/>  
<section class="page-title-section bg-img cover-background"
	data-background="img/bg/page-title.jpg">
	<div class="container">

		<div class="title-info">
			<h1>Shop Product Register</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="home-shop-1.html">Home</a></li>
				<li><a href="#">Shop Product Register</a></li>
			</ul>
		</div>
	</div>
</section>
<div class="container">
<form action="/product/register" method="post" enctype="multipart/form-data">
     <div class="mb-3">
      <label for="pname">상품 이름:</label>
      <input type="text" class="form-control" id="pname" placeholder="상품이름 입력" name="pname" required>
    </div> 
    <div class="mb-3">
      <label for="category">카테고리</label>
        <select class="form-select form-control" id="category" aria-label="Default select example" name="category" required>
          <option value="sneakers">Sneakers</option>
          <option value="sandals">Sandals</option>
          <option value="slippers">Slippers</option>
          <option value="loafers">Loafers</option>
          <option value="flat">Flat</option>
          <option value="boots">Boots</option>
         </select>
    </div>  
       <div class="mb-3">
      <label for="price">시작가:</label>
      <input type="text" class="form-control" id="reservePrice" placeholder="시작금액 입력" name="reservePrice" required>
    </div>    
    <div class="mb-3">
      <label for="endTime">기간:</label>
        <select class="form-select form-control" id="endTime" aria-label="Default select example" name="endTime" required>
          <option value="1">1일</option>
          <option value="2">2일</option>
          <option value="3">3일</option>
         </select>
    </div> 
      	<input type="hidden" class="form-control" id="writer" placeholder="" name="writer" value=${ses.mno }>
    <div class="mb-3">
      <label for="description">상품설명:</label>
      <textarea rows="5" class="form-control" name="description" required></textarea>
    </div>
   <input type="file" class="form-control" name="fileAttached" 
   accept=".gif, .jpg, .png, .jpeg, .gif"  multiple required>
    <button type="submit" class="btn btn-primary" id="regBtn">Submit</button>
  </form>
</div>


<jsp:include page="../common/footer.jsp"/>  
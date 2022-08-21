<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<section class="page-title-section bg-img cover-background" data-background="/resources/bootstrap/img/bg/page-title.png">
	<div class="container">

		<div class="title-info text-center">
			<h1>New Items</h1>
		</div>
		<div class="breadcrumbs-info text-center">
			<ul class="ps-0">
				<li><a href="home-shop-1.html">Home</a></li>
				<li><a href="#">New Items</a></li>
			</ul>
		</div>
	</div>
</section>

<section class="md">
	<div class="container">
		<div class="row">

			<div class="col-lg-7 mx-auto">

				<div class="common-block border-0">

					<div class="mb-5">
						<h4 class="mb-0 text-center">상품등록</h4>

					</div>

					<div class="container">
						<form action="/product/register" method="post" enctype="multipart/form-data" class="mx-auto col-sm-9 my-5">
							<div class="mb-3">
								<label class="font-12" for="pname">상품 이름</label> <input type="text" class="form-control  input-style" id="pname" placeholder="상품이름 입력" name="pname" required>
							</div>
							<div class="mb-3">
								<label for="category">카테고리</label> <select class="form-select form-control" id="category" aria-label="Default select example" name="category" required>
									<option value="sneakers">Sneakers</option>
									<option value="sandals">Sandals</option>
									<option value="slippers">Slippers</option>
									<option value="loafers">Loafers</option>
									<option value="flat">Flat</option>
									<option value="boots">Boots</option>
								</select>
							</div>
							<div class="mb-3">
								<label class="font-12" for="price">시작가</label> <input type="text" class="form-control  input-style" id="reservePrice" placeholder="시작금액 입력" name="reservePrice" required>
							</div>
							<div class="mb-3">
								<label class="font-12" for="endTime">기간</label> <select class="form-select form-control  input-style" id="endTime" aria-label="Default select example" name="endTime" required>
									<option value="1">1일</option>
									<option value="2">2일</option>
									<option value="3">3일</option>
								</select>
							</div>
							<input type="hidden" class="form-control  input-style" id="writer" placeholder="" name="writer" value=${ses.mno }>
							<div class="mb-3">
								<label class="font-12" for="description">상품설명</label>
								<textarea rows="5" class="form-control  input-style" name="description" style="resize: none;" required></textarea>
							</div>
							
							<label class="font-12" for="mainFileAttached">대표이미지</label>
						   <input type="file" class="form-control input-style" name="mainFileAttached" 
						   accept=".gif, .jpg, .png, .jpeg, .gif"  required>
						   <label class="font-12" for="fileAttached">서브이미지</label>
						   <input type="file" class="form-control input-style" name="fileAttached" 
						   accept=".gif, .jpg, .png, .jpeg, .gif"  multiple required>

							<div class="row">
								<div class="col-sm-12">
									<div style="text-align: center" class="font-13">
										<button type="submit" class="col-sm-12 btn btn-dark mt-2 mb-0 display-30 py-3" id="regBtn">등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />

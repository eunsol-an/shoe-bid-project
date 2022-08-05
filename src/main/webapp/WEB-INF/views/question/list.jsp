<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div>
	<div class="row">

		<div class="col-lg-6 order-lg-2 mb-1-9 mb-lg-0">
			<div class="common-block">

				<div class="mb-2-3 pb-2-3 border-bottom">

					<div class="media mb-4 product-review">
						<img class="me-3 rounded-circle w-60px" src="img/avatar/t-1.jpg"
							alt="...">
						<div class="media-body">
							<a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">Jonal
								Doe</a> <span class="d-block text-primary">Sep 15, 2018</span>
						</div>

						<span class="text-primary"> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
						</span>

					</div>

					<p class="mb-0">Consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
						minim veniam, quis nostrud exercitation ullamco laboris nisi ut
						aliquip.</p>

				</div>

				<div class="pb-4">

					<div class="media mb-4 product-review">
						<img class="me-3 rounded-circle w-60px" src="img/avatar/t-2.jpg"
							alt="...">
						<div class="media-body">
							<a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">Marina
								Modra</a> <span class="d-block text-primary">Sep 15, 2018</span>
						</div>

						<span class="text-primary"> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
						</span>

					</div>

					<p class="mb-0">Excepteur sint occaecat cupidatat non proident,
						sunt in culpa qui officia deserunt mollit anim id est laborum. Sed
						ut perspiciatis unde omnis iste natus error sit voluptatem.</p>

				</div>

				<div class="text-start">
					<a href="#" class="butn-style2 small">Load More Reviews</a>
				</div>

			</div>

		</div>

		<div class="col-lg-6 order-lg-1">

			<div class="common-block">

				<div class="inner-title">
					<h4 class="mb-0">Leave Review</h4>
					<p class="mb-0">Leave review takes it to the next level.</p>
				</div>

				<form>

					<div class="row">

						<div class="col-sm-6">

							<div class="form-group">
								<label>Your Name</label> <input type="text" class="form-control"
									name="name" placeholder="Your name here">
							</div>

						</div>

						<div class="col-sm-6">

							<div class="form-group">
								<label>Your Email</label> <input type="email"
									class="form-control" name="email" placeholder="Your email here">
							</div>

						</div>

					</div>

					<div class="row">

						<div class="col-sm-12 mb-2">

							<div class="form-group">
								<label>Rating</label> <select class="form-control form-select">
									<option>5 Stars</option>
									<option>4 Stars</option>
									<option>3 Stars</option>
									<option>2 Stars</option>
									<option>1 Star</option>
								</select>
							</div>

						</div>

					</div>

					<div class="row">

						<div class="col-12 mb-4">

							<label>Comment</label>
							<div class="form-group mb-1">
								<textarea rows="2" class="form-control"
									placeholder="Tell us a few words"></textarea>
							</div>

						</div>

					</div>

					<button type="button" class="butn-style2">Submit Review</button>

				</form>

			</div>

		</div>

	</div>

</div>
</div>
</div>
</div>

</div>

<jsp:include page="../common/footer.jsp" />
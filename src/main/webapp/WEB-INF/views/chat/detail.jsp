<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<section class="page-title-section bg-img cover-background" data-background="img/bg/page-title.jpg">
	<div class="container">
		<div class="title-info">
			<h1>Message</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a href="/chat/list">message</a></li>
			</ul>
		</div>
	</div>
</section>


<div class="container mt-5 mb-5">
	<div>
		<div class="row">
			<div class="col-lg-5 order-lg-1">
				<div class="common-block" style="height: 600px; overflow: auto">
					<c:forEach items="${list }" var="cvo">
						<div class="mb-2-3 pb-2-3 border-bottom">
							<div class="media mb-4 product-review">
								<div class="media-body">
								<span style="display: none;">${cvo.cno } </span>
									<span style="display: none;">${cvo.room }</span>
									
									<a href="#" class="mb-1 font-weight-500 text-extra-dark-gray">${cvo.nickName }
									</a>
								</div>
								<span class="d-block text-primary">${cvo.sendAt } </span>
							</div>
							<span class="mb-0 font-weight-200 text-extra-dark-gray" >${cvo.content } </span>
							<span class="mb-0 font-weight-200 text-extra-dark-gray" style="float:  right" id="readBtn">
							<a href="/chat/detail?cno=${cvo.cno }" >보기</a></span>
						</div>
					</c:forEach>
				</div>
			</div>
			
			
			<div class="col-lg-7 order-lg-2 mb-1-9 mb-lg-0">
				<div class="common-block" style="height: 600px;" id="mydiv">
						<h4>${cvo.nickName }</h4>
						<h4 style="display: none;">${cvo.cno }</h4>
						
						<span id="mno" style="display: none;">${cvo.mno }</span>
						<span id="roomVal" style="display: none;">${cvo.room }</span>
						<span id="readChk" style="display: none;">${cvo.room }</span>
						<span id="sendNick" style="display: none;">${cvo.sendNick }</span>
						<span id="recvNick" style="display: none;">${cvo.recvNick }</span>
						
					<div class="common-block" style="height: 460px; overflow: auto" id="ctZone"></div>
					
					<div class="input-group">
						<input type="text" class="form-control" name="ctText" placeholder="content" id="ctText">
						<button type="button" class="butn-style4" id="ctSbmBtn">전 송</button>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<script src="/resources/js/chat.send.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
	getChatList(document.getElementById('roomVal').innerText);
	
});
/* document.addEventListener('click', (e) => {
	if(e.target.classList.contains("roomBtn")){
	getChatList(e.target.dataset.room);
	}
	
}); */
</script>
<jsp:include page="../common/footer.jsp" />
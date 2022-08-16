<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<section>
	<div class="container">
	<div class="col-lg-10 mx-auto">
	
					<div class="inner-title">
					<a href="/member/mypage?mno=${ses.mno }" style="float:right">My Page</a>
						<h4 class="mb-0 font-weight-500 text-extra-dark-gray">Chatting<a class="h6 ms-2" href="/chat/list?mno=${ses.mno}"><i class="fa fa-refresh" aria-hidden="true"></i></a></h4>
					</div>
<div class="container mt-5 mb-5">
<%-- <a href="/chat/list?mno=${ses.mno}"><i class="fa fa-refresh" aria-hidden="true"></i></a> --%>
	<div>
		<div class="row">
			<div class="col-lg-5 order-lg-1">
				<div class="common-block" style="height: 600px; overflow: auto">
					<c:forEach items="${list }" var="cvo">
					<c:if test="${ses.mno eq cvo.recvNick || ses.mno eq cvo.sendNick}">
						<div class="mb-2-3 pb-2-3 border-bottom">
							<div class="media mb-4 product-review">
								<div class="media-body">
								<span style="display: none;">${cvo.cno } </span>
									<span style="display: none;">${cvo.room }</span>
									
									<c:if test="${ses.mno eq cvo.sendNick}">
									<a href="#" class="mb-1 font-weight-500 text-extra-dark-gray">${cvo.recvNickName }
									</a>
									</c:if>
									<c:if test="${ses.mno ne cvo.sendNick}">
									<a href="#" class="mb-1 font-weight-500 text-extra-dark-gray">${cvo.sendNickName }
									</a>
									</c:if>
								</div>
								<span class="d-block text-primary">${cvo.sendAt } </span>
							</div>
							<span class="mb-0 font-weight-200 text-extra-dark-gray" >${cvo.content } </span>
							<span class="mb-0 font-weight-200 text-extra-dark-gray" style="float:  right" id="readBtn">
							<a href="/chat/detail?cno=${cvo.cno }" >보기</a></span>
						</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			
			
			<div class="col-lg-7 order-lg-2 mb-1-9 mb-lg-0" >
				<div class="common-block" style="height: 600px; " id="mydiv">
					<c:if test="${ses.mno eq cvo.recvNick || ses.mno eq cvo.sendNick}">
						<c:if test="${ses.mno eq cvo.sendNick}">
							<h4>${cvo.recvNickName }</h4>
						</c:if>
						<c:if test="${ses.mno ne cvo.sendNick}">
							<h4>${cvo.sendNickName }</h4>
						</c:if>
						<h4 style="display: none;">${cvo.cno }</h4>
						<span id="ctmno" style="display: none;"> ${ses.mno }</span>
						<span id="roomVal" style="display: none;">${cvo.room }</span>
						<span id="mno" style="display: none;">${cvo.mno }</span>
						<span id="room" style="display: none;">${cvo.room }</span>
						<span id="readChk" style="display: none;">${1 }</span>
						<c:if test="${ses.mno eq cvo.sendNick}">
							<span id="sendNick" style="display: none;">${cvo.recvNick }</span>
						</c:if>
						<c:if test="${ses.mno ne cvo.sendNick}">
							<span id="sendNick" style="display: none;">${cvo.sendNick }</span>
						</c:if>
						<span id="recvNick" style="display: none;">${ses.mno }</span>
						
					<div class="common-block chat_wrap" style="height: 460px; overflow-y: auto " id="ctZone">
					<div class="inner"></div>
					</div>
					<c:if test="${ses.mno ne mvo.mno}">
					<div class="input-group">
						<input type="text" class="form-control" name="ctText" placeholder="content" id="ctText">
						<button type="button" class="butn-style4" id="ctSbmBtn">전 송</button>
					</div>
					</c:if>
					</c:if>
				</div>
			</div>
			
		</div>
		</div>
		</div>
	</div>
</div>
	<!-- </div> -->
</section>
<style>
        .chat_wrap { border:1px solid lightgray;  padding:0px 10px 0 10px; font-size:15px;}
        .chat_wrap .inner{border-radius:5px; padding:10px;}
        .chat_wrap .item{margin-top:15px}
        .chat_wrap .item:first-child{margin-top:0px}
        .chat_wrap .item .box{display:inline-block; max-width:280px; position:relative;}
        .chat_wrap .item .box .msg {background:whitesmoke; border-radius:0px 10px 10px 10px; padding:9px; text-align:left; margin: 0 0 20px;}
        .chat_wrap .item .box .time {font-size:11px;  position:absolute; bottom:1px; width:130px;}
        .chat_wrap .item.mymsg{text-align:right }
        .chat_wrap .item.mymsg .box .msg{background-color:#03a9f5; border-radius:10px 0px 10px 10px; color:white;}
        .chat_wrap .item.mymsg .box .time{right:auto; left:-135px; top: -30px; width:130px;}
        .chat_wrap .item.on .box{margin:0; opacity: 1;} 
</style>
<script src="/resources/js/chat.send.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
	getChatList(document.getElementById('roomVal').innerText);
});
</script>
<jsp:include page="../common/footer.jsp" />
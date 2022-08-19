<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />


<section>
	<div class="container">
	<div class="col-lg-10 mx-auto">
					<div class="inner-title">
					<a href="/member/mypage?mno=${ses.mno }" style="float:right"><i class="fa-solid fa-circle-chevron-left"></i>&nbsp;&nbsp;My Page</a>
						<h4 class="mb-0 font-weight-500 text-extra-dark-gray">Message<a class="h6 ms-2" href="/chat/list?mno=${ses.mno}"><i class="fa fa-refresh" aria-hidden="true"></i></a></h4>
					</div>
<div class="container mt-5 mb-5">
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
									<span style="display: none;">${cvo.room } </span>
									<c:if test="${ses.mno eq cvo.sendNick}">
									<a href="#" class="mb-1 font-weight-500 text-extra-dark-gray">${cvo.recvNickName }</a>
									</c:if>
									<c:if test="${ses.mno ne cvo.sendNick}">
									<a href="#" class="mb-1 font-weight-500 text-extra-dark-gray">${cvo.sendNickName }</a>
									</c:if>
								</div>
								<span class="d-block text-primary">${fn:substring(cvo.sendAt, 0, (fn:length(cvo.sendAt)-3)) } </span>
							</div>
							<div style="height: 50px; overflow: hidden">
							<span class="mb-0 font-weight-200 text-extra-dark-gray" >${cvo.content } </span>
							</div>
							<span class="mb-0 font-weight-200 text-extra-dark-gray" style="float: right">
							<a href="/chat/detail?cno=${cvo.cno }">보기</a></span>
						</div>
					</c:if>
					</c:forEach>
				</div>
			</div>
			
			
			
			<div class="col-lg-7 order-lg-2 mb-1-9 mb-lg-0">
				<div class="common-block" style="height: 600px;">
						<c:if test="${ses.mno ne mvo.mno}">
							<h4>${cvo.cno }</h4>
						<h4>${mvo.nickName }</h4>
						</c:if>
						<h4>${cvo.cno }</h4>
						<span id="ctmno" style="display: none;">${ses.mno }</span>
						<span id="mno" style="display: none;">${mvo.mno }</span>
						<span id="roomVal" style="display: none;">${ses.mno }00000${mvo.mno}</span>
						<span id="room" style="display: none;">${ses.mno }00000${mvo.mno}</span>
						<span id="readChk" style="display: none;">1</span>
						<span id="sendNick" style="display: none;">${mvo.mno}</span>
						<span id="recvNick" style="display: none;">${ses.mno }</span>
						
					<div class="common-block chat_wrap" style="height: 460px; overflow: auto" id="ctZone">
					<div class="inner">
                    </div>
					</div>
					<c:if test="${ses.mno ne mvo.mno}">
					<div class="input-group">
						<input type="text" class="form-control" name="ctText" placeholder="content" id="ctText">
						<button type="button" class="butn-style4" id="ctSbmBtn">전 송</button>
					</div>
					</c:if>
				</div>
			</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<style>
        .chat_wrap { border:1px solid lightgray;  padding:0px 10px 0 10px; font-size:15px;}
        .chat_wrap .inner{border-radius:5px; padding:10px;}
        .chat_wrap .item{margin-top:0px}
        .chat_wrap .item:first-child{margin-top:0px}
        .chat_wrap .item .chatbox{display:inline-block; max-width:280px; position:relative; bottom: 5px;}
        .chat_wrap .item .chatbox .msg {background:whitesmoke; border-radius:0px 10px 10px 10px; padding:9px; text-align:left; margin: 10px 0 20px;}
        .chat_wrap .item .chatbox .time {font-size:11px;  position:absolute; bottom:1px; width:130px;}
        .chat_wrap .item.mymsg{text-align:right; margin-bottom: -20px;}
        .chat_wrap .item.mymsg .chatbox .msg{background-color:#03a9f5; border-radius:10px 0px 10px 10px; color:white;}
        .chat_wrap .item.mymsg .chatbox .time{right:auto; left:-135px; top: -30px; width:130px;}
        .chat_wrap .item.on .chatbox{margin:0; opacity: 1;} 
</style>
<script src="/resources/js/chat.send.js"></script>
<jsp:include page="../common/footer.jsp" />
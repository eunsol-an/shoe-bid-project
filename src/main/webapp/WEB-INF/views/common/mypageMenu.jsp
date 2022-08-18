<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="col-lg-2 col-sm-9 mb-2-3 mb-lg-0">
    <div class="side-bar">
    	<c:choose>
    	<c:when test="${ses.grade ne 0 }">
    		<div class="widget border-0">
            <div class="mb-3">
                <h5><i class="ti-user pe-2"></i>내 정보</h5>
            </div>
            <ul class="list-discount list-unstyled mb-0">
                <li><a href="/member/mypage?mno=${ses.mno }">프로필정보</a></li>
                <li><a href="/chat/list?mno=${ses.mno }">채팅하기</a></li>
                <li><a href="/report/list/${ses.mno }">신고내역</a></li>
            </ul>
        </div>
        <div class="widget border-0">
            <div class="mb-3">
                <h5><i class="ti-bag pe-2"></i>쇼핑 정보</h5>
            </div>
            <ul class="list-discount list-unstyled mb-0">
                <li><a href="/buy_bid/list/${ses.mno }">입찰내역</a></li>
                <li><a href="/product/sellList/${ses.mno }">판매내역</a></li>
                <li><a href="/interest/list/${ses.mno }">관심상품</a></li>
                <li><a href="/review/list/${ses.mno }?type=r">후기내역</a></li>
            </ul>
        </div>
    	</c:when>
    	<c:otherwise>
    		<div class="widget border-0">
            <div class="mb-3">
                <h5><a href="/member/mypage?mno=${ses.mno }"><i class="ti-settings pe-2"></i>관리자 전용</a></h5>
            </div>
            <ul class="list-discount list-unstyled mb-0">
                <li><a href="/member/list">회원관리</a></li>
                <li><a href="/report/listall/${ses.mno }">신고관리</a></li>
            </ul>
        </div>
    	</c:otherwise>
    	</c:choose>
    </div>
</div>
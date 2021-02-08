<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section class="header">
    <div class="wrap">
        <div class="main_inner">

            <a href="${path}/" class="main_logo"><span class="blind">logo</span></a>
            <div class="main_nav_util clearfix">

                <ul class="main_nav_member">
                	<c:choose>
                		<c:when test="${id == null }">
                		<li><a href="${path}/member/login" class="login">로그인</a></li>
                		<li><a href="${path}/member/registration" class="member">회원가입<span class="s member_point">(회원가입 하시면 1000포인트를 드려요)</span></a></li>
	                    <li><a href="${path}/board/list">게시판</a></li>
	                    <li><span class="blind">검색</span><a href="#a" class="search"><i class="xi-search xi-x"></i></a></li>
	                    <li><span class="blind">장바구니</span><a href="${path}/board/list.do" class="cart"><i class="xi-cart-o xi-x"></i></a></li>
						</c:when>
						<c:otherwise>
                		<li><a href="${path}/member/mypage" class="login"><b>${userName}</b>님</a></li>
                		<li><a href="${path}/member/logout">로그아웃</a></li>
                		<li><a href="${path}/board/list">게시판</a></li>
	                    <li><span class="blind">검색</span><a href="#a" class="search"><i class="xi-search xi-x"></i></a></li>
	                    <li><span class="blind">장바구니</span><a href="${path}/board/list.do" class="cart"><i class="xi-cart-o xi-x"></i></a></li>
						</c:otherwise>
					</c:choose>
                    
                </ul>

                <div class="search_modal">
                    <div class="search_modal_contents">
                        <form action="/joinfolia/goods" method="get">
                            <div class="search_modal_wrap">
                                <div class="title_box">
                                    <h5 class="Black b">검색</h5>
                                    <button type="button" class="search_modal_close"><i class="xi-close-thin xi-2x"></i></button>
                                </div>
                                <span class="search_box">
                                    <input type="text" name="name" id="search" placeholder="검색어를 입력하세요">
                                    <button type="submit"><i class="xi-search xi-2x"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            
            <ul class="main_nav Medium">
                <li><a href="/joinfolia/goods?g_l_code=00009">틸란디시아</a></li>
                <li><a href="/joinfolia/goods?g_l_code=00010">디시디아</a></li>
                <li><a href="/joinfolia/goods?g_l_code=00011">필로덴드론</a></li>
                <li><a href="/joinfolia/goods?g_l_code=00012">기타식물</a></li>
                <li><a href="/joinfolia/goods?g_l_code=00013">소품샵</a></li>
                <li><a href="/joinfolia/goods?g_l_code=00014">이벤트</a></li>
            </ul>
        </div>

    </div>
</section>
<script>
    // menu - search 모달창
    const searchOpen = document.querySelector(".search");
    const searchClose = document.querySelector(".search_modal_close");
    const searchModal = document.querySelector(".search_modal");
    const searchContents = document.querySelector(".search_modal_contents");
   
    searchOpen.addEventListener("click", () =>{
        searchModal.style.display = "block";
        searchContents.style.display = "block";
    });
    searchClose.addEventListener("click", () =>{
        searchModal.style.display = "none";
        searchContents.style.display = "none";
    });

	
</script>

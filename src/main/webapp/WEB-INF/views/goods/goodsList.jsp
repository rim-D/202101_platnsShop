<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<ul class="goods_list">
<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
<!-- "goodList"키의 ArrayList get해서 for문 동작시 방하나의 goodsDTO를 "dto"로 저장, status:인덱스번호 -->
<c:forEach var="goodsDTO" items="${goodsList}" varStatus="status">
	<li>
		<a href="goodsRetrieve?g_code=${goodsDTO.g_code}"> 
		<span class="goods_img_scale">
			<span class="goods_img">
				<img src="${path}/resources/images${goodsDTO.image}">
			</span>
		</span>
		<span class="goods_detail_box">
			<span class="goods_name">${goodsDTO.name}<em>${goodsDTO.memo} 버킨유묘</em></span>
			<span class="goods_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${goodsDTO.price}" /></span>
		</span>
		</a>
	</li>
</c:forEach>
</ul>
<input id="goodsCount" type="hidden" value="${goodsList.size()}" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<ul class="comments_contents">
	<c:forEach var="cDTO" items="${list}">
		<li>
			<c:if test="${cDTO.nickname != null }">
				<span><em class="medium">${cDTO.nickname }</em>${cDTO.create_date}</span>
			</c:if>
			
			<c:if test="${cDTO.nickname == null }">
				<span><em class="medium">${cDTO.name }</em>${cDTO.create_date}</span>
			</c:if>
			<p>${cDTO.c_content }</p>
		</li>
	</c:forEach>
</ul>
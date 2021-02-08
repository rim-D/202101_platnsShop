<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/mypage.css">
</head>
<body>
<!-- HEADER -->
	<jsp:include page="../common/menu.jsp"/>
<!-- MYPAGE 화면 -->
    <section class="mypage">
		<div class="wrap">
			<!-- MemberController 주소 변경 -->
			
			<form action="memberUpdate" method="post" class="mypage_from">
				<h3>내정보</h3>
				<input type="hidden" name="modifier" value="${mDTO.modifier}">
				<div class="input_box">
					<label for="id">아이디</label>
					<input type="text" name="id" id="userid" value="${mDTO.id}">
				</div>
				<div class="input_box">
					<label for="name">이름</label>
					<input type="text" name="name" id="name" value="${mDTO.name}">
				</div>
				<div class="input_box">
					<label for="birth">생년월일</label>
					<input type="text" name="birth" id="birth" value="${mDTO.birth}">
				</div>
				<div class="input_box">
					<label for="post">주소</label>
					<input type="text" name="post" id="postcode" class="input_s" placeholder="" value="${mDTO.post}">
					<input type="text" name="addr1" id="address" placeholder="도로명주소" value="${mDTO.addr1}">
					<input type="text" name="addr2" id="detailAddress" placeholder="지번주소" value="${mDTO.addr2}">
				</div>
				<div class="input_box">
					<label for="phone">전화번호</label>
					<input type="text" name="phone" id="phone" value="${mDTO.phone}">
				</div>
				<div class="update_btn_box">
					<input type="submit" name="submit" id="update_btn" class="btn" value="수정">
					<input type="reset" name="del" id="del" class="btn_white" value="취소">
				</div>
				
			</form>
		</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
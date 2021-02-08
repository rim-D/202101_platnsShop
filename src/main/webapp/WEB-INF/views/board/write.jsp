<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Pragma" content="no-cache">

	<title>게시판 글쓰기</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/board.css">
	<jsp:include page="../common/menu.jsp"/>
</head>
<body>
	<section class="board_wirte">
		<div class="c_wrap">
		
			<h2 class="title f-heavy b">게시판 글쓰기</h2>
			<form action="" class="boardWriteForm">
				<div class="write_box">
					<label for="title">제목</label>
					<input type="text"
						 name="title"  id="title" 
						 placeholder="제목을 입력하세요" value="${bDTO.title}">
				</div>
		
				<textarea cols="120" rows="20"
					name="contents" id="contents" 
					class="write_content" 
					placeholder="내용을 입력하세요">${bDTO.contents}</textarea>
					
				<div class="btn_box">
		
					<input type="hidden" name="no" value=${bDTO.no}> <!-- int값(기본형타입)은 null로 들어가면 안됨 -->
					<input type="hidden" name="creater" value=${bDTO.creater}>
					<input type="hidden" name="create_date" value=${bDTO.create_date}>
					<input type="hidden" name="modifier" value=${bDTO.modifier}>
					<input type="hidden" name="modify_date" value=${bDTO.modify_date}> 
				
					<button class="board_saveBtn btn">확인</button>
					<button type="reset" class="board_resetBtn">취소</button>

					
				</div>
			</form>
		</div>
	</section>
	
	<script>
		// 게시글쓰기 BTN
		const boardWriteForm = document.querySelector(".boardWriteForm");
		const boardSaveBtn =  document.querySelector(".board_saveBtn");
		const no = document.getElementsByName("no")[0]; // name은 중복값이 있기때문에 인덱스지정

		boardSaveBtn.addEventListener('click', (e) => {
			
			if( no.value.length != 0 ){
				boardWriteForm.method = "post";
				boardWriteForm.action = "${path}/board/update";
			} else {
				//no.value = 0; // no를 0으로 셋팅
				no.parentNode.removeChild(no);	//<input type="hidden" name="no" value=${bDTO.no}> 삭제
				boardWriteForm.method = "post";
				boardWriteForm.action = "${path}/board/insert";
			} 
			boardWriteForm.submit();
		}, false);
	</script>

</body>
</html>
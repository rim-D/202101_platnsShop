<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 작성페이지</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/board.css">
	<script src="${path}/resources/js/joinfolia.js"></script>
	<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="../common/menu.jsp"/>
	<section class="board_read">
		<div class="c_wrap">
		
			<h2 class="title f-heavy b">게시판</h2>
			<form class="boardReadForm">
				<table class="board_read_detail_tb">
					<caption class="blind">게시판 상세보기</caption>
					<thead class="s">
						<tr>
							<th scope="row">Title</th>
							<td>${bDTO.title}</td>
						</tr>
						<tr>
							<th scope="row">Name</th>
							<td>${bDTO.name }</td>
						</tr>
						<tr>
							<th scope="row">Date</th>
							<td class="create_date">${bDTO.create_date}<span class="blind">${bDTO.modifier}</span></td>
						</tr>
						<tr>
							<th scope="row">Hits</th>
							<td>${bDTO.hits}</td>
						</tr>
					</thead>
					<tbody>
						<tr class="view">
							<td colspan="2">
								<textarea cols="80" rows="10" name="contents" id="contents" class="write_content">${bDTO.contents }</textarea>
							</td>
						</tr>
					</tbody>

				</table>
				
				<div class="btn_box">
					
					<input type="hidden" name="no" value=${bDTO.no}>
					<input type="hidden" name="title" value=${bDTO.title}>
					<input type="hidden" name="creater" value=${bDTO.creater}>
					<input type="hidden" name="create_date" value=${bDTO.create_date}>
					<input type="hidden" name="modifier" value=${bDTO.modifier}>
					<input type="hidden" name="modify_date" value=${bDTO.modify_date}>
					<input type="hidden" name="hits" value=${bDTO.hits}>

					<button type="button" class="board_listBtn btn btn_white">목록</button>
				<c:if test="${ id == bDTO.creater }">
					<button type="button" class="board_updateBtn btn">수정</button>
					<button type="button" class="board_delBtn btn_gray">삭제</button>
				</c:if> 
				</div>
			</form>
			<!-- 댓글쓰기 -->
			<div class="comments_wrap">
				<h3 class="b">댓글쓰기</h3>
				<div class="comments">
				<c:if test="${!empty userName}">
					<div class="n_name">
						<label for="nickname" class="blind">닉네임</label>
						<input type="text" id="nickname" name="nickname" class="nickName_input s" placeholder="닉네임" value="${userName}">
					</div>
				</c:if>
				<c:if test="${empty userName}">
					<div class="n_name">
						<label for="nickname" class="blind">닉네임</label>
						<input type="text" id="nickname" name="nickname" class="nickName_input s" placeholder="닉네임">
					</div>
				</c:if>
					<div class="comment_write_box clearfix">
						<div class="text_editor left">
							<label class="blind" for="c_content">댓글입력</label>
							<textarea name="c_content" id="c_content"  placeholder="댓글을 달아주세요"></textarea>
						</div>
						<div class="comments_btn_box right">
							<button type="button" class="btn comments_save_btn">등록</button>
						</div>
					</div>
					<!-- 댓글 목록 출력 -->
					<div class="listComment"></div>
				</div>
			</div>
			
		</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../common/footer.jsp"/>
	<script>
		// 댓글쓰기
		listComment("1");
		const commentsSaveBtn = document.querySelector(".comments_save_btn");
		commentsSaveBtn.addEventListener('click', (e) => {
			const nickname = document.getElementById("nickname").value;
			const c_content = document.getElementById("c_content").value;
			const no = "${bDTO.no}";
			const param = { "nickname": nickname, "c_content": c_content, "no": no };
			console.log(c_content, no, param);
			$.ajax({
				type: "post",
				url: "${path}/comments/insert",
				data: param,
				beforeSend: function(xmlHttpRequest){
					/* 
						beforeSend 부분에 헤더값을 추가해 주었고, 
						e.status로 400이라는 코드값에 대한 처리를 작성
					*/
					xmlHttpRequest.setRequestHeader("AJAX","true");
				},
				success: function(){
					listComment("1");
				},
				error: function(e){
					if(e.resultCode == 300){
						alert(returnData.resultMsg);
					}
					if(e.status == 400){
						alert("로그인이 필요로합니다.");
						location.href = "${path}/member/login?msg=nologin";
					}
				}
			})
		}, false);

		// 댓글 목록
		function listComment(num){
			$.ajax({
				type: "get",
				url: "${path}/comments/list?no=${bDTO.no}&curPage="+num,
				success: function(result){
					document.querySelector(".listComment").innerHTML = result;
				}
			})
		}
		
		// 날짜변환 (YYYY/MM/DD)
		const createDate = document.querySelector('.create_date');
		createDate.innerText = joinfolia.DateFormatter(createDate.innerText);
		
		// 목록보기 BTN
		const boardListBtn =  document.querySelector(".board_listBtn");
		boardListBtn.addEventListener('click', (e) => {
			location.href ="${path}/board/list?curPage=${curPage}&search_option=${search_option}&keyword=${keyword}";
		}, false);
		
		// 게시글수정 BTN
		const boardReadForm = document.querySelector(".boardReadForm");
		const boardUpdateBtn =  document.querySelector(".board_updateBtn");
		boardUpdateBtn.addEventListener('click', (e) => {
			boardReadForm.method = "post";
			boardReadForm.action = "${path}/board/modify";
			boardReadForm.submit();
		}, false);
		
		// 게시글삭제 BTN
		const boardDelBtn =  document.querySelector(".board_delBtn");
		boardDelBtn.addEventListener('click', (e) => {
			boardReadForm.method = "post";
			boardReadForm.action = "${path}/board/delete";
			boardReadForm.submit();
		}, false);
		

	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/board.css">
	<script src="${path}/resources/js/joinfolia.js"></script>
	<jsp:include page="../common/menu.jsp"/>
</head>
<c:if test="${msg == 'success' }">
	<script>
		alert("게시글이 수정되었습니다.");
	</script>
</c:if>
<body>
	<section class="board">
		<div class="c_wrap clearfix">
		
			<h2 class="title f-heavy b">게시판</h2>
			<form method="get" action="${path}/board/list" id="boardSearch">
				<select name="search_option" class="s">
					<option value="all">이름+제목+내용</option>
					<option value="name">이름</option>
					<option value="title">제목</option>
					<option value="contents">내용</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력해주세요" class="board_search s" value="${map.keyword}">
				<button type="submit" class="board_searchBtn btn_gray">검색</button>
			</form>
			<table>
				<colgroup>
					<col width="5%">
					<col width="60%">
					<col width="10%">
					<col width="20%">
					<col width="5%">
				</colgroup>
				<tr>
					<th>NO.</th>
					<th>제목</th>
					<th>작성이</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			<c:forEach var="bDTO" items="${map.list}">
				<tr>
					<td>${bDTO.no}</td>
					<td>
						<!-- 페이지, 검색옵션, 키워드를 같이 보내줘야지만 페이지나 검색이 풀리지않음 -->
						<a href="${path}/board/read?curPage=${map.pager.curPage}&no=${bDTO.no}&search_option=${map.search_option}&keyword=${map.keyword}">
						${bDTO.title} 
						<c:if test="${bDTO.cnt > 0 }">
						<span class="boardComments_point">[ ${bDTO.cnt} ]</span>
						</c:if>
						</a>
					</td>
					<td>${bDTO.name }</td>
					<td class="date">${bDTO.create_date}</td>
					<td>${bDTO.hits}</td>
				</tr>
			</c:forEach>
			</table>
			<!-- 페이지 네비게이션 -->
			<ul class="page_nav">
			<c:if test="${map.pager.curBlock > 1}">
				<li><a href="javascript:list('1')">[처음]</a></li>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<li><a href="javascript:list('${map.pager.prevPage}')">[이전]</a></li>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage }">
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:list('${num }')">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totalBlock}">
				<li><a href="javascript:list('${map.pager.nextPage}')">[다음]</a></li>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totalPage}">
				<li><a href="javascript:list('${map.pager.totalPage}')">[끝]</a></li>
			</c:if>
			</ul>
			<button type="button" class="board_writeBtn btn right"> 글쓰기</button>
		</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../common/footer.jsp"/>
	<script>
		// 글쓰기 버튼
		const writeBtn = document.querySelector('.board_writeBtn');
		writeBtn.addEventListener('click', (e) => {
			location.href ="${path}/board/write";
		}, false);
		
		// 날짜변환 (YYYY/MM/DD)
		const boardDate = document.querySelectorAll('.date');
		boardDate.forEach(function(e){
			e.innerText = joinfolia.DateFormatter(e.innerText);
		});

		function list(page){
			location.href = '${path}/board/list?curPage=' + page +
								'&search_option=${map.search_option}' +
								'&keyword=${map.keyword}';
		}
	</script>		
	
</body>
</html>
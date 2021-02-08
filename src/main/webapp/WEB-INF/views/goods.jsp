<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Joinfoila메인페이지</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/goods.css">
	<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="${path}/resources/js/joinfolia.js"></script>
</head>
<body>
	<!-- HEADER --> 
	<jsp:include page="common/menu.jsp"/>

	<section class="goods">
		<div class="wrap">
			
			<div class="goods_list_wrap clearfix">
				<c:if test="${g_l_code eq '00009'}">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
					<h2>틸란디시아 반려식물</h2>
				</div>
				<p class="goods_count">상품 0개</p>
				</c:if>
				<c:if test="${g_l_code eq '00010'}">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
					<h2>디시디아 반려식물</h2>
				</div>
				<p class="goods_count">상품 0개</p>
				</c:if>
				<c:if test="${g_l_code eq '00011'}">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
					<h2>필로덴드론 반려식물</h2>
				</div>
				<p class="goods_count">상품 0개</p>
				</c:if>
				<c:if test="${g_l_code eq '00012'}">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
					<h2>기타식물</h2>
				</div>
				<p class="goods_count">상품 0개</p>
				</c:if>
				<c:if test="${g_l_code eq '00013'}">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
					<h2>소품샵</h2>
				</div>
				<p class="goods_count">상품 0개</p>
				</c:if>
				<c:if test="${g_l_code eq '00014'}">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
					<h2>이벤트</h2>
				</div>
				<p class="goods_count">상품 0개</p>
				</c:if>
				<ul class="goods_sort">
					<li>
						<input type="radio" value="1" name="sort" id="recive_date">
						<label for="recive_date" class="on">등록일순</label>
					</li>
					<li>
						<input type="radio" value="2" name="sort" id="goods_name">
						<label for="goods_name">이름순</label>
					</li>
					<li>
						<input type="radio" value="3" name="sort" id="goods_h_price">
						<label for="goods_h_price">높은가격순</label>
					</li>
					<li>
						<input type="radio" value="4" name="sort" id="goods_l_price">
						<label for="goods_l_price">낮은가격순</label>
					</li>
					<li>
						<input type="radio" value="5" name="sort" id="hits">
						<label for="hits">인기순</label>
					</li>
				</ul>
				<!-- goods/goodsList.jsp에서 상품출력 -->
				<div class="goods_list_box"></div>
			</div>

		</div>
	</section>
	<script>
		// goods/goodsList.jsp에서 상품출력
		joinfolia.getGoodsList("${path}", "${g_l_code}", "1", "${name}");
	
		document.querySelectorAll(".goods_sort li label").forEach(function(item){
			item.addEventListener("click", function(e){
				removeSortChecked();
				e.target.classList.add("on");
				let num= e.target.previousSibling.previousSibling.value;
				joinfolia.getGoodsList("${path}", "${g_l_code}", num);
			});
		}); 

		function removeSortChecked() {
			document.querySelectorAll(".goods_sort li label").forEach(function(item){
				item.classList.remove("on");
			}); 
		};

		
	</script>

	<!-- FOOTER -->
	<jsp:include page="common/footer.jsp"/>
</body>
</html>
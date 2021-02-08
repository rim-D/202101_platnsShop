<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Joinfoila메인페이지</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="${path}/resources/css/font.css">
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/main.css">
<link rel="stylesheet" href="${path}/resources/css/goods.css">
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/joinfolia.js"></script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="common/menu.jsp" />

	<section class="goodsRetrieve">
		<div class="wrap">
			<form name="goodRetrieveForm" method="GET" class="good_retrieve">
				<!-- hidden  tag생성 -->
				<!-- 화면에는 보이지 않고 정보만 넘겨주는 역할 hideen -->
				<%-- 	<input type="hidden" name="gImage" value="${goodsRetrieve.gImage}">
				<input type="hidden" name="gCode" value="${goodsRetrieve.gCode}">
				<input type="hidden" name="gName" value="${goodsRetrieve.gName}">
				<input type="hidden" name="gPrice" value="${goodsRetrieve.gPrice}"> --%>
				<div class="goodsRetrieve_box">
					<div class="goodsRetrieve_cover">
						<img src="${path}/resources/images${goodsDTO.image}" />
					</div>

					<div class="goodsRetrieve_description">
						<div class="goodsRetrieve_title">
							<div class="icons">
								<img src="${path}/resources/images/icon_201809202124583100.gif" alt="BEST"> 
								<img src="${path}/resources/images/icon_201809202125035400.gif" alt="NEW">
							</div>
							<h2 class="black">${goodsDTO.name}</h2>
						</div>

						<div class="goodsRetrieve_info clearfix">
							<dl>
								<dt>상품설명</dt>
								<dd>
									<strong class="g_memo">가느다란 은빛 잎과 유려한 수형이 매력적인 올리브 나무입니다.</strong>
								</dd>
							</dl>
							<dl>
								<dt>판매가</dt>
								<dd>
									<strong class="g_price">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${goodsDTO.price}" />
									</strong>
								</dd>
							</dl>
							<dl>
								<dt>
									<label for="delivery_price">배송비</label>
								</dt>
								<dd>
									<select name="delivery_price" id="delivery_price">
										<option value="선결제" selected>주문시 결제(선결제)</option>
										<option value="후결제">수령시 결제(착불)</option>
									</select>

								</dd>
							</dl>
							<dl>
								<dt>
									<label for="g_size">사이즈</label>
								</dt>
								<dd>
									<select class="select_change" size="1" name="gSize" id="gSize">
											<option value="사이즈선택">사이즈선택</option>
										<c:forEach var="sizeOptions" items="${goodsOptions}">
											<option value="${sizeOptions.code_name}">${sizeOptions.code_name}</option>
										</c:forEach>
									</select>
								</dd>
							</dl>
							<dl>
								<dt>
									<label for="gColor">color</label>
								</dt>
								<dd>
									<select class="select_change" size="1" name="gColor"
										id="gColor">
										<option selected value="색상선택">색상선택</option>
										<option value="navy">navy</option>
										<option value="black">black</option>
										<option value="ivory">ivory</option>
										<option value="white">white</option>
										<option value="gray">gray</option>
									</select>
								</dd>
							</dl>
							<dl>
								<dt>재고 수량</dt>
								<dd class="quantity">
									<input type="text" name="quantity" id=quantity value="${goodsDTO.quantity}">
								</dd>
							</dl>
							<dl>
								<dt>선택 수량</dt>
								<dd class="order-btn">
									<input type="text" name="gAmount" id="gAmount" class="number"
										value="1">
									<button type="button" class="increase">+</button>
									<button type="button" class="decrease">-</button>
								</dd>
							</dl>
						</div>
						<div class="btn-area">
							<button type="submit" class="btn buy-btn"
								onclick="reqCheck('order')">구매하기</button>
							<button type="submit" class="btn_gray cart-btn">장바구니담기</button>
						</div>
					</div>
				</div>

			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="common/footer.jsp" />
	<script>
		// 숫자 추가 삭제 버튼
		const number = document.querySelector('.number');
		const increase = document.querySelector('.increase');
		const decrease = document.querySelector('.decrease');
		
		
		increase.onclick = () => {
		    const current = parseInt(number.value);
		    number.value = current + 1;
		};
		
		decrease.onclick = () => {
		    const current = parseInt(number.value);
		    if (current > 1) {
		        number.value = current - 1;
		    } else {
		        alert('최소주문량은 1개입니다.');
		    }
		    
		};
	</script>
	
</body>
</html>
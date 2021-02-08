<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:if test="${msg == 'logout' }">
	<script>
		alert('로그아웃되었습니다');
	</script>
</c:if>
<c:if  test="${msg == 'success'}">
	<script>
		alert('로그인 되었습니다');
	</script>
</c:if >
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Joinfoila메인페이지</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/goods.css">
	<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="${path}/resources/js/slick.js" defer></script>
	<script type="text/javascript" src="${path}/resources/js/joinfolia.js"></script>
</head>
<body>
	<!-- HEADER --> 
	<jsp:include page="common/menu.jsp"/>
	
	<!-- main -->
    <div class="main">

        <div class="main_cover main_cover_1">
        
                <div class="main_desc">
                    <h2 class="main_title medium">필로덴드론<span>글리오섬</span></h2>
                    <p class="main_title_sub">NEW PLANTS<span>시선집중! 글리오섬!<br>심플하고 고급스러운 잎모양과 다양한 색상이 매력적!</span></p>
                    <button class="main_btn main_btn_v1" type="button">
                        <span class="btn_text">보러가기</span>    
                    </button>
                </div>

        </div>
        <div class="main_cover main_cover_2">
 
                <div class="main_desc">
                    <h2 class="main_title medium">나만의<span>희귀 유묘들</span></h2>
                    <p class="main_title_sub">NEW PLANTS<span>유묘 때부터 애정담아 키우는<br>나만의 반려식물을 맞이 해보세요</span></p>
                    <button class="main_btn main_btn_v2" type="button">
                        <span class="btn_text">보러가기</span>    
                    </button>
                </div>

        </div>

    </div>

	<section class="goods">
		<div class="wrap">
			
			<div class="goods_list_wrap">
				<div class="goods_list_tit heavy">
					<span class="goods_list_subtit light">프로 식물집사의 비밀</span>
					<h2>가드닝 제품 BEST</h2>
				</div>
				<ul class="goods_list">
				<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
				<!-- "goodList"키의 ArrayList get해서 for문 동작시 방하나의 goodsDTO를 "dto"로 저장, status:인덱스번호 -->
			<%-- 	<c:forEach var="dto" items="${goodsList}" varStatus="status"> --%>
					<li>
						<a href="goodsRetrieve?g_code=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/acc/8구 플라스틱 분.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">8구 플라스틱 분<em>8구 플라스틱 분</em></span>
							<span class="goods_price">10,500</span>
						</span>
						</a>
					</li>
					<li>
						<a href="goodsRetrieve?g_code=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/acc/디자인화분 유디팟.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">디자인화분 유디팟<em>디자인화분 유디팟</em></span>
							<span class="goods_price">8,500</span>
						</span>
						</a>
					</li>
					<li>
						<a href="goodsRetrieve?gCode=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/acc/빈티지 4각 우드 행잉.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">빈티지 4각 우드 행잉<em>빈티지 4각 우드 행잉</em></span>
							<span class="goods_price">8,000</span>
						</span>
						</a>
					</li>
					<li>
						<a href="goodsRetrieve?gCode=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/acc/빈티지 8각 우드 행잉.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">빈티지 8각 우드 행잉<em>빈티지 8각 우드 행잉</em></span>
							<span class="goods_price">10,500</span>
						</span>
						</a>
					</li>
	<%-- 			</c:forEach> --%>
				</ul>
			</div>
			
			
			<div class="goods_list_wrap">
				<div class="goods_list_tit heavy">
				<span class="goods_list_subtit light">많은 식물집사들의 사랑을 받은</span>
				<h2>인기 반려식물</h2>
				</div>
				<ul class="goods_list">
				<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
				<!-- "goodList"키의 ArrayList get해서 for문 동작시 방하나의 goodsDTO를 "dto"로 저장, status:인덱스번호 -->
			<%-- 	<c:forEach var="dto" items="${goodsList}" varStatus="status"> --%>
					<li>
						<a href="goodsRetrieve?gCode=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/phiodendron/싱고니움 핑크.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">싱고니움 핑크<em>싱고니움 핑크</em></span>
							<span class="goods_price">8,000</span>
						</span>
						</a>
					</li>
					<li>
						<a href="goodsRetrieve?gCode=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/etcPlants/알로카시아 드래곤 스케일(유묘).jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">알로카시아 드래곤 스케일(유묘)<em>알로카시아 드래곤 스케일(유묘)</em></span>
							<span class="goods_price">28,000</span>
						</span>
						</a>
					</li>
					<li>
						<a href="goodsRetrieve?gCode=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/etcPlants/스킨답서스 픽터스 실버리안.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">스킨답서스 픽터스 실버리안<em>스킨답서스 픽터스 실버리안</em></span>
							<span class="goods_price">12,500</span>
						</span>
						</a>
					</li>
					<li>
						<a href="goodsRetrieve?gCode=${dto.gCode}"> 
						<span class="goods_img_scale">
							<span class="goods_img">
								<img src="${path}/resources/images/plants/phiodendron/싱고니움 스노우 화이트.jpg">
							</span>
						</span>
						<span class="goods_detail_box">
							<span class="goods_name">싱고니움 스노우 화이트<em>싱고니움 스노우 화이트</em></span>
							<span class="goods_price">53,500</span>
						</span>
						</a>
					</li>
	<%-- 			</c:forEach> --%>
				</ul>
			</div>
			
		</div>
	</section>
	<script type="text/javascript">
		document.querySelectorAll(".goods_price").forEach(function(span){
			span.innerText = com.comma(span.innerText);
		});
	</script>

	<!-- FOOTER -->
	<jsp:include page="common/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <section class="footer">
		<div class="wrap">
		    <div class="foot_logo">
				<img src="${path}/resources/images/logo_off.png"  alt="하단로고" title="하단로고"   />    
			</div>
		    <div class="foot_list">
		        <ul>
		            <li><a href="#a">회사소개</a></li>
		            <li><a href="#a">이용약관</a></li>
		            <li><a href="#a"><strong>개인정보처리방침</strong></a></li>
		            <li><a href="#a">이용안내</a></li>
		        </ul>
		        <ul>
		            <li>고객센터</li>
		            <li>02-000-0000</li>      
		            <li>평일
						10:00 ~ 12:00
						13:00 ~ 18:00<br />
						- 업무 외 시간에는 '1:1 문의' 이용을 부탁드립니다.</li>
		        </ul>
		        <ul>
		            <li>BANK INFO</li>
		            <li>IBK기업은행</li>
		            <li>000-00000-000-0000</li>
		            <li>(주)미림</li>
		        </ul>
		        <ul>
		            <li>커뮤니티</li>
		            <li><a href="#a">룩북</a></li>   
					<li><a href="#a">상품후기</a></li>
		            <li><a href="#a">Q/A</a></li>
				  	<li><a href="#a">공지사항</a></li>
		        </ul>
		    </div>
		
		    <div class="foot_sns">
		        <span class="foot_sns_logo"><i class="xi-instagram xi-2x"></i></span>
		        <span class="foot_sns_logo"><i class="xi-facebook-official xi-2x"></i></span>
		        <span class="foot_sns_logo"><i class="xi-twitter xi-2x"></i></span>
		    </div>
		
		    <div class="foot_cont">        
		        <div class="foot_info clearfix">
		            <address>
		                <strong>(주)박미림</strong>
		                <span>서울특별시 어디구 어디로 어디건물 000-0000</span>
		            </address>
		            <div class="foot_info_list">
		                <dl>
		                    <dt>대표 :</dt>
		                    <dd>박미림</dd>
		                </dl>
		                <dl>
		                    <dt>사업자등록번호 :</dt>
		                    <dd>000-00-00000 <a href="#" class="btn_licensee_info" onclick="gd_popup_bizInfo('8518801176'); return false;">사업자번호조회 ></a></dd>
		                </dl>
		                <dl>
		                    <dt>통신판매업신고번호 :</dt>
		                    <dd>1111-어딘가-1111</dd>
		                </dl>
		                <dl>
		                    <dt>개인정보관리자 :</dt>
		                    <dd>박미림</dd>
		                </dl>            
		                <dl>
		                    <dt>대표번호 :</dt>
		                    <dd><strong>02-0000-0000</strong></dd>
		                </dl>
		                <dl>
		                    <dt>팩스번호 :</dt>
		                    <dd>02-0000-0000</dd>
		                </dl>
		                <dl>
		                    <dt>메일 :</dt>
		                    <dd><a href="mailto:winwin486@naver.com" class="btn_email">winwin486@naver.com.</a></dd>
		                </dl>
		                <dl>
		                    <dt class="blind">호스팅</dt>
		                    <dd>호스팅제공 : 미림(주)</dd>
		                </dl>
		            </div>
		            <p class="copyright">copyright (c) <strong>ParkMiRim</strong> all rights reserved.</p>
		        </div>
		        <div class="foot_certify">        
			        <span><img src="${path}/resources/images/logo_visa.png"></span>
			        <span><img src="${path}/resources/images/logo_mc.png"></span>       
		    	</div>
		    </div>
		</div>
    </section>
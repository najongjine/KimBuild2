<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
});
</script>
<%-- content --%>
<div class="content_box">
	<h4 class="bs_tit">김건축 사무소<span></span></h4>
	<p class="bs_txt">국내 목조주택 시장에서 15년의 전통과 노하우를 가지고 있는 김건축 사무소는<br />주택 건축에 대한 설계·시공·인테리어 전반에 걸쳐 종합 솔루션을 제공하는 선두기업입니다.</p>
	<h4 class="hidden">비지니스 컨텐츠 박스</h4>
	<div class="bs_wrap">
		<div class="bs_img_box bs_img_box1">
			<div class="img_zone">
				<h5 class="img_txt">설계<span></span></h5>
				<p>- 맞춤형 주택 설계</p>
			</div>
		</div>
		<div class="bs_txt_box bs_txt_box1">
			<div><span>icon</span></div>
			<p>여러 구조의 주택 시안을 제공하며<br />
			고객님이 원하시는 구조로 맞춤설계해드립니다.</p>
		</div>
		<div class="bs_txt_box bs_txt_box2">
			<div><span>icon</span></div>
			<p>건축주님을 위해 건축에 관련한<br />모든 까다로운 절차를 대행해드립니다.
		</div>
		<div class="bs_img_box bs_img_box2">
			<div class="img_zone">
				<h5 class="img_txt">인허가<span></span></h5>
				<p>- 건축 인가 · 허가</p>
			</div>
		</div>
		<div class="bs_img_box bs_img_box3">
			<div class="img_zone">
				<h5 class="img_txt">시공 · 분양<span></span></h5>
				<p>- 맞춤형 주택 설계</p>
			</div>
		</div>
		<div class="bs_txt_box bs_txt_box3">
			<div><span>icon</span></div>
			<p>최대한 건축주님의 일정에 맞추어<br /> 주택을 시공 · 분양합니다.</p>
		</div>
	</div>
</div>


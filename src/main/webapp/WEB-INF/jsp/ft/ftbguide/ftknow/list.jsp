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
	<h4 class="small_tit">개요</h4>
	<p class="intro">목조 주택은 많은 장점을 가지지만 단점 또한 가지고 있습니다. 고로 목재의 특성과 단점을 잘 인식하여 장점을 살리고 단점을 주의 · 보완하여 시공을 해야 합니다. 다음은 목조 주택 시공시 알아두면 좋은 주의사항들입니다.</p>
	<h4 class="small_tit">시공시 주의사항</h4>
	<div class="caution_list">
		<div class="caution caution1">
			<p class="caution_img"></p>
			<p class="caution_txt"><span>1</span>반드시 줄 기초를 하고(각 지역별 동결심도준수) 지면에서 50cm ~ 100cm 정도 높여서 토대 시공을 해야 합니다. 또한 지면에서 수분을 멀리 해야 합니다.</p>
		</div>
		<div class="caution caution2">
			<p class="caution_img"></p>
			<p class="caution_txt"><span>2</span>토대는 6X6(15cmX15cm) 햄퍼 방무목으로 해야 하는데 대부분 시공사들이 건축비 부담으로 2X6(5cmX15cm) S.P.F 방무목으로 시공합니다. 그런 경우 15년 후에는 습하고 통풍이 안된 곳은 거의 다 썩고 부패되고 맙니다.</p>
		</div>
		<div class="caution caution3">
			<p class="caution_img"></p>
			<p class="caution_txt"><span>3</span>스터드나 서까래 간격은 미국 기준 16인치(40cm)입니다. 일부 시공사들이 24인치(60cm) 시공을 하고 있으나 건물 수명이나 견고성과 지진에서 16인치가 강합니다.</p>
		</div>
		<div class="caution caution4">
			<p class="caution_img"></p>
			<p class="caution_txt"><span>4</span>건물 외벽에는 기능성 자재인 타이백 시공을 하는데, 유사품은 기능성이 없습니다. 목재가 건축물의 습기기능을 다하지 못하여 보강하는 자재인데 제 기능을 못하는 제품은 건축물이 통풍이 되지 않아 구조재가 부패되어 건물 수명이 짧습니다.</p>
		</div>
		<div class="caution caution5">
			<p class="caution_img"></p>
			<p class="caution_txt"><span>5</span>요즘 우리나라 주택 디자인은 너무나도 멋있고 아름답게 시공하는데 세계최고 수준입니다. 그런데 문제는 주택이 통풍이 하나도 되지 않게 시공한다는 것입니다.</p>
		</div>
		<div class="caution caution6">
			<p class="caution_img"></p>
			<p class="caution_txt"><span>6</span>화재에 약합니다. 반드시 불연성 석고보드를 사용하고 시공시 나사못으로 시공하여 시공된 나사못 머리는 반드시 석고 컴파운드로 메꾸어 주어야 합니다.</p>
		</div>
	</div><!-- //caution_list -->
</div>


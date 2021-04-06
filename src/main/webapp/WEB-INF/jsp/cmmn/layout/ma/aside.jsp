<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:forEach var="menu" items="${mgrMenu }">
	<c:if test="${util:getMenuCd(url).depth1 eq menu.menuCd }">
	<c:set var="depth1" value="${menu.menuNm }"/>
	<c:set var="depth1Cd" value="${menu.menuCd }"/>
	<c:set var="menuList" value="${menu.menuList }"/>
	</c:if>
</c:forEach>

<script type="text/javaScript">
</script>
<div id="left_content">
	<div class="lnb_wrap">
		<h2><strong>${depth1 }</strong></h2>
		<div id="lnb">
			<ul>
				<c:forEach var="menuSub" items="${menuList }">
					<c:if test="${util:getMenuCd(url).depth2 eq menuSub.menuCd }">
					<c:set var="depth2" value="${menuSub.menuNm }"/>
					<c:set var="depth2Cd" value="${menuSub.menuCd }"/>
					<c:set var="depth2Url" value="${menuSub.url }"/>
					</c:if>
					<li class="${not empty menuSub.menuList ? 'has_sub' : '' } ${util:getMenuCd(url).depth2 eq menuSub.menuCd ? 'open' : ''}">
						<a href="${not empty menuSub.menuList ? '#' : menuSub.menuCd eq 'cs' ? 'https://analytics.google.com/analytics/web/?hl=ko&pli=1#/report-home/a157536003w221711255p210735021' : menuSub.url }" ${menuSub.menuCd eq 'cs' ? 'target="_blank"' : '' } >${menuSub.menuNm }</a>
						<c:if test="${not empty menuSub.menuList }">
							<ul ${util:getMenuCd(url).depth2 eq util:getMenuCd(menuSub.url).depth2 ? 'style="display:block;"' : ''}>
								 <c:forEach var="menuSub2" items="${menuSub.menuList }">
									 <li><a href="${menuSub2.url }" ${util:getMenuCd(url).depth3 eq menuSub2.menuCd ? 'class="on"' : '' }>${menuSub2.menuNm } </a> </li>
									 <c:if test="${util:getMenuCd(url).depth3 eq menuSub2.menuCd }">
										<c:set var="depth3" value="${menuSub2.menuNm }"/>
									 </c:if>
								 </c:forEach>
							</ul>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>	
</div>
 <div id="right_content">
	<div class="top_title clear">
		<h3 class="tit_page">${not empty depth3 ? depth3 : not empty depth2 ? depth2 : depth1 }</h3>
		<div class="location">
			<i class="home"><span>홈으로</span></i> <span>&gt; ${depth1 }</span> 
			<c:if test="${not empty depth2 }"><span> &gt; ${depth2 }</span></c:if>
			<c:if test="${not empty depth3 }"><span> &gt; ${depth3 }</span></c:if>
		</div>
	</div>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:forEach var="menu" items="${ftMenu }">
	<c:if test="${util:getMenuCd(url).depth1 eq menu.menuCd }">
	<c:set var="depth1" value="${menu.menuNm }"/>
	<c:set var="depth1Cd" value="${menu.menuCd }"/>
	<c:set var="menuList" value="${menu.menuList }"/>
	</c:if>
</c:forEach>

<script type="text/javaScript">
</script>
<div id="left_cont">
	<h3 class="lnb_tit">${not empty depth1 ? depth1 : altTitle}</h3>
	<ul class="lnb">
		<c:forEach var="menuSub" items="${menuList }">
			<c:if test="${util:getMenuCd(url).depth2 eq menuSub.menuCd }">
				<c:set var="depth2" value="${menuSub.menuNm }"/>
				<c:set var="depth2Cd" value="${menuSub.menuCd }"/>
				<c:set var="depth2Url" value="${menuSub.url }"/>
			</c:if>
			<li class="${not empty menuSub.menuList ? 'has_sub' : '' } ${util:getMenuCd(url).depth2 eq menuSub.menuCd ? 'active' : ''} ${menuSub.notRdy eq 'Y' ? 'notRdy' : ''}">
				<a href="${menuSub.url}" ${menuSub.menuCd eq 'cs' ? 'target="_blank"' : '' }>${menuSub.menuNm }</a>
				<c:if test="${not empty menuSub.menuList }">
					<ul ${util:getMenuCd(url).depth2 eq util:getMenuCd(menuSub.url).depth2 ? 'style="display:block;"' : ''}>
					</ul>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</div>
<div id="right_cont">
	<h4 class="page_title">${not empty depth3 ? depth3 : not empty depth2 ? depth2 : depth1 }</h4>
	<div class="location">
		<a href="#"><i class="fa fa-home"></i></a> 
		<c:if test="${not empty depth1 }"><span> &gt; ${depth1 }</span></c:if>
		<c:if test="${not empty depth2 }"><strong> &gt; ${depth2 }</strong></c:if>
	</div>
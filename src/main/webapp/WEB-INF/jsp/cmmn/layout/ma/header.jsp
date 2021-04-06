<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<header id="header">
	<div class="header_box">
		<h1 class="logo">
			<a href="/ma/sys/mn/list.do">사이트 로고</a>
		</h1>
		<!-- GNB -->
		<div id="gnb_area">
			<nav id="gnb">
				<ul class="gnb clear">
					<c:forEach var="result" items="${mgrMenu }" varStatus="status" >
						<li ${util:getMenuCd(url).depth1 eq result.menuCd ? 'class="on"' : '' }>
							<a href="${result.url }" >${result.menuNm }</a>
						</li>
					</c:forEach>
				</ul>
			</nav>
		</div>
		<!-- //GNB -->
		<div class="util_box">
			<span class="user_info">
				<strong>${loginMgrNm}</strong> [ <strong>${loginMgrId }</strong> ] 님
				<a href="/logout.do" class="btn_logout"><strong>로그아웃</strong></a>
			</span>
			<a href="/ma/sys/mn/list.do" class="go_homepage">홈페이지</a>
		</div>
	</div>
</header>
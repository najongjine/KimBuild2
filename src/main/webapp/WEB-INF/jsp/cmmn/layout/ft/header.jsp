<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javaScript">
$(document).ready(function(){
	$(".notRdy").on("click",function(){
		alert("준비중입니다")
		return false
	})
});
var checkLoggedIn=function(){
	if(!'${loginFtSeq}'){
		alert("로그인을 해주세요")
		return false
	}
	fncPageBoard('write','insertForm.do')
	return false
}
</script>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<div class="gnb_bg"></div>
<header id="header">
	<div class="header_box">
		<h1 class="logo"><a href="/"><img src="/publish/ft/images/common/logo.png" alt="김건축사무소"/></a></h1>
		<div class="util_box">
			<ul class=" clear">
				<li><a href="/">HOME</a></li>
				<c:choose>
					<c:when test="${not empty loginFtId}">
						<li>${loginFtId}</li>
						<li><a href="/ft/logout.do">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/ft/login.do">로그인</a></li>
						<li><a href="/ft/register.do">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				
				<li class="notRdy"><a href="#"><i class="fa fa-star"></i>즐겨찾기</a></li>
			</ul>
		</div>
	</div>
	<!-- GNB -->
<h2 class="hidden">주메뉴</h2>
<div id="gnb_area">
	<nav id="gnb">
		<ul class="depth2 clear">
			<c:forEach var="result" items="${ftMenu }" varStatus="status" >
				<li class="${util:getMenuCd(url).depth1 eq result.menuCd ? 'on' : '' } ${result.notRdy eq 'Y' ? 'notRdy' : ''}" 
				 <c:if test="${result.hide eq 'Y'}">style="display:none;"</c:if> >
					<a href="${result.url }">${result.menuNm }</a>
					<ul class="depthBox">
						<c:forEach var="subresult" items="${result.menuList }" varStatus="status" >
							<li class="${subresult.notRdy eq 'Y' ? 'notRdy' : ''}"><a href="${subresult.url }">${subresult.menuNm }</a></li>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</nav>
</div>
<!-- //GNB -->
</header>
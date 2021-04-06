<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncSiteSelGet('schEtc04','2','${searchVO.schEtc04}');
	fncDate('searchStartDate','searchEndDate');
	
	setTimeout(function(){fncPageBoard('addList','addList.do',$("#pageIndex").val());},100);
});
</script>
<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<form:hidden path="pageIndex" id="pageIndex" />
			<form:hidden path="schPageUnit" id="schPageUnit" />
			<form:hidden path="boardDivn" id="boardDivn" />
			<form:hidden path="boardCd" id="boardCd" />
			<input type="hidden" id="boardSeq" name="boardSeq"/>
			<input type="hidden" id="boardGrpSeq" name="boardGrpSeq"/>
			<input type="hidden" id="schEtc09" name="schEtc09" value="ma"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<c:if test="${searchVO.boardCd ne 'bd01' && searchVO.boardCd ne 'bd02' && searchVO.boardCd ne 'bd03'}">
						<strong class="tit">사이트구분</strong>			
						<form:select path="schEtc04" id="schEtc04" title="상태 선택" cssClass="selec" cssStyle="width:132px;">
							<form:option value="" label="전체"/>
						</form:select>
					</c:if>
					<c:if test="${searchVO.boardCd eq 'bd01' }">
						<strong class="tit">년도</strong>
						<form:select path="schEtc01" id="schEtc01" title="구분 선택" cssClass="w100"  >  
							<form:option value="" label="전체"/>
							<c:forEach var="i" begin="0" end="${year-2011}">
							    <c:set var="yearOption" value="${year-i}" />
							    <form:option value="${yearOption }" label="${yearOption }"/>
							</c:forEach>
						</form:select>
					</c:if>
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text ${searchVO.boardCd eq 'bd04' or searchVO.boardCd eq 'bd05' or searchVO.boardCd eq 'bd09' ? 'w30p':'w50p'}" />
					<c:if test="${searchVO.boardDivn eq '1' }">
						<strong class="tit">기간 검색</strong>
						<form:select path="dateCondition" id="dateCondition" cssClass="w100"  >  
							<form:option value="0" label="등록일"/>
							<form:option value="1" label="공지날짜"/>
						</form:select>
						<span class="calendar_input"><form:input path="searchStartDate" id="searchStartDate"  cssClass="text w100" readonly="true" /></span>
						<span class="input_wave">~</span>
						<span class="calendar_input" ><form:input path="searchEndDate" id="searchEndDate"  cssClass="text w100" readonly="true" /></span>
					</c:if>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>


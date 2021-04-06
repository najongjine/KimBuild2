<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
});  
</script>
<div class="content_box">
	<%-- search --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="menuSeq" name="menuSeq" />
			<input type="hidden" id="menuGroupSeq" name="menuGroupSeq" />
			<input type="hidden" id="lvl" name="lvl" value="1">
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">구분</strong>								
					<form:select path="schEtc03" id="schEtc03" cssClass="w100">  
						<form:option value="" label="전체"/>
						<form:option value="ma" label="관리자"/>
						<form:option value="ft" label="사용자"/>
					</form:select>
					<strong class="tit">검색구분</strong>								
					<form:select path="searchCondition" id="searchCondition" cssClass="w100">  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="메뉴명"/>
						<form:option value="2" label="메뉴ID"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword"  cssClass="text w70p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%-- //search --%>
	<%-- tbl --%>
	<div class="tbl">
	</div>
</div>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i> <span> 전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록(순번,승인상태,점검구분,한전사업소,점검일자,전산화번호 등으로 구성)</caption> 
		<colgroup>
			<col style="width:8%;">
			<col style="width:8%;">
			<col>
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">메뉴명</th>
				<th scope="col">메뉴ID</th>
				<th scope="col">URL</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
				<th scope="col">순서</th>
			</tr>
		</thead> 
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" >
							<td>${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}<!-- <span class="tag_notice">공지</span> --></td>
							<td>${result.menuCl eq 'ma' ? '관리자' : '사용자' }</td>
							<td class="subject" onclick="fncPageBoard('view','view.do','${result.menuSeq}','menuSeq')">${result.menuNm }</td>
							<td>${result.menuCd }</td>
							<td class="subject">${result.url }</td>
							<td>${result.rgstId }</td>
							<td>${result.rgstDt }</td>
							<td>${result.no }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8" class="no_data">데이터가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="#" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script>
$(document).ready(function(){
	$("#status").val(${cmmnBoardVO.status}).prop("selecte",true);
});
</script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="boardSeq" id="boardSeq"/>
		<form:hidden path="boardDivn" id="boardDivn"/>
		<form:hidden path="boardCd" id="boardCd"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<form:hidden path="imageFileId" id="imageFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<input type="hidden" id="title" name="title" value="${cmmnBoardVO.title }" /> 
		<input type="hidden" id="secretYn" name="secretYn" value="${cmmnBoardVO.secretYn }" /> 
		<input type="hidden" name="boardGrpSeq" id="boardGrpSeq" value="${cmmnBoardVO.boardGrpSeq }"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
					<c:if test="${util:getMenuCd(url).depth2 eq 'cb'}">
						<tr>
							<th scope="row"><strong>사이트구분</strong></th>
							<td colspan="3"><c:out value="${cmmnBoardVO.siteClcdNm }" /><c:if test="${cmmnBoardVO.siteClcdCnt > 0 }"> 외 ${cmmnBoardVO.siteClcdCnt}</c:if></td>
						</tr>
					</c:if>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3"><c:out value="${util:unEscape(cmmnBoardVO.title) }" /></td>
					</tr>					
					<c:if test="${cmmnBoardVO.boardCd eq 'bd01' }">
					<tr>
						<th scope="row"><strong>년도</strong></th>
						<td colspan="3"><c:out value="${cmmnBoardVO.year }" />년</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${cmmnBoardVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${cmmnBoardVO.rgstDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(cmmnBoardVO.cont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<c:if test="${loginMgrAuthCode eq '1' || loginMgrSiteClcd ne null && fn:indexOf(cmmnBoardVO.siteClcd,loginMgrSiteClcd) > -1}">
			<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
			<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		</c:if>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
</div>

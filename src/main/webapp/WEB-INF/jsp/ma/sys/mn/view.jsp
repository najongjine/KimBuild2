<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript">
$(document).ready(function(){
});
var board = {
	view : function(){
		$("#menuSeq").val($("#menuGroupSeq").val());
		fncPageBoard('view','view.do');
	},subInsert : function(){
		$("#lvl").val(Number($("#lvl").val())+1);
		$("#menuGroupSeq").val($("#menuSeq").val());
		fncPageBoard('write','subInsertForm.do');
	},
	subUpdate : function(menuSeq){
		$("#lvl").val(Number($("#lvl").val())+1);
		$("#menuSeq").val(menuSeq);
		fncPageBoard('update','subUpdateForm.do');
	},
	subView : function(menuSeq){
		$("#menuSeq").val(menuSeq);
		$("#lvl").val(Number($("#lvl").val())+1);
		fncPageBoard('view','view.do');
	}
};
</script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="menuSeq" id="menuSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<input type="hidden" name="lvl" id="lvl" value="${mnVO.lvl }"/>
		<input type="hidden" name="menuGroupSeq" id="menuGroupSeq" value="${mnVO.menuGroupSeq }"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	</form:form>	
	<%-- tbl --%>
	<div class="tbl_wrap ">
		<table class="tbl_row_type01">
			<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
			</colgroup>       
			<tbody>
				<tr>
					<th scope="row"><strong>메뉴명</strong></th>
					<td colspan="3">${mnVO.menuNm }</td>
				</tr>
				<tr>
					<th scope="row"><strong>레벨</strong></th>
					<td>${mnVO.lvl }</td>
					<th scope="row"><strong>URL</strong></th>
					<td>${mnVO.url }</td>
				</tr>
				<tr>
					<th scope="row"><strong>메뉴ID</strong></th>
					<td>${mnVO.menuCd }</td>
					<th scope="row"><strong>순서</strong></th>
					<td>${mnVO.no }</td>
				</tr> 
				<tr>
					<th scope="row"><strong>등록자</strong></th>
					<td>${mnVO.rgstId }</td>
					<th scope="row"><strong>등록일</strong></th>
					<td>${mnVO.rgstDt }</td>
				</tr> 
				<c:if test="${mnVO.lvl ne '1' }">
					<tr>
						<th scope="row"><strong>게시판구분</strong></th>
						<td colspan="3">
						<c:choose>
							<c:when test="${mnVO.boardCl eq '1' }">공지사항</c:when>
							<c:when test="${mnVO.boardCl eq '2' }">일반게시판</c:when>
							<%-- <c:when test="${mnVO.boardCl eq '3' }">Q&A</c:when> --%>
							<c:when test="${mnVO.boardCl eq '4' }">이미지게시판</c:when>
							<c:when test="${mnVO.boardCl eq '5' }">FAQ</c:when>
							<c:when test="${mnVO.boardCl eq '6' }">설문조사</c:when>
							<c:when test="${mnVO.boardCl eq '7' }">콘텐츠관리</c:when>
						</c:choose>
						</td>
					</tr> 
				</c:if>
				<tr>
					<th scope="row"><strong>DESCRIPTION</strong></th>
					<td colspan="3">${mnVO.description }</td>
				</tr> 
			  </tbody>
		</table>
		<%-- //tbl --%>   
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_save" onclick="javascript:board.subInsert();">메뉴등록</a> 
			<a href="#" class="btn btn_mdl btn_rewrite" onclick="fncPageBoard('update','updateForm.do');">수정</a> 
			<a href="#" class="btn btn_mdl btn_del" onclick="fncPageBoard('del','deleteProc.do');">삭제</a>
			<c:choose>
				<c:when test="${mnVO.lvl eq 1 }">
					<a href="#" class="btn btn_mdl btn_list" onclick="fncPageBoard('list','list.do');">목록</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="btn btn_mdl btn_list" onclick="javascript:board.view();">목록</a>
				</c:otherwise>
			</c:choose>
		</div>	
	</div>
	
	<div class="tbl_wrap">
		<table class="tbl_col_type01">
			<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
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
					<th scope="col">메뉴명 </th>
					<th scope="col">메뉴ID</th>
					<th scope="col">URL</th>
					<th scope="col">등록자</th>
					<th scope="col">등록일</th>
					<th scope="col">순서</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(menuList2) > 0}">
						<c:forEach var="result" items="${menuList2}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${result.menuCl eq 'ma' ? '관리자' : '사용자' }</td>
								<c:choose>
									<c:when test="${result.lvl eq 3 }">
										<td class="subject"><a href="#" onclick="javascript:board.subUpdate('${result.menuSeq}')">${result.menuNm }</a></td>
									</c:when>
									<c:otherwise>
										<td class="subject"><a href="#" onclick="javascript:board.subView('${result.menuSeq}')">${result.menuNm }</a></td>
									</c:otherwise>
								</c:choose>
								<td>${result.menuCd }</td>
								<td>${result.url }</td>
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
<%-- //tbl --%>   
</div>

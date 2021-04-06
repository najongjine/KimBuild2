<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	getCmtList()
	$("#btn_insert_cmt").on("click",function(){
		if(!$("#newCmtCont").val().trim()){
			alert("댓글을 입력해주세요")
			return false
		}
		$.ajax({
			url:'insertCmtProc.do'
			,method:"POST"
			,data:$("#defaultFrm").serialize()
			,success:function(data){
				getCmtList()
				$("#newCmtCont").val('')
			}
			,error:function(error){
				alert("통신에러")
			}
		})
		return false
	})
})
var getCmtList=function(){
	$.ajax({
		url:'addCmtList.do'
		,dataType:"html"
		,data:{"seq":'${boardVO.seq}'}
		,success:function(data){
			$(".tbl").html(data)
		}
		,error:function(error){
			alert("통신에러")
		}
	})
	return false
}
</script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="subSeq" id="subSeq"/>
		<form:hidden path="bcmtSeq" id="bcmtSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
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
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${boardVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${boardVO.rgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(boardVO.cont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${boardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	
	<br>
	<div class="tbl">
	</div>
	
	<br>
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
			<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
			<colgroup>
				<col style="width:15%;">
				<col>
				<col style="width:15%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><strong>댓글내용</strong></th>
					<td>
						<textarea name="cont" id="newCmtCont" class="txt_area w_100p" ></textarea>
					</td>
					<td><a href="#" id="btn_insert_cmt" class="btn btn_mdl btn_rewrite" >등록</a> </td>
				</tr> 
			</tbody>
		</table>
	</div>
	</form:form>
</div>

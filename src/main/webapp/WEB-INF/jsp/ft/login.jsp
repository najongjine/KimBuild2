<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){	
	if('${message}'){
		alert('${message}')
		return false
	}
	$("#btn_submit").bind("click", function(){
		
		if($("#id").val() == "" || $("#id").val() == null) {
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
			
		if(!$("#pwd").val().trim()) {
			alert("비밀번호를 입력해주세요");
			return false;
		}	
		
		fncPageBoard('write','loginProc.do');
		return false;
	});
	
	
});
</script>
<div class="content_box">
	<form:form commandName="loginVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
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
						<th scope="row"><strong class="th_tit">아이디</strong></th>
						<td colspan="3">
							<input type="text" name="id" id="id" class="text w27p"  required="required"  maxlength="16" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">비밀번호</strong></th>
						<td colspan="3">
							<input type="password" name="pwd" id="pwd" class="text w40p"  required="required"  maxlength="30" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tbl_btns c">
			<a href="#" class="btn btn_middle btn_purple" id="btn_submit">로그인</a>
		</div>
	</form:form>
</div>
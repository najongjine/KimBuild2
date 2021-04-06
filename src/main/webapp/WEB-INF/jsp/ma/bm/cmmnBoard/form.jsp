<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){	
	$("#statusRe").val('${cmmnBoardVO1.status}').prop("selected",true);
	
	if('${cmmnBoardVO.notiYn}' == 'N'){
		$("#notiDate").removeClass("th_tit");
		$("#notiStDt").removeAttr("required");
		$("#notiEndDt").removeAttr("required");
	}
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "cont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	$("#btn_submit").bind("click", function(){
		<c:if test="${util:getMenuCd(url).depth2 eq 'cb' }">
		if($("input[name=siteClcd]:checked").length == 0){
			alert("사이트 구분을 1개 이상 선택해주세요.");
			return false;
		}
		</c:if>
		
		if($("#title").val() == "" || $("#title").val() == null) {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
			oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
			
		if($("#cont").val()=='<p>&nbsp;</p>') {
			alert("내용을 입력해주세요");
			oEditors.getById["cont"].exec("FOCUS"); /* 에디터 */
			return false;
		}		
		
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	});
	
	$("#btn_returnView").click(function(){
		$("#boardSeq").val($("#boardGrpSeq").val());
		fncPageBoard('view','view.do');
	});
	
	$("#notiYn_N").click(function(){
		$("#notiDate").removeClass("th_tit");
		$("#notiStDt").removeAttr("required");
		$("#notiEndDt").removeAttr("required");
	});
	$("#notiYn_Y").click(function(){
		$("#notiDate").addClass("th_tit");
		$("#notiStDt").attr("required","true");
		$("#notiEndDt").attr("required","true");
	});
	
	fncSiteSelGet('siteClcd_sel','1','');
	fncDate('notiStDt','notiEndDt');
});
function fncChangeStat(boardSeq){
	var status = $("#statusRe").val();
	if(confirm("진행상태를 바꾸시겠습니까?")){
		$.ajax({
			url:'statusChange.do',
			type:'POST',
			data:{'boardSeq':boardSeq,'status':status},
			dataType:'json',
			success:function(data){
				$("#statNm").html($("#status option:selected").text());
			}
		})	
	}
}
</script>
<div class="content_box">
	<form:form commandName="cmmnBoardVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="boardSeq" id="boardSeq"/>
		<form:hidden path="boardDivn" id="boardDivn"/>
		<form:hidden path="boardCd" id="boardCd"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<form:hidden path="imageFileId" id="imageFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<input type="hidden" id="boardGrpSeq" name="boardGrpSeq" value="${searchVO.boardGrpSeq }" /> 
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
					<c:choose>
						<c:when test="${util:getMenuCd(url).depth2 eq 'cb'}">
							<tr>
								<th scope="row"><strong class="th_tit">사이트구분</strong></th>
								<td colspan="3">
									<c:forEach var="result" items="${siteList }">
										<c:set var="siteClcd" value="[${result.siteClcd }]"/>
										<label><input type="checkbox" class="checkbox" name="siteClcd" id="siteClcd_${result.siteSeq }" value="[${result.siteClcd }]" ${fn:contains(cmmnBoardVO.siteClcd,siteClcd) ? 'checked="checked"' : ''}> ${result.siteNm }</label>
									</c:forEach>
								</td>
							</tr>
						</c:when>
						<c:when test="${util:getMenuCd(url).depth2 eq 'rb' }">
							<input type="hidden" name="siteClcd" id="siteClcd" value="[rapa]"/>
						</c:when>
					</c:choose>
					<c:if test="${cmmnBoardVO.boardCd eq 'bd01' }">
						<tr>
							<th scope="row"><strong class="th_tit">년도</strong></th>
							<td colspan="3">
								<form:select path="year" id="year" title="년도 선택" cssClass="selec" >  
									<form:option value="0" label="선택"/>
									<c:forEach var="i" begin="0" end="${year-2011}">
									    <c:set var="yearOption" value="${year-i}" />
									    <form:option value="${yearOption }" label="${yearOption }"/>
									</c:forEach>
								</form:select>
							</td>
						</tr>
					</c:if>
					<tr>
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<c:choose>
								<c:when test="${fn:contains(searchVO.procType,'reply')}">
									${searchVO.title }
									<input type="hidden" id="title" name="title" value="${searchVO.title }" /> 
								</c:when>
								<c:otherwise>
									<input type="text" name="title" id="title" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(cmmnBoardVO.title) }" />
									<form:errors path="title" cssClass="error" cssStyle="color:#ff0000" /> 
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<c:if test="${searchVO.boardDivn eq '1' }">
					<tr>
						<th scope="row"><strong class="th_tit">공지여부</strong></th>
						<td> 
							<label for="notiYn_Y"><form:radiobutton path="notiYn" id="notiYn_Y" value="Y" checked="checked"/>공지</label>
							<label for="notiYn_N"><form:radiobutton path="notiYn" id="notiYn_N" value="N"/>비공지</label>
					    </td>
					    <th scope="row"><strong class="th_tit" id="notiDate">공지기간</strong></th>
						<td>
							<span class="pick_input">
								<form:input path="notiStDt" id="notiStDt" cssClass="text w100" readonly="true"  required="true"  maxlength="10" />
							</span>
							<span class="pick_wave">~</span>
							<span class="pick_input">
								<form:input path="notiEndDt" id="notiEndDt" cssClass="text w100" readonly="true"  required="true"  maxlength="10" />
							</span>
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(cmmnBoardVO.cont)}</textarea>
						</td> 
					</tr>
					<tr>
						<c:if test="${cmmnBoardVO.boardCd eq 'bd01' }">
							<th scope="row"><strong>첨부파일</strong></th>
							<td colspan="3">
								<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							</td>
						</c:if>
						<c:if test="${cmmnBoardVO.boardCd ne 'bd01' }">
							<th scope="row"><strong>첨부파일</strong></th>
							<td colspan="3">
								<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							</td>
						</c:if>
					</tr> 
					<c:if test="${cmmnBoardVO.boardCd eq 'bd01' }">
					<tr>
						<th scope="row"><strong>e-book 이미지파일</strong></th>
						<td colspan="3">
							<iframe name="imageFileIdFrame" id="imageFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.imageFileId }&fileCnt=200&atchFileIdNm=imageFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType ==  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
</div>
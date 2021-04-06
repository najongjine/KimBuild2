<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript">
var overChk=false;
$(document).ready(function(){		
	$("#btn_submit_id").bind("click", function(){		
		if($("#menuNm").val() == '' || $("#url").val() == '' || $("#no").val() == ''){
			alert("요청내용을 입력해주세요");
			return false;
		}		
		<c:if test="${searchVO.procType ne 'update' && searchVO.procType ne 'subUpdate'}">
		if(overChk == false){
			alert("메뉴코드중복확인을 해 주세요.");
			return false;
		}
		</c:if>
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	});
	$("#btn_view2").bind("click", function(){
		$("#menuSeq").val($("#menuGroupSeq").val());
		fncPageBoard('view','view.do');
		return false;
	});	
});

var fncMenuCodeOverlap = function(num){	
	if($("#menuCl").val() == ""){
		alert("구분을 선택해 주세요.");
		overChk=false;
		return false;
	}	
	$.ajax({
	    method: "POST",
	    url: "menuCodeOverlap.do",
	    data: {menuCd : $("#menuCd").val(),menuCl : $("#menuCl").val()},  
	    dataType: "json",   
	    success: function(data) { 
	        
	    	var overCnt = data.overCnt;
	    	
	    	if(overCnt < 1){
	    		alert("중복된 메뉴코드가 없습니다.");
	    		overChk=true;
	    		return false;
	    	}else{
	    		alert("중복된 메뉴코드가 있습니다.");
	    		overChk=false;
	    		return false;
	    	}  
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("에러");
	    }
	});
}

var fncMenuCodeKeyUp = function(){
	overChk=false;
}
</script>
<div class="content_box">
<form:form commandName="mnVO" name="defaultFrm" id="defaultFrm" method="post">
	<form:hidden path="menuSeq" id="menuSeq"/>
	<form:hidden path="menuGroupSeq" id="menuGroupSeq"/>
	<form:hidden path="lvl" id="lvl"/> 
	<form:hidden path="atchFileId" id="atchFileId"/>
	<form:hidden path="pageIndex" id="pageIndex"/> 
	<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	<%-- tbl --%>
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
					<th scope="row"><strong class="th_tit">메뉴명</strong></th>
					<td colspan="3">
						<input name="menuNm" id="menuNm" title="메뉴명"  class="text w90p"  maxlength="50" required="required" value="${util:unEscape(mnVO.menuNm) }"/>
					</td>
				</tr> 
				<tr>
					<th scope="row"><strong class="th_tit">구분</strong></th>
					<td>
						<form:select path="menuCl" id="menuCl" cssClass="w50p">  
							<form:option value="" label="선택"/>
							<form:option value="ma" label="관리자"/>
							<form:option value="ft" label="사용자"/>
						</form:select>
					</td>
					<th scope="row"><strong class="th_tit">순서</strong></th>
					<td>
						<form:input path="no" id="no" title="순서"  cssClass="text"  maxlength="2" required="true" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> 
					</td>
				</tr> 
				<tr>
					<c:choose>
						<c:when test="${searchVO.procType eq 'insert' || searchVO.procType eq 'subInsert'}">
							<th scope="row"><strong class="th_tit">URL</strong></th>
								<td>
									<form:input path="url" id="url" title="URL"  cssClass="text w90p"  maxlength="200" required="true"/>
								</td>
								<th scope="row"><strong class="th_tit">메뉴코드</strong></th>
								<td>
									<form:input path="menuCd" id="menuCd" title="메뉴코드"  cssClass="text"  maxlength="12" required="true" onkeyup="javascript:fncMenuCodeKeyUp();"/>
									<a href="#" class="btn btn_sml btn_overlap" onclick="javascript:fncMenuCodeOverlap();">중복확인</a> 
								</td>
						</c:when>
						<c:otherwise>
							<th scope="row"><strong class="th_tit">URL</strong></th>
							<td>
								${mnVO.url }
								<form:hidden path="url" id="url" />
							</td>
							<th scope="row"><strong class="th_tit">메뉴코드</strong></th>
							<td>
								${mnVO.menuCd }
								<form:hidden path="menuCd" id="menuCd" />
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<c:if test="${mnVO.lvl ne '1'}">
				<tr>
					<th scope="row"><strong class="th_tit">게시판구분</strong></th>
					<td colspan="3" id="clcdBoard">
						<label for="boardCl_1"><form:radiobutton path="boardCl" id="boardCl_1" value="1" />공지사항</label>
						<label for="boardCl_2"><form:radiobutton path="boardCl" id="boardCl_2" value="2" />일반게시판</label>
						<%-- <label for="boardCl_3"><form:radiobutton path="boardCl" id="boardCl_3" value="3" />Q&A</label> --%>
						<label for="boardCl_4"><form:radiobutton path="boardCl" id="boardCl_4" value="4" />이미지게시판</label>
						<%-- <label for="boardCl_5"><form:radiobutton path="boardCl" id="boardCl_5" value="5" />FAQ</label>
						<label for="boardCl_6"><form:radiobutton path="boardCl" id="boardCl_6" value="6" />설문조사</label> --%>
						<label for="boardCl_7"><form:radiobutton path="boardCl" id="boardCl_7" value="7" />콘텐츠관리</label>
					</td>
				</tr> 
				</c:if>
				<c:if test="${mnVO.lvl eq '1'}">
				<tr>
					<th scope="row"><strong class="th_tit">게시판구분</strong></th>
					<td colspan="3">
						<label for="boardCl_7"><form:radiobutton path="boardCl" id="boardCl_7" value="7" />콘텐츠관리</label>
					</td>
				</tr> 
				</c:if>
				<tr>
					<th scope="row"><strong class="th_tit">DESCRIPTION</strong></th>
					<td colspan="3">
						<form:input path="description" id="description" title="DESCRIPTION"  cssClass="text w90p"  maxlength="50" />
					</td>
				</tr> 
			</tbody>
		</table>      
	</div>
	<%-- //tbl --%>   
	<div class="btn_area">
		<a href="#" id="btn_submit_id" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save' }" >${searchVO.procType eq 'update' || searchVO.procType eq 'subUpdate' ? '수정' : '저장' }</a> 
		<c:if test="${searchVO.procType eq 'subUpdate' }">
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a> 
		</c:if>
		<c:choose>
			<c:when test="${searchVO.procType eq 'update' }">
				<a href="#" id="btn_view" class="btn btn_mdl btn_cancel" >취소</a>
			</c:when>
			<c:when test="${fn:indexOf(searchVO.procType , 'sub') > -1  }">
				<a href="#" id="btn_view2" class="btn btn_mdl btn_cancel" >취소</a>
			</c:when>
			<c:otherwise>
				<a href="#" id="btn_list" class="btn btn_mdl btn_cancel" >취소</a>
			</c:otherwise>
		</c:choose>
	</div>						
</form:form>
</div>

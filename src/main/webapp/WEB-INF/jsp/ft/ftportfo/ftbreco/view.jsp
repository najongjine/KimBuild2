<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<!-- slider -->
<script type="text/javascript" src="/publish/ft/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="/publish/ft/js/jquery.pikachoose.js"></script>
<script language="javascript">
	$(document).ready(
		function (){
			$("#pikame").PikaChoose({carousel:true,autoPlay:false,carouselOptions:{wrap:'circular'}});
		});
</script>
<!-- // slider -->
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
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
								<pre><c:out value="${util:unEscape(boardVO.cont)}" escapeXml="false"/></pre>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="tbl_text">
							<div class="thum_slide">
								<div class="pikachoose">
									<ul id="pikame" class="jcarousel-skin-pika">
										<c:forEach var="result" items="${boardVO.imgList}" varStatus="status">
											<li>
												<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.fileSn}" alt=""
												 onerror="this.src='/publish/ma/images/no_img.png'" >
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="tbl_btns">
		<c:if test="${boardVO.rgstId eq loginFtSeq}">
			<a href="#" id="btn_update" class="btn btn_middle btn_purple" >수정</a> 
			<a href="#" id="btn_del" class="btn btn_middle btn_red" >삭제</a>
		</c:if>
		<a href="#" id="btn_list" class="btn btn_middle btn_gray" >목록</a>
	</div>	
	</form:form>
</div>

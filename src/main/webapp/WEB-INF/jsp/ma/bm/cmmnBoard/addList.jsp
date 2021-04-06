<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
	<c:choose>
		<c:when test="${searchVO.boardDivn eq '4'}">
			<%-- thum --%>
			<div class="thum_wrap"> 
			    <ul class="thum_list">
			    	<c:choose>
			    		<c:when test="${fn:length(resultList) > 0 }">
					    	<c:forEach var="result" items="${resultList }" varStatus="status">
						        <li>
						            <a href="javascript:void(0);" onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq');"> 
						                <div class="img_thum">
						                    <img src="/atch/getImage.do?atchFileId=${result.atchFileId }&fileSn=0" alt="" onerror="this.src='/publish/ft/images/sub/no_img.png'"/>
						                    <div class="mask"></div> 
						                </div>
					                    <strong>${util:unEscape(result.title)}</strong>
						            </a>
						        </li>
					    	</c:forEach>
			    		</c:when>
			    		<c:otherwise>
			    			<li class="no_data">
			    				데이터가 없습니다.
			    			</li>
			    		</c:otherwise>
			    	</c:choose>
			    </ul>
			</div>
			<%-- //thum --%>
		</c:when>
		<c:otherwise>
			<div class="tbl_wrap">
				<table class="tbl_col_type01">
					<caption>목록</caption>
					<colgroup> 
						<col style="width:5%">
						<c:if test="${searchVO.boardCd ne 'bd01' && searchVO.boardCd ne 'bd02' && searchVO.boardCd ne 'bd03'}">
							<col style="width:10%">
						</c:if>
						<col>
						<c:if test="${searchVO.boardDivn eq '1'}">
							<col style="width:5%">
							<col style="width:15%">
						</c:if>
						<c:if test="${searchVO.boardDivn eq '2' or searchVO.boardDivn eq '1'}">
							<col style="width:5%">
						</c:if>
						<col style="width:10%">
						<col style="width:10%">
						<col style="width:5%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<c:if test="${searchVO.boardCd ne 'bd01' && searchVO.boardCd ne 'bd02' && searchVO.boardCd ne 'bd03'}">
								<th scope="col">사이트구분</th>
							</c:if>
							<th scope="col" class="subject">제목</th>
							<c:if test="${searchVO.boardDivn eq '1'}">
								<th scope="col">공지여부</th>
								<th scope="col">공지기간</th>
							</c:if>
							<c:if test="${searchVO.boardDivn eq '2' or searchVO.boardDivn eq '1'}">
								<th scope="col">첨부</th>
							</c:if>
							<th scope="col">등록자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr class="cursor">
										<td onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq')">
											${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}
										</td>
										<c:if test="${searchVO.boardCd ne 'bd01' && searchVO.boardCd ne 'bd02' && searchVO.boardCd ne 'bd03'}">
											<td onclick="fncPageBoard('view','view.do',''${result.boardSeq},'boardSeq')">${result.siteClcdNm }<c:if test="${result.siteClcdCnt > 0 }"> 외 ${result.siteClcdCnt}</c:if></td>
										</c:if>
										<td class="subject" onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq')">
												${util:cutText(result.title,45,'...') }
											<c:if test="${result.newChk <= 24}">
												<img src="/publish/ma/images/i_new.png" alt="">
											</c:if>
										</td>
										<c:if test="${searchVO.boardDivn eq '1'}">
											<td>
												${result.notiYn eq 'Y' ? '공지' : '비공지' }
											</td>
											<td>
												${result.notiStDt } ~ ${result.notiEndDt }
											</td>
										</c:if>
										<c:if test="${searchVO.boardDivn eq '2' or searchVO.boardDivn eq '1'}">
											<td>
												<c:if test="${not empty result.atchFileId}">
													<i class="attached_file"></i>
												</c:if>
											</td>
										</c:if>
										<td onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq')">${result.name }</td>
										<td onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq')">${result.rgstDt }</td>
										<td onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq')"><fmt:formatNumber value="${result.viewNum }" pattern="#,###"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr><td colspan="${searchVO.boardDivn eq '1' ? '9' : searchVO.boardCd eq 'bd02' or searchVO.boardCd eq 'bd03' ? '6':'7' }" class="no_data">데이터가 없습니다.</td></tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
<%-- //tbl end --%>
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
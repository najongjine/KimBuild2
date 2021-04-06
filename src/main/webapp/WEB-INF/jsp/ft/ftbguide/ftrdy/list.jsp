<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
});
</script>
<%-- content --%>
<div class="content_box">
	<h4 class="small_tit">개요</h4>
	<p class="intro ready_intro">나의 행복을 최우선시하여 선택한 전원의 삶인 만큼 전원생활을 준비하기 전 전원주택에 대한 주택지 현장 체크가 필수적으로 꼭 필요합니다. 토지 현황, 교통 및 입지 여건에서부터 건축주의 조경 설치계획에 이르기까지 만족스러운 전원생활을 위해 참고하시면 좋습니다.</p>
	<div class="ready_img"></div>
	<h4 class="small_tit">전원주택 준비사항</h4>
	<h5 class="num_tit"><span>1</span>토지 현황조사</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row" style="padding:0;vertical-align:middle;text-align:center;border-top:1px solid #dddddd;height:70px;font-weight:bold;">가. 진입로</th>
               <td colspan="3">차량 진입 용이성을 살펴봐야 하며 일반적으로 건축법상 전면도로 4m를 확보해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row" style='padding:0;vertical-align:middle;text-align:center;background:#f9f9f9;border:1px solid #dddddd; border-top:0;height:70px;font-weight:bold;'>나. 지질조사</th>
			<td>지질에 대한 검토를 해야 합니다. 경암, 풍암, 습지, 연약지 등</td>
           </tr>
           <tr>
               <th scope="row" style='padding:0;vertical-align:middle;text-align:center;background:#f9f9f9;border:1px solid #dddddd; border-top:0;height:70px;font-weight:bold;'>다. 경사도</th>
               <td colspan="3">대지 조성 상태와 절토, 성토, 옹벽 설치 등을 체크해야 합니다. 배수로 작업과 부대 토목공사 계획을 검토해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row" style='padding:0;vertical-align:middle;text-align:center;background:#f9f9f9;border:1px solid #dddddd; border-top:0;height:70px;font-weight:bold;'>라. 향후 토지 이용계획</th>
			<td>주택의 배치, 조경, 담장 계획을 세워야 합니다. 지하수 개발, 정화조 위치, 우수 관로, 오 배수 관로와 전기 인입 통신맨홀 위치를 정해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row"style='padding:0;vertical-align:middle;text-align:center;background:#f9f9f9;border:1px solid #dddddd; border-top:0;height:70px;font-weight:bold;'>마. 공사 진행 용이성</th>
			<td>대지 조성 상태와 절토, 성토, 옹벽 설치 등을 체크해야 합니다. 배수로 작업과 부대 토목공사 계획을 검토해야 합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>2</span>교통 및 입지 여건</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 입지 조건</th>
               <td colspan="3">주택예정지 주변에 위험물 시설이나 혐오시설이 있나 확인 조치를 해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row">나. 교통</th>
			<td>주변의 교통 편리성과 인접 도시와의 연계 관례를 살펴봐야 합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>3</span>주변 자연 환경</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 일조권</th>
               <td colspan="3">남향으로서 충분한 일조량을 확인해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row">나. 조망권</th>
			<td>거실과 각 방의 조망권을 고려해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row">다. 풍향</th>
               <td colspan="3">주택의 자연 환기와 통풍 굴뚝의 매연 등을 고려해야 합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>4</span>주택 외형</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 스타일</th>
               <td colspan="3">주택의 외형 결정을 주변환경과 건축주의 예산과 가족의 기호를 고려하여 스타일을 정합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>5</span>외부 마감재와 실내 인테리어</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 외장재</th>
               <td colspan="3">주요 외장재, 외벽과 지붕재를 선택해야 합니다.</td>
           </tr>
           <tr>
               <th scope="row">나. 마감재</th>
			<td>바닥, 벽, 천장 등 내부 마감재를 충분히 검토하여야 합니다.</td>
           </tr>
           <tr>
               <th scope="row">다. 인테리어</th>
               <td colspan="3">창호재, 수전금구류, 조명, 가구를 정합니다.</td>
           </tr>
           <tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>6</span>냉난방 방식 결정</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 열효율</th>
               <td colspan="3">기름, 심야전기, 가스, 패널 보일러, 태양열, 태양광, 지열 등 열효율을 생각해서 정합니다.</td>
           </tr>
           <tr>
               <th scope="row">나. 방식</th>
			<td>개별 패키지 방식이나 벽걸이 방식 중 선택합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>7</span>급수설비 방식 결정</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 급수설비</th>
               <td colspan="3">상수도, 자가 지하수, 공동우물, 고가수조형식, 기압펌프식 등 급수설비 방식을 고릅니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>8</span>전기 및 부대 설치</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 전기 및 부대설치</th>
               <td colspan="3">TV, 전화, 인터넷 통신, 소요인입력수와 보안시스템, 홈 오토메이션, CCTV, 위성방송수신시스템 등 첨단설비 기능 설치여부를 정합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<h5 class="num_tit"><span>9</span>정화조 설비 선택</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 정화조 설비</th>
               <td colspan="3">정화조 설비를 종말처리장관로, 일반부패정화조, 합병정화조 방식 중 선택합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
	<!-- //tbl -->
	<h5 class="num_tit"><span>10</span>조경 설비 계획</h5>
	<!-- tbl -->
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
       <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
       <colgroup>
		<col style="width:20%;">
      		<col>
       </colgroup>
       <tbody>
           <tr>
               <th scope="row">가. 조경 설비</th>
               <td colspan="3">조경시설, 대문, 담, 조경수식재 등 조경 설치 계획을 합니다.</td>
           </tr>
        </tbody>
    </table>
	</div>
	<!-- //tbl -->
</div>


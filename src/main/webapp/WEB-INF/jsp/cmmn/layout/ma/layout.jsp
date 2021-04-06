<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Pragma" content="no-store"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>한국전파진흥협회 관리자</title>
<link rel="shortcut icon" href="/publish/ft/images/common/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="/publish/ft/images/common/apple-touch-icon.png">
<link rel="stylesheet" type="text/css" href="/publish/ma/css/style.css">
<link rel="stylesheet" type="text/css" href="/publish/ma/css/jquery-ui-1.12.1.custom.css"/>
<script type="text/javascript" src="/publish/ma/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/ma/js/jquery-ui-1.12.1.custom.js"></script>
<script type="text/javascript" src="/publish/ma/js/common.js"></script>
<script type="text/javascript" src="/resource/js/cm.validate.js" charset="utf-8"></script>
<script type="text/javascript" src="/publish/ma/js/highcharts.js"></script>
<script type="text/javascript" src="/publish/ma/js/exporting.js"></script>
</head>


<body>
	<div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
	<div id="wrapper">
        <!-- header --> 
		<tiles:insertAttribute name="header"/>
        <!--// header -->     
        
            <!-- container -->
      <div id="container">
      	<div id="content">
	        <!-- header --> 
			<tiles:insertAttribute name="aside"/>
	        <!--// header -->     
			<!-- contents -->			
			<tiles:insertAttribute name="body"/>
		</div>
		<!-- <div class="loading_bg" id="loading_bg"> 
			<div class="loading_box"> 
				<img src="/publish/ma/images/common/loading.gif" alt=""/> 
				<div class="loading_txt">데이터를 업로드 중입니다.<br>잠시만 기다려주세요.</div>
			</div>
		</div> -->
		<!--// contents e -->      
        </div><!-- //container -->
	<tiles:insertAttribute name="footer"/>  
	</div>
    <!-- //wrap -->
 </body>
</html>
			
		 
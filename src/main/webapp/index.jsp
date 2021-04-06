<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>한국전파진흥협회</title>
<script type="text/javascript" src="/publish/ma/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function isMobile(){
		return /(iphone|ipod|ipad|android|blackberry|windows ce|palm|symbian)/i.test(navigator.userAgent);
	}
	
	$(document).ready(function(){
		//var userLang = navigator.language || navigator.userLanguage;
		//if(userLang == "ko" || userLang == "ko-KR") {
			if(isMobile()){
				location.href="/ft/main.do";
			}else{
				location.href="/ft/main.do";
			}
		/* }else{
			location.href="/eMain.do";
		} */
	});
</script>
</head>
<body>
</body>
</html>
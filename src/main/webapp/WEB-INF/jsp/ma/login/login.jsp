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
<link rel="stylesheet" type="text/css" href="/publish/ma/css/jquery-ui-1.12.1.custom.css"><!-- 개별페이지들의 css 영역 -->
<script type="text/javascript" src="/publish/ma/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/ma/js/common.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if("${message}"!=""){
			alert("${message}");
		}
		if("${useYn}"!=""){
			alert("${useYn}");
		}
		$("#btn_login").click(function(){
			fncLogin();
			return false;
		});
		$("#pwd").keyup(function(){
			if(event.keyCode == 13){
				fncLogin();
				return false;
			}
		});
	});
	var fncLogin = function(){
		if($("#id").val() == ""){
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;
		}
		if($("#pwd").val() == ""){
			alert("패스워드를 입력해 주세요.");
			$("#pwd").focus();
			return false;
		}
		<%-- if($("#id_save").prop("checked") == true){
			$.cookie("id_save", $("#id").val(), 30);
		} --%>
		$("#defaultFrm").attr({"action":"/loginProcess.do"}); 
		$("#defaultFrm").submit();
	};
</script>
</head>
<body>
    <div id="skipnavi">
        <a href="#container">▶본문 바로가기</a>
        <a href="#gnb_area">▶주메뉴 바로가기</a>
    </div>
    <div id="wrapper">
        <div class="login_wrap">
            <form:form commandName="loginVO" id="defaultFrm" method="post">
                <form:hidden path="returnUrl" id="inpReturnUrl" />
                <h1><img src="/publish/ma/images/logo_login.png" alt="한국전파진흥협회"></h1>
                <div class="login_box">
                    <div class="login_bg">
                        <i><img src="/publish/ma/images/i_login.png" alt=""></i>
                    </div>
                    <div class="login">
                        <fieldset>
                            <legend>로그인폼</legend>
                            <div class="login_input">
                                <ul>
                                    <li>
                                        <form:input path="id" class="text" tabindex="1" id="id" placeholder="아이디" maxlength="10" />
                                    </li>
                                    <li>
                                        <form:password path="pwd" class="text" tabindex="2" id="pwd" placeholder="패스워드" maxlength="50" />
                                    </li>
                                </ul>
                                <button type="button" class="btn_login" onclick="javascript:fncLogin(); return false;">로그인</button>
                            </div>
                        </fieldset>
                        <div class="login_link">
                            <ul>
                                <li>아이디 및 기타 시스템문의 연락처 : 000-000-0000</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>

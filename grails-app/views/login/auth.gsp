<!DOCTYPE html>
<html>
<head>
<meta name="description" content="login">
<meta name="layout" content="responsivemasterpage" />
<title><g:message code="login.title.login" /> Ahotua</title>
</head>
<body>
	<section id="break-crumb" class="row title-b">
		<article class="col-md-12 col-sm-12 col-xs-12">
			<g:link controller="home" action="index">
				<img src="${resource(dir:'images/img',file:'icon-home-black.png')}"
					alt="home" />Trang chủ</g:link>
			<span class="">&gt;</span> <a
				href="${createLink(action:'auth', controller:'login') }"
				class="current">Đăng nhập</a>
		</article>
	</section>

	<section class="row">
		<article class="col-md-9 col-sm-9 col-xs-12" style ="width: 100% !important">
		<div id="globalContainer" class="uiContextualLayerParent">
			<div class="fb_content clearfix " id="content" role="main">
				<div class="UIFullPage_Container">
					<div
						class="mvl ptm uiInterstitial login_page_interstitial uiInterstitialLarge uiBoxWhite">
						<div
							class="uiHeader uiHeaderBottomBorder mhl mts uiHeaderPage interstitialHeader">
							<div class="clearfix uiHeaderTop">
								<div>
									<h2 class="uiHeaderTitle" aria-hidden="true">Đăng nhập</h2>
									<ul class="social">
										<li class="facebook" id="facebookButton" onclick="fbLoginClick()">Đăng nhập qua Facebook</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="phl ptm uiInterstitialContent">
							<div class="login_form_container">
								<form id="login_form" method="post">
									<input type="hidden" name="lsd" value="AVptONLn"
										autocomplete="off">
									<div class="hidden_elem"></div>
									<div class="pam login_error_box uiBoxRed" role="alert"
										tabindex="0" id="errorLoginMsg" style="display: none;">
										<div class="fsl fwb fcb">
											<g:if test="${params['login_attempt'].equals('1')}">
												<g:message code="error.login.fail" />
												<script>
													$('#errorLoginMsg').show();
												</script>
											</g:if>
										</div>
									</div>
									<div id="loginform">
										<div class="form_row clearfix">
											<label for="username" class="login_form_label">Email</label>
											<input type="text" class="inputtext" name='j_username' id='username' value="${params['email']}" tabindex="1">
										</div>
										<div class="form_row clearfix">
											<label for="pass" class="login_form_label">Mật khẩu</label>
											<input type='password' name='j_password' id='password' class="inputpassword"
												tabindex="1">
										</div>
										<div class="persistent">
											<div class="uiInputLabel clearfix uiInputLabelLegacy">
												<input id="persist_box" type="checkbox" value="1"
													checked="1"  id='remember_me' name='_spring_security_remember_me' class="uiInputLabelInput uiInputLabelCheckbox"><label
													for="persist_box" class="uiInputLabelLabel">Duy trì đăng nhập</label>
											</div>
										</div>
										<div id="buttons" class="form_row clearfix">
											<label class="login_form_label"></label>
											<div id="login_button_inline">
												<label class="uiButton uiButtonConfirm uiButtonLarge"
													id="loginbutton" for="u_0_1">
												<input onclick='authAjax(); return false;' value="Đăng nhập" 
													name="login" tabindex="1" type="button" id="u_0_1"></label>
											</div>
											<div id="register_link">
												hoặc <strong><g:link controller="register">Đăng ký với Ahotua</g:link></strong>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</article>
	</section>

	<script type='text/javascript'>
		
		function authAjax()
		{
			var formdata = $('#login_form').serialize();
			var dataUrl = "${createLinkTo(dir: 'j_spring_security_check')}"      
			jQuery.ajax({
				type : 'POST',
				url :  dataUrl ,
				data : formdata,
				dataType : "json",
				success : function(response,textStatus)
				{
					emptyForm();
				   	if(response.success)
				   	{
				   		var redirectUrl="${ createLink(action:'index' ,controller:'home') }";
				        window.location.assign(redirectUrl);
				   	}
				   	else
				   	{
				        $('#errorLoginMsg').html(response.error);
				        $('#errorLoginMsg').show();
				   	}
				},
				error : function(
				XMLHttpRequest,
				textStatus,
				errorThrown) {
					
				}
			});
		}
		 
		 
		function emptyForm()
		{
			$('#username').val('');
			$('#password').val('');
			$('#remember_me').val('');
		}
		</script>
		
<style type="text/css">

.fbx #globalContainer {
	width: 981px;
}

#globalContainer {
	margin: 0 auto;
	position: relative;
	zoom: 1;
}

#content {
	margin: 0;
	outline: none;
	padding: 0;
	width: auto;
}

.UIFullPage_Container {
	width: 100%;
	margin: 0 auto;
}


div.login_page_interstitial {
	margin-bottom: 0;
}

.uiInterstitial {
	-webkit-border-radius: 4px;
	margin-left: auto;
	margin-right: auto;
}

.mvl {
	margin-bottom: 20px;
}

.ptm {
	padding-top: 10px;
}

.uiBoxWhite {
	background-color: #fff;
	border: 1px solid #ccc;
}

.uiInterstitial .interstitialHeader {
	border-color: #ccc;
	padding-bottom: .5em;
}

.uiHeaderPage {
}

.uiHeaderBottomBorder {
	border-bottom: 1px solid #aaa;
	padding-bottom: .5em;
}

.mhl {
	margin-left: 20px;
	margin-right: 20px;
}

.mts {
}

.clearfix {
	zoom: 1;
}

._ohf {
	float: right;
}

#facebook .accessible_elem {
	clip: rect(1px 1px 1px 1px);
	clip: rect(1px, 1px, 1px, 1px);
	height: 1px;
	overflow: hidden;
	position: absolute;
	width: 1px;
}

.uiHeaderPage .uiHeaderActions {
	margin-top: -1px;
}

.uiHeaderPage .uiHeaderTitle {
	line-height: 20px;
	min-height: 20px;
	padding-bottom: 2px;
	vertical-align: bottom;
}

.uiHeader .uiHeaderTitle {
	outline: none;
}

.uiHeader h2 {
	color: #1e2d4c;
	font-size: 16px;
}

.uiInterstitialContent {
	margin-bottom: 15px;
}

.phl {
	padding-left: 20px;
	padding-right: 20px;
}

.ptm {
	padding-top: 0px;
}

#facebook .hidden_elem {
	display: none !important;
}

.login_error_box {
	margin-top: 10px;
}

.pam {
	padding: 10px;
}

.uiBoxRed {
	background-color: #ffebe8;
	border: 1px solid #dd3c10;
}

.fcb {
	color: #333;
}

.fwb {
	font-weight: bold;
}

.fsl {
	font-size: 13px;
}

.login_page #loginform {
	clear: left;
	margin: auto;
	padding: 15px 0;
	text-align: left;
	width: 380px;
}

.form_row {
	padding: 10px 0 8px 0;
	text-align: left;
}

.form_row .login_form_label {
	display: block;
	float: left;
	padding: 3px 0;
	width: 100px;
}

.login_page #email {
	direction: ltr;
}

.form_row .inputtext, .inputpassword {
	width: 175px;
}

.persistent {
	padding: 3px 0 3px 100px;
}

.uiInputLabel {
	position: relative;
}

.uiInputLabelInput {
	margin: 0;
	padding: 0;
	position: absolute;
}

.uiInputLabel .uiInputLabelLabel {
	display: inline-block;
	margin-left: 17px;
	vertical-align: baseline;
}

.uiInputLabelLegacy label {
	color: #333;
	font-weight: normal;
}

#buttons {
	padding: 5px 0 0 100px;
	text-align: left;
}

#login_button_inline {
	float: left;
	margin-bottom: 5px;
	margin-right: 5px;
}

#buttons .uiButton {
	margin-right: 2px;
}

#buttons label {
	float: none;
	width: auto;
}

.uiButtonLarge, .uiButtonLarge .uiButtonText, .uiButtonLarge input {
	font-size: 13px;
	line-height: 16px;
}

.uiButtonLarge {
	height: 19px;
}

.uiButtonConfirm {
	background-size: auto;
	background-position: 0 -49px;
	background-color: #D80000;
	border-color: #2f477a #29447e #1a356e;
}

.uiButton {
	cursor: pointer;
	display: inline-block;
	font-size: 11px;
	font-weight: bold;
	line-height: 13px;
	padding: 2px 6px;
	text-align: center;
	text-decoration: none;
	vertical-align: top;
	white-space: nowrap;
}

#register_link {
	margin-top: 5px;
	float: left;
	margin-bottom: 40px;
}

#register_link a {
	color: #3b5998;
	cursor: pointer;
	text-decoration: none;
}

.login_page #loginform p.reset_password {
	margin-bottom: 0;
	padding-bottom: 0;
}

.login_page #loginform p {
	line-height: 16px;
	margin: 10px 0;
	text-align: left;
}

.uiButtonText, .uiButton input {
	background: none;
	border: 0;
	color: #333;
	cursor: pointer;
	display: inline-block;
	font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
	font-size: 11px;
	font-weight: bold;
	line-height: 13px;
	margin: 0;
	padding: 1px 0 2px;
	white-space: nowrap;
	color: #fff;
}

</style>
</body>
</html>
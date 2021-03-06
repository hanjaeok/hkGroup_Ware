<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Login V1</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<!-- <link rel="icon" href="../assets/Login_v1/images/icons/favicon.ico"/> -->
<!--===============================================================================================-->
	<link rel="stylesheet" href="../assets/Login_v1/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="../assets/Login_v1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="../assets/Login_v1/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" href="../assets/Login_v1/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="../assets/Login_v1/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="../assets/Login_v1/css/util.css">
	<link rel="stylesheet" href="../assets/Login_v1/css/main.css">
<!--===============================================================================================-->

</head>
<body>
	<div class="wrap-loading display-none">
		<div><img src="../assets/Login_v1/images/ajax-loader.gif"></div>
	</div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<span class="wrap-back100">
					<a href="/login/loginForm"><i class="fa fa-arrow-left f-s-30"></i></a>
				</span>
				<span class="login100-form-title register-title">
					HGroupWare 회원가입
				</span>
				
				<div class="login100-pic js-tilt" data-tilt style="margin-bottom:30px; margin-left:calc(30%);">
					<img src="../assets/Login_v1/images/img-01.png" alt="IMG">
				</div>
				<div class="wrap-input100 validate-input" data-validate = "Id is required">
					<div class="IDC">
						<input class="input100" type="text" id="id" placeholder="ID">
						<button type="button" onclick="REGI.dupliChck();" class="dupliBtn">중복확인</button>
					</div>
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Password is required">
					<input class="input100" type="password" id="password" placeholder="비밀번호">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input pwChk" data-validate = "Password is required">
					<input class="input100" type="password" id="re_password" placeholder="비밀번호 확인">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				<div class="wrap-input100 validate-input" data-validate = "email is required">
					<div class="IDC">
						<input class="input100" type="email" id="email" placeholder="e-mail">
						<button type="button" onclick="REGI.emailCert();" class="emailCert">인 증</button>
					</div>
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input" id="eCertBox" style="display:none;">
					<div class="IDC">
						<input class="input100" type="text" id="eCert" placeholder="인증번호">
						<button type="button" onclick="REGI.tokenCheck();" class="emailCert">확 인</button>
					</div>
				</div>
				
				<div class="wrap-input100 validate-input" data-validate = "Phone Number is required">
					<input class="input100" type="text" id="phNumber" placeholder="핸드폰번호('-'제외)를  입력해주세요">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-phone" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input" data-validate = "name is required">
					<input class="input100" type="text" id="name" placeholder="이름">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-address-card" aria-hidden="true"></i>
					</span>
				</div>
					
				<div class="container-login100-form-btn">
					<button type="button" class="login100-form-btn" onclick="REGI.register();">
						회원가입
					</button>
					<div class="help-tip">
						<p> 회원가입 시 관리자 승인 후 로그인이 가능합니다. <br> 2~3일 정도 소요됩니다. </p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="../assets/Login_v1/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/Login_v1/vendor/bootstrap/js/popper.js"></script>
	<script src="../assets/Login_v1/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/Login_v1/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/Login_v1/vendor/tilt/tilt.jquery.min.js"></script>
	<script src="../assets/js/login/register.js"></script>
	<script src="../assets/Login_v1/js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.js-tilt').tilt({
				scale: 1.1
			});
			
			
			$(".pwChk").focusout(function(){
				var pwd1 = $("#password").val();
				var pwd2 = $("#re_password").val();
				
				if(pwd1 != '' && pwd2 == ''){
					null;
				} else if(pwd1 != "" || pwd2 != ""){
					if(pwd1 == pwd2){
						
					} else{
						alert("비밀번호가 일치 하지 않습니다.");
						
						$("#re_password").val("");
					}
				}
			});
		});
	</script>
<!--===============================================================================================-->
	

</body>
</html>
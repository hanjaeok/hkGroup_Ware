<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Login V1</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" href="../assets/Login_v1/images/icons/favicon.ico"/>
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
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="../assets/Login_v1/images/img-01.png" alt="IMG">
				</div>
				
				<c:url value="/login" var="loginUrl" />
				<form:form name="f" action="${loginUrl }" method="POST" class="login100-form validate-form">
					<span class="login100-form-title">
						HGrouWare 로그인
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="id" placeholder="ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password" autocomplete="on">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							분실
						</span>
						<a class="txt2" href="/login/userInfoSer">
							ID / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="/login/register">
							회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form:form>
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
	<script src="../assets/Login_v1/js/main.js"></script>
	<script src="../assets/js/login/register.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.js-tilt').tilt({
				scale: 1.1
			});	
		});
	</script>
<!--===============================================================================================-->
	

</body>
</html>
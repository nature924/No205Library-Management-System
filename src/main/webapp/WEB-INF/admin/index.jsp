<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用网站后台管理系统</title>
<link href="asset/css/bootstrap.min.css" rel="stylesheet">
<link href="asset/css/materialdesignicons.min.css" rel="stylesheet">
<link href="asset/css/style.min.css" rel="stylesheet">
<script type="text/javascript" src="asset/js/jquery.min.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.min.js"></script>
<style>
.lyear-wrapper {
	position: relative;
}

.lyear-login {
	display: flex !important;
	min-height: 100vh;
	align-items: center !important;
	justify-content: center !important;
}

.lyear-login:after {
	content: '';
	min-height: inherit;
	font-size: 0;
}

.login-center {
	background: #fff;
	min-width: 29.25rem;
	padding: 2.14286em 3.57143em;
	border-radius: 3px;
	margin: 2.85714em;
}

.login-header {
	margin-bottom: 1.5rem !important;
}

.login-center .has-feedback.feedback-left .form-control {
	padding-left: 38px;
	padding-right: 12px;
}

.login-center .has-feedback.feedback-left .form-control-feedback {
	left: 0;
	right: auto;
	width: 38px;
	height: 38px;
	line-height: 38px;
	z-index: 4;
	color: #dcdcdc;
}

.login-center .has-feedback.feedback-left.row .form-control-feedback {
	left: 15px;
}
</style>
</head>
<body>
	<div class="row lyear-wrapper" style="background-image: url(asset/images/login-bg.jpg); background-size: cover;">
		<div class="lyear-login">
			<div class="login-center" style="padding: 5rem 6rem;">
				<div class="login-header text-center">
					<a href="javascript:;" style="font-size: 25px;font-weight: bold;letter-spacing: 2px;"> 
					图书管理系统
					</a>
				</div>
				<form action="admin/login.action" method="post">
					<div class="form-group has-feedback feedback-left">
						<input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" required="required" />
					</div>
					<div class="form-group has-feedback feedback-left">
						<input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" required="required" />
					</div>
					<div class="form-group">
						<button class="btn btn-block btn-primary" type="submit">立即登录</button>
					</div>
				</form>
				<hr>
				<footer class="col-sm-12 text-center">
					<p class="m-b-0">版权所有</p>
				</footer>
			</div>
		</div>
	</div>

</body>
</html>
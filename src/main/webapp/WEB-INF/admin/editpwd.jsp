<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript" src="asset/js/main.min.js"></script>
<script type="text/javascript" src="js/pwd.js" charset="utf-8"></script>
</head>
<body>
	<div class="container-fluid p-t-15">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="mdi mdi-key-change"></i>修改密码
						</h4>
					</div>
					<div class="card-body">
						<form class="form-horizontal" action="admin/editpwd.action" method="post">
							<div class="form-group">
								<label class="col-md-3 control-label">用户名</label>
								<div class="col-md-7">
									<%=session.getAttribute("adminname")%>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">密码</label>
								<div class="col-md-7">
									<input class="form-control" type="password" id="password" name="password" placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">新密码</label>
								<div class="col-md-7">
									<input class="form-control" type="password" id="newpassword" name="newpassword" placeholder="请输入新密码">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">确认密码</label>
								<div class="col-md-7">
									<input class="form-control" type="password" id="repassword" name="repassword" placeholder="请输入确认密码">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-9 col-md-offset-3">
									<button type="submit" class="btn btn-primary" id="sub">确定保存</button>
									<button type="reset" class="btn btn-default" id="res">取消重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
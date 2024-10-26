<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用后台管理系统</title>
<link href="asset/css/bootstrap.min.css" rel="stylesheet">
<link href="asset/css/materialdesignicons.min.cs" rel="stylesheet">
<link href="asset/css/style.min.css" rel="stylesheet">
<script type="text/javascript" src="asset/js/jquery.min.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.min.js"></script>
<script type="text/javascript" src="asset/js/main.min.js"></script>
<script type="text/javascript" src="js/admin.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>
	<div class="container-fluid p-t-15">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="mdi mdi-file-outline"></i>新增管理员信息
						</h4>
						<ul class="card-actions">
							<li><a class="btn btn-primary m-r-5" href="admin/createAdmin.action">刷新</a></li>
						</ul>
					</div>
					<div class="card-body">
						<form class="form-horizontal" action="admin/addAdmin.action" method="post">

							<div class="form-group">
								<label class="col-md-3 control-label">用户名</label>
								<div class="col-md-7">
									<input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">密码</label>
								<div class="col-md-7">
									<input type="password" name="password" class="form-control" id="password" placeholder="请输入密码" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">姓名</label>
								<div class="col-md-7">
									<input type="text" name="realname" class="form-control" id="realname" placeholder="请输入姓名" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">联系方式</label>
								<div class="col-md-7">
									<input type="text" name="contact" class="form-control" id="contact" placeholder="请输入联系方式" />
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



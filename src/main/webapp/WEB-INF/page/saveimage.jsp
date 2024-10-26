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
<script type="text/javascript">
	function selok() {
		opener.document.getElementById("image").value = myform.p.value;
		window.close();
	}
</script>
</head>
<body>
	<div class="container-fluid p-t-15">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="mdi mdi-upload"></i>上传图片
						</h4>
					</div>
					<div class="card-body">
						<form class="form-horizontal" action="upload/image.action" method="post" enctype="multipart/form-data" name="myform">
							<div class="form-group">
								<label class="col-md-3 control-label">图片</label>
								<div class="col-md-7">
									<input type="file" name="image" class="form-control" id="image" />
								</div>
							</div>
							<div class="form-group">
								<c:if test="${imageFileName ne null }">
						${imageFileName } <input type="hidden" name="p" value="upfiles/${imageFileName }" id="p">
									<input type="button" class="btn btn-primary" value=" 确定 " onclick="selok();" />
								</c:if>
								<c:if test="${imageFileName eq null }">
									<input type="submit" class="btn btn-primary" value="上传图片" />
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
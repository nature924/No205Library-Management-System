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
<script src="echart/echarts.min.js" charset="UTF-8"></script>
<script src="echart/chartline.js" charset="UTF-8"></script>
</head>
<body>
	<div class="container-fluid p-t-15">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="mdi mdi-format-align-justify"></i>预约数量统计
						</h4>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-bordered table-striped table-hover">
						<tr>
							<td style="text-align: center;"><div class="text-center" id="chartmain" style="width: 99%; height: 500px;"></div></td>
						</tr>
					</table>
					<input type="hidden" name="basepath" id="basepath" value="<%=basePath%>">
				</div>
			</div>
		</div>
	</div>
</body>
</html>


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
</head>
<body>
	<div class="container-fluid p-t-15">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="mdi mdi-format-align-justify"></i>意见反馈信息列表
						</h4>
						<ul class="card-actions">
							<li><a class="btn btn-primary m-r-5" href="javascript:location.replace(location.href);">刷新</a></li>
						</ul>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-bordered table-striped table-hover">

						<thead>
							<tr>
								<th style="text-align: center;">用户</th>
								<th style="text-align: center;">标题</th>
								<th style="text-align: center;">内容</th>
								<th style="text-align: center;">发布日期</th>
								<th style="text-align: center;">管理员回复</th>
								<th style="text-align: center;">操作</th>
							</tr>
						</thead>
						<c:forEach items="${complainsList}" var="complains">
							<tr>
								<td style="text-align: center;">${complains.username}</td>
								<td style="text-align: center;">${complains.title}</td>
								<td style="text-align: center;">${complains.contents}</td>
								<td style="text-align: center;">${complains.addtime}</td>
								<td style="text-align: center;">${complains.reps}</td>
								<td style="text-align: center;"><c:if test="${complains.status eq '未回复' }">
										<a href="complains/getComplainsById.action?id=${complains.complainsid}">回复</a>&nbsp;&nbsp;</c:if><a
									href="complains/deleteComplains.action?id=${complains.complainsid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"><i
										class="mdi mdi-delete"></i>删除</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<div class="fixed-table-pagination">
						<div class="pull-right pagination">${html }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>


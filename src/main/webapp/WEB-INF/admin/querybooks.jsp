<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
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
							<i class="mdi mdi-account-search"></i>图书信息查询
						</h4>
						<ul class="card-actions">
							<li><a class="btn btn-primary m-r-5" href="books/queryBooksByCond.action">刷新</a></li>
						</ul>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-striped table-hover">

							<thead>
								<tr>
									<th style="text-align: center;">ISBN</th>
									<th style="text-align: center;">图书名称</th>
									<th style="text-align: center;">图书类型</th>
									<th style="text-align: center;">图书作者</th>
									<th style="text-align: center;">出版社</th>
									<th style="text-align: center;">是否推荐</th>
									<th style="text-align: center;">上架日期</th>
									<th style="text-align: center;">点击数</th>
									<th style="text-align: center;">库存数量</th>
									<th style="text-align: center;">借阅次数</th>
								</tr>
							</thead>
							<c:forEach items="${booksList}" var="books">
								<tr>
									<td style="text-align: center;">${books.isbn}</td>
									<td style="text-align: center;">${books.booksname}</td>
									<td style="text-align: center;">${books.catename}</td>
									<td style="text-align: center;">${books.author}</td>
									<td style="text-align: center;">${books.publisher}</td>
									<td style="text-align: center;">${books.recommend}</td>
									<td style="text-align: center;">${books.addtime}</td>
									<td style="text-align: center;">${books.hits}</td>
									<td style="text-align: center;">${books.storage}</td>
									<td style="text-align: center;">${books.num}</td>
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
							<div class="pull-right pagination">
								<form action="books/queryBooksByCond.action" name="myform" method="post">
									<label>查询条件: <select name="cond" class="form-control" style="width: 180px">
											<option value="isbn">按ISBN查询</option>
											<option value="booksname">按图书名称查询</option>
											<option value="cateid">按图书类型查询</option>
											<option value="author">按图书作者查询</option>
											<option value="publisher">按出版社查询</option>
											<option value="recommend">按是否推荐查询</option>
											<option value="addtime">按上架日期查询</option>
											<option value="hits">按点击数查询</option>
											<option value="storage">按库存数量查询</option>
											<option value="num">按借阅次数查询</option>
									</select>
									</label>&nbsp;&nbsp;&nbsp; <label>关键字: <input type="text" name="name" class="form-control" required style="width: 120px" /></label>&nbsp;&nbsp;&nbsp;
									<label><input type="submit" value="查询" class="btn btn-info" /> </label>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

















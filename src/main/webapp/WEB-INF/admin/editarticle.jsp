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
<script type="text/javascript" src="js/article.js" charset="utf-8"></script>
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
							<i class="mdi mdi-table-edit"></i>编辑新闻公告信息
						</h4>
						<ul class="card-actions">
							<li><a class="btn btn-primary m-r-5" href="article/getAllArticle.action">返回</a></li>
							<li><a class="btn btn-primary m-r-5" href="article/getArticleById.action?id=${article.articleid}">刷新</a></li>
						</ul>
					</div>
					<div class="card-body">
						<form class="form-horizontal" action="article/updateArticle.action" method="post">

							<div class="form-group">
								<label class="col-md-3 control-label">标题</label>
								<div class="col-md-7">
									<input type="text" name="title" class="form-control" id="title" value="${article.title}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图片</label>
								<div class="col-md-7">
									<input class="form-control" type="text" name="image" value="${article.image}" id="image" onclick="selimage();" readonly="readonly" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">内容</label>
								<div class="col-md-7">
									<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
									<textarea cols="80" name="contents" id="contents" rows="10">${article.contents} </textarea>
									<script type="text/javascript">
										CKEDITOR.replace('contents', {
											language : 'zh-cn'
										});
									</script>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-9 col-md-offset-3">
									<input type="hidden" name="articleid" id="articleid" value="${article.articleid}" /><input type="hidden" name="addtime"
										id="addtime" value="${article.addtime}" /> <input type="hidden" name="hits" id="hits" value="${article.hits}" />

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



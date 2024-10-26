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
<script type="text/javascript" src="js/books.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>
	<div class="container-fluid p-t-15">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="card">
					<div class="card-header">
						<h4>
							<i class="mdi mdi-table-edit"></i>编辑图书信息
						</h4>
						<ul class="card-actions">
							<li><a class="btn btn-primary m-r-5" href="books/getAllBooks.action">返回</a></li>
							<li><a class="btn btn-primary m-r-5" href="books/getBooksById.action?id=${books.booksid}">刷新</a></li>
						</ul>
					</div>
					<div class="card-body">
						<form class="form-horizontal" action="books/updateBooks.action" method="post">

							<div class="form-group">
								<label class="col-md-3 control-label">ISBN</label>
								<div class="col-md-7">
									<input type="text" name="isbn" class="form-control" id="isbn" value="${books.isbn}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图书名称</label>
								<div class="col-md-7">
									<input type="text" name="booksname" class="form-control" id="booksname" value="${books.booksname}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图书类型</label>
								<div class="col-md-7">
									<select name="cateid" class="form-control" id="cateid"><c:forEach items="${cateList}" var="cate">
											<option value="${cate.cateid}" ${cate.cateid == books.cateid?"selected":"" }>${cate.catename }</option>
										</c:forEach></select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图书图片</label>
								<div class="col-md-7">
									<input class="form-control" type="text" name="image" value="${books.image}" id="image" onclick="selimage();" readonly="readonly" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图书作者</label>
								<div class="col-md-7">
									<input type="text" name="author" class="form-control" id="author" value="${books.author}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">出版社</label>
								<div class="col-md-7">
									<input type="text" name="publisher" class="form-control" id="publisher" value="${books.publisher}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">是否推荐</label>
								<div class="col-md-7">
									<label class="radio-inline"><input type="radio" name="recommend" value="是" title="是" ${books.recommend == "是"?"checked":""}>是</label><label
										class="radio-inline"><input type="radio" name="recommend" value="否" title="否" ${books.recommend == "否"?"checked":""}>否</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">库存数量</label>
								<div class="col-md-7">
									<input type="text" name="storage" class="form-control" id="storage" value="${books.storage}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图书介绍</label>
								<div class="col-md-7">
									<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
									<textarea cols="80" name="contents" id="contents" rows="10">${books.contents} </textarea>
									<script type="text/javascript">
										CKEDITOR.replace('contents', {
											language : 'zh-cn'
										});
									</script>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-9 col-md-offset-3">
									<input type="hidden" name="booksid" id="booksid" value="${books.booksid}" /><input type="hidden" name="addtime" id="addtime"
										value="${books.addtime}" /> <input type="hidden" name="hits" id="hits" value="${books.hits}" /> <input type="hidden" name="num"
										id="num" value="${books.num}" />

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



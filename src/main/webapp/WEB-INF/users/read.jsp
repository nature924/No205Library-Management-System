<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index/index.action">首页</a>
			<code> &gt; </code>
			<a href="index/article.action">网站公告</a>
			<code> &gt; </code>
			${article.title }
		</div>
	</div>
	<div class="blank"></div>
	<div class="block">
		<div class="box">
			<div class="box_1">
				<h3>
					<span>${article.title }</span>
				</h3>
				<div class="boxCenterList">
					<img src="${article.image }" alt="" style="width: 99%; height: 300px;" /> <br /> ${article.contents }
				</div>
			</div>
		</div>
		<div class="blank5"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

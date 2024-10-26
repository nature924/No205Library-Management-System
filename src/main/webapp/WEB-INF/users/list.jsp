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
	<div style="clear: both"></div>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			<a href="index/index.action">首页</a>
			<code> &gt; </code>
			图书列表
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<div id="category_tree" class="category_tree">
				<div class="title">所有图书分类</div>
				<dl class="clearfix" style="background: #fafafa; width: 216px; padding: 0;">
					<div class="box1 cate" id="cate">
						<c:forEach items="${cateList}" var="cate">
							<h1>
								<a href="index/cate.action?id=${cate.cateid }" class="  f_l">${cate.catename }</a>
							</h1>
							<div style="clear: both"></div>
						</c:forEach>
					</div>
					<div style="clear: both"></div>
				</dl>
			</div>
			<div class="blank"></div>
			<div class="box" id='history_div'>
				<div class="box_1">
					<h3>
						<span>热门图书</span>
					</h3>
					<div class="boxCenterList clearfix" id='history_list'>
						<c:forEach items="${hotList}" var="books">
							<ul class="clearfix">
								<li class="goodsimg"><a href="index/detail.action?id=${books.booksid }" target="_blank"><img
										src="${books.image }" alt="${books.booksname }" class="B_blue" /> </a></li>
								<li><a href="index/detail.action?id=${books.booksid }" target="_blank" title="${books.booksname }">${books.booksname }</a>
								</li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
		</div>

		<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<h3>
						<span>图书列表</span>
					</h3>
					<div class="clearfix goodsBox" style="border: none; padding: 11px 0 10px 0px;">
						<c:forEach items="${booksList}" var="books">
							<div class="goodsItem">
								<a href="index/detail.action?id=${books.booksid }"><img src="${books.image }" alt="${books.booksname }"
									class="goodsimg" /></a><br />
								<p>
									<a href="index/detail.action?id=${books.booksid }" title="${books.booksname }">${books.booksname }</a>
								</p>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
			<div class="blank5"></div>
			<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
				<tr>
					<td align="center" bgcolor="#ffffff">${html}</td>
				</tr>
			</table>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

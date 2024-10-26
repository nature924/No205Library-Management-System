<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			用户中心
			<code> &gt; </code>
			我的延期申请
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox">
						<jsp:include page="usermenu.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>


		<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
						<h5>
							<span>我的延期申请</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr align="center" bgcolor="#FFFFFF">
								<td class="text-center">预约单</td>
								<td class="text-center">用户</td>
								<td class="text-center">图书</td>
								<td class="text-center">申请原因</td>
								<td class="text-center">申请日期</td>
								<td class="text-center">状态</td>
								<td class="text-center">备注</td>
							</tr>
							<c:forEach items="${applysList}" var="applys">
								<tr align="center" bgcolor="#FFFFFF">
									<td style="text-align: center;">${applys.ordercode}</td>
									<td style="text-align: center;">${applys.username}</td>
									<td style="text-align: center;">${applys.booksname}</td>
									<td style="text-align: center;">${applys.reason}</td>
									<td style="text-align: center;">${applys.addtime}</td>
									<td style="text-align: center;">${applys.status}</td>
									<td style="text-align: center;">${applys.memo}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="blank5"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<td align="center" bgcolor="#ffffff">${html}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

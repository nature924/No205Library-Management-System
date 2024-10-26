<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
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
			我的借阅历史
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
							<span>我的借阅历史</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr align="center" bgcolor="#ffffff">
								<td align="center" bgcolor="#ffffff">预约单号</td>
								<td align="center" bgcolor="#ffffff">用户</td>
								<td align="center" bgcolor="#ffffff">图书</td>
								<td align="center" bgcolor="#ffffff">状态</td>
								<td align="center" bgcolor="#ffffff">预约日期</td>
								<td align="center" bgcolor="#ffffff">借阅日期</td>
								<td align="center" bgcolor="#ffffff">到期日期</td>
								<td align="center" bgcolor="#ffffff" width="10%">操作</td>
							</tr>
							<c:forEach items="${ordersList}" var="orders">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center">${orders.ordercode}</td>
									<td align="center">${orders.username}</td>
									<td align="center">${orders.booksname}</td>
									<td align="center">${orders.status}</td>
									<td align="center">${orders.addtime}</td>
									<td align="center">${orders.thestart}</td>
									<td align="center">${orders.theend}</td>
									<td align="center"><c:if test="${orders.status eq '预约'}">
											<a href="index/cancel.action?id=${orders.ordersid}">取消</a>
										</c:if> <c:if test="${orders.status eq '归还'}">
											<a href="index/preTopic.action?id=${orders.ordersid}">评价</a>
										</c:if>
										<c:if test="${orders.isdelay eq '否'}">
											<a href="index/preApplys.action?id=${orders.ordersid}">延期申请</a>
										</c:if>
										</td>
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

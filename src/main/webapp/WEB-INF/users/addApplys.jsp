<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			申请延期
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
							<span>申请延期</span>
						</h5>
						<div class="blank"></div>
						<form action="index/addApplys.action" name="myform" method="post">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td width="20%" align="right" bgcolor="#FFFFFF">预约单：</td>
									<td width="80%" align="left" bgcolor="#FFFFFF">${orders.ordercode }<input name="ordersid" type="hidden" id="ordersid"
										value="${orders.ordersid }" /></td>
								</tr>
								<tr>
									<td width="20%" align="right" bgcolor="#FFFFFF">图书：</td>
									<td width="80%" align="left" bgcolor="#FFFFFF">${orders.booksname }<input name="booksid" type="hidden" id="booksid"
										value="${orders.booksid}" /></td>
								</tr>
								<tr>
									<td width="20%" align="right" bgcolor="#FFFFFF">申请原因：</td>
									<td width="80%" align="left" bgcolor="#FFFFFF"><input name="reason" type="text" size="25" class="inputBg" id="reason"
										placeholder="请输入申请原因" /></td>
								</tr>
								<tr>
									<td width="20%" align="right" bgcolor="#FFFFFF">备注：</td>
									<td width="80%" align="left" bgcolor="#FFFFFF"><input name="memo" type="text" size="25" class="inputBg" id="memo"
										placeholder="请输入备注" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" class="bnt_blue_1" style="border: none;" value="确认提交" /></td>
								</tr>
							</table>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

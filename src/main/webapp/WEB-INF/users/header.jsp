<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link href="themes/ecmoban_dangdang/style.css" rel="stylesheet" type="text/css" />
<div class="top_nav">
	<div class="block">
		<ul class="top_bav_l">
		</ul>
		<div class="header_r">
			<font id="ECS_MEMBERZONE"> 欢迎${title }，<c:if test="${sessionScope.userid == null }">
					<a style="color: #FF6766;" href="index/preLogin.action">[会员登录]</a>
					<a style="color: #FF6766;" href="index/preReg.action">[会员注册]</a>
				</c:if> <c:if test="${sessionScope.userid != null }">
									你好
									<b>${sessionScope.username }</b>
					<a style="color: #FF6766;" href="index/usercenter.action">[用户中心]</a>
					<a style="color: #FF6766;" href="index/exit.action">[退出登录]</a>
				</c:if>
			</font>
		</div>
	</div>
</div>
<div class="clearfix">
	<div class="block header">
		<div class="top">
			<a href="${pageContext.request.contextPath}/index/index.action" class="logo"><img src="themes/ecmoban_dangdang/images/logo.gif" /></a>
			<div class="head_r">
				<div class="top_search">
					<form action="index/query.action" method="post" id="searchForm" name="searchForm" style="_position: relative; top: 5px;">
						<input name="name" type="text" id="keyword" class="keyword" value="" /> <input value="" id="seachbtn" type="submit" />
					</form>
					<div style="clear: both"></div>
				</div>
				<div class="top_shopCart clearfix"></div>
			</div>
		</div>
	</div>
</div>
<div style="clear: both"></div>
<div class="menu_box clearfix">
	<div class="block">
		<div class="menu">
			<a href="index/index.action" rel="nofollow">首页</a> 
			<a href="index/article.action" rel="nofollow">网站公告</a>
			<a href="index/recommend.action" rel="nofollow">推荐图书</a>
			<a href="index/all.action" rel="nofollow">全部图书</a>
		</div>
	</div>
</div>
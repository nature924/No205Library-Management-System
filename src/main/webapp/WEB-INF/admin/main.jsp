<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="asset/css/materialdesignicons.min.css" rel="stylesheet">
<link href="asset/css/style.min.css" rel="stylesheet">
<link href="asset/js/bootstrap-multitabs/multitabs.min.css" rel="stylesheet">
<script type="text/javascript" src="asset/js/jquery.min.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.min.js"></script>
<script type="text/javascript" src="asset/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="asset/js/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="asset/js/index.min.js"></script>
</head>
<body>
	<div class="lyear-layout-web">
		<div class="lyear-layout-container">
			<jsp:include page="menu.jsp"></jsp:include>
			<!--头部信息-->
			<header class="lyear-layout-header">
				<nav class="navbar navbar-default">
					<div class="topbar">
						<div class="topbar-left">
							<div class="lyear-aside-toggler">
								<span class="lyear-toggler-bar"></span> <span class="lyear-toggler-bar"></span> <span class="lyear-toggler-bar"></span>
							</div>
						</div>
						<ul class="topbar-right">
							<li class="dropdown dropdown-profile"><a href="javascript:void(0)" data-toggle="dropdown"> <span>${sessionScope.adminname }
										<span class="caret"></span>
								</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a class="multitabs" data-url="admin/prePwd.action" href="javascript:void(0)"><i class="mdi mdi-lock-outline"></i>
											修改密码</a></li>
									<li class="divider"></li>
									<li><a href="admin/exit.action"><i class="mdi mdi-logout-variant"></i> 退出登录</a></li>
								</ul></li>
							<!--切换主题配色-->
							<li class="dropdown dropdown-skin"><span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
								<ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
									<li class="drop-title"><p>LOGO</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse"> <input type="radio" name="logo_bg" value="default"
											id="logo_bg_1" checked> <label for="logo_bg_1"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2"> <label for="logo_bg_2"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3"> <label for="logo_bg_3"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4"> <label for="logo_bg_4"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5"> <label for="logo_bg_5"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6"> <label for="logo_bg_6"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7"> <label for="logo_bg_7"></label>
									</span> <span> <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8"> <label for="logo_bg_8"></label>
									</span></li>
									<li class="drop-title"><p>头部</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse"> <input type="radio" name="header_bg" value="default"
											id="header_bg_1" checked> <label for="header_bg_1"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_2" id="header_bg_2"> <label for="header_bg_2"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_3" id="header_bg_3"> <label for="header_bg_3"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_4" id="header_bg_4"> <label for="header_bg_4"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_5" id="header_bg_5"> <label for="header_bg_5"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_6" id="header_bg_6"> <label for="header_bg_6"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_7" id="header_bg_7"> <label for="header_bg_7"></label>
									</span> <span> <input type="radio" name="header_bg" value="color_8" id="header_bg_8"> <label for="header_bg_8"></label>
									</span></li>
									<li class="drop-title"><p>侧边栏</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse"> <input type="radio" name="sidebar_bg" value="default"
											id="sidebar_bg_1" checked> <label for="sidebar_bg_1"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2"> <label for="sidebar_bg_2"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3"> <label for="sidebar_bg_3"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4"> <label for="sidebar_bg_4"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5"> <label for="sidebar_bg_5"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6"> <label for="sidebar_bg_6"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7"> <label for="sidebar_bg_7"></label>
									</span> <span> <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8"> <label for="sidebar_bg_8"></label>
									</span></li>
								</ul></li>
							<!--切换主题配色-->
						</ul>
					</div>
				</nav>
			</header>
			<!--End 头部信息-->
			<!--页面主要内容-->
			<main class="lyear-layout-content">
			<div id="iframe-content"></div>
			</main>
			<!--End 页面主要内容-->
		</div>
	</div>
</body>
</html>
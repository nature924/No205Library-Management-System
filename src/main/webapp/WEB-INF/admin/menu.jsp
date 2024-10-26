<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--左侧导航-->
<aside class="lyear-layout-sidebar">
	<!-- logo -->
	<div id="logo" class="sidebar-header">
		<a href="javascript:;" style="font-size: 25px;font-weight: bold;letter-spacing: 2px;"> 
			图书管理系统
		</a>
	</div>
	<div class="lyear-layout-sidebar-scroll">
		<nav class="sidebar-main">
			<ul class="nav nav-drawer">
				<li class="nav-item active"><a class="multitabs"><i class="mdi mdi-home"></i> <span>管理菜单</span></a></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>管理员信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="admin/createAdmin.action"><i class="mdi mdi mdi-file-outline"></i>新增管理员信息</a></li>
						<li><a class="multitabs" href="admin/getAllAdmin.action"><i class="mdi mdi-format-align-justify"></i>管理员信息列表</a></li>
						<li><a class="multitabs" href="admin/queryAdminByCond.action"><i class="mdi mdi-account-search"></i>管理员信息查询</a></li>
						<li><a class="multitabs" href="admin/prePwd.action"><i class="mdi mdi-account-search"></i>修改密码</a></li>
					</ul></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>用户信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="users/getAllUsers.action"><i class="mdi mdi-format-align-justify"></i>用户信息列表</a></li>
						<li><a class="multitabs" href="users/queryUsersByCond.action"><i class="mdi mdi-account-search"></i>用户信息查询</a></li>
					</ul></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>新闻公告信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="article/createArticle.action"><i class="mdi mdi mdi-file-outline"></i>新增新闻公告信息</a></li>
						<li><a class="multitabs" href="article/getAllArticle.action"><i class="mdi mdi-format-align-justify"></i>新闻公告信息列表</a></li>
						<li><a class="multitabs" href="article/queryArticleByCond.action"><i class="mdi mdi-account-search"></i>新闻公告信息查询</a></li>
					</ul></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>图书类型信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="cate/createCate.action"><i class="mdi mdi mdi-file-outline"></i>新增图书类型信息</a></li>
						<li><a class="multitabs" href="cate/getAllCate.action"><i class="mdi mdi-format-align-justify"></i>图书类型信息列表</a></li>
						<li><a class="multitabs" href="cate/queryCateByCond.action"><i class="mdi mdi-account-search"></i>图书类型信息查询</a></li>
					</ul></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>图书信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="books/createBooks.action"><i class="mdi mdi mdi-file-outline"></i>新增图书信息</a></li>
						<li><a class="multitabs" href="books/getAllBooks.action"><i class="mdi mdi-format-align-justify"></i>图书信息列表</a></li>
						<li><a class="multitabs" href="books/queryBooksByCond.action"><i class="mdi mdi-account-search"></i>图书信息查询</a></li>
					</ul></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>预约单信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="orders/getSendOrders.action"><i class="mdi mdi-format-align-justify"></i>待借出信息列表</a></li>
						<li><a class="multitabs" href="orders/getBackOrders.action"><i class="mdi mdi-account-search"></i>待归还信息列表</a></li>
						<li><a class="multitabs" href="orders/getAllOrders.action"><i class="mdi mdi-format-align-justify"></i>预约单信息列表</a></li>
						<li><a class="multitabs" href="orders/queryOrdersByCond.action"><i class="mdi mdi-account-search"></i>预约单信息查询</a></li>
					</ul></li>
				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>延期申请信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="applys/getAllApplys.action"><i class="mdi mdi-format-align-justify"></i>延期申请信息列表</a></li>
						<li><a class="multitabs" href="applys/queryApplysByCond.action"><i class="mdi mdi-account-search"></i>延期申请信息查询</a></li>
					</ul></li>
				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>图书评价信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="topic/getAllTopic.action"><i class="mdi mdi-format-align-justify"></i>图书评价信息列表</a></li>
						<li><a class="multitabs" href="topic/queryTopicByCond.action"><i class="mdi mdi-account-search"></i>图书评价信息查询</a></li>
					</ul></li>

				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>意见反馈信息管理</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="complains/getAllComplains.action"><i class="mdi mdi-format-align-justify"></i>意见反馈信息列表</a></li>
						<li><a class="multitabs" href="complains/queryComplainsByCond.action"><i class="mdi mdi-account-search"></i>意见反馈信息查询</a></li>
					</ul></li>
				<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i class="mdi mdi-laptop"></i> <span>统计信息</span></a>
					<ul class="nav nav-subnav">
						<li><a class="multitabs" href="admin/chartline.jsp"><i class="mdi mdi-format-align-justify"></i>预约数量统计</a></li>
						<li><a class="multitabs" href="admin/chartpie.jsp"><i class="mdi mdi-format-align-justify"></i>图书评价统计</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
</aside>
<!--End 左侧导航-->


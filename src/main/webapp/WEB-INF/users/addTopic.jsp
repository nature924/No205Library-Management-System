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
<script type="text/javascript" src="js/jquery-1.3.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="js/ajax.js" charset="utf-8"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index/index.action">首页</a>
			<code> &gt; </code>
			评价图书
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
							<span>评价图书</span>
						</h5>
						<div class="blank"></div>
						<form action="index/addTopic.action" name="myform" method="post">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF">评价等级：</td>
									<td width="85%" align="left" bgcolor="#FFFFFF"><input name="num" type="radio" value="1" id="comment_rank1" />
										<img src="themes/ecmoban_dangdang/images/stars1.gif" /> <input name="num" type="radio" value="2"
										id="comment_rank2" /> <img src="themes/ecmoban_dangdang/images/stars2.gif" /> <input name="num" type="radio"
										value="3" id="comment_rank3" /> <img src="themes/ecmoban_dangdang/images/stars3.gif" /> <input name="num"
										type="radio" value="4" id="comment_rank4" /> <img src="themes/ecmoban_dangdang/images/stars4.gif" /> <input
										name="num" type="radio" value="5" checked="checked" id="comment_rank5" /> <img
										src="themes/ecmoban_dangdang/images/stars5.gif" /></td>
								</tr>
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF">评价内容：</td>
									<td align="left" bgcolor="#FFFFFF"><script type="text/javascript" src="ckeditor/ckeditor.js"></script> <textarea
											cols="80" name="contents" id="contents" rows="10">在此添加内容 </textarea> <script type="text/javascript">
												CKEDITOR.replace('contents', {
													language : 'zh-cn'
												});
											</script></td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF"><input type="hidden" name="id" id="id" value="${id }">
										<input type="submit" class="bnt_blue_1" style="border: none;" value="确认发布" /></td>
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

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="footer">
	<div class="footer">
		<div class="footer_nav_box">
			<div class="footer_copyright">
				<span> 
				版权所有 &copy; 
				<a href="admin/index.action"
					target="_blank">后台管理员入口</a>
				</span>
			</div>
		</div>
	</div>
</div>

<%
	String message = (String) session.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	session.removeAttribute("message");
%>
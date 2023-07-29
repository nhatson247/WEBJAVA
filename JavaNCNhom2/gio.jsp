<%@page import="bo.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String ms = request.getParameter("ms");
String ts = request.getParameter("ts");
String gia = request.getParameter("gia");
String sl = request.getParameter("sl");
String anh = request.getParameter("anh");
if (ms != null && ts != null && gia != null && sl != null && anh != null) {
	CGioHang gh = null;
	if (session.getAttribute("gh") == null) {
		gh = new CGioHang();
		session.setAttribute("gh", gh);
	}
	gh = (CGioHang)session.getAttribute("gh");
	gh.Them(ms, ts,Integer.parseInt(gia), 1 , anh);
	 session.setAttribute("gh", gh);
	 response.sendRedirect("htgio.jsp");
}

%>
</body>
</html>
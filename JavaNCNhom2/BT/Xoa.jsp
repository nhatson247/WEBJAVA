<%@page import="tam.giohang"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body>
	<%
	giohang g = (giohang) session.getAttribute("gh");
String[] th = request.getParameterValues("chonHang");
if (request.getParameter("Xoatatca") != null) {
    if (g != null) {
        g.XoaTatCa();
        session.setAttribute("gh", g);
    }
} else if (th != null) {
    g.XoaDaChon(th);
} else {
    String thValue = request.getParameter("th");
    g.Xoa(thValue);
}
session.setAttribute("gh", g);
response.sendRedirect("DatHang.jsp");

%>
</body>
</html>
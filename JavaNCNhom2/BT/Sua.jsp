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
<%
if (session.getAttribute("gh") != null) {
	giohang g = (giohang) session.getAttribute("gh");
    if(g != null){
    String th = request.getParameter("th");
    String sl = request.getParameter("txtsua");
    
    if (th != null && sl != null) {
        g.Them(th, 111, Integer.parseInt(sl));
        session.setAttribute("gh", g);
        response.sendRedirect("DatHang.jsp");
    	}
    } 
}
%>

</body>
</html>
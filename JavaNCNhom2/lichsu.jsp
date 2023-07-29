<%@page import="bean.lichsubean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.CGioHang"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.sachbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="sachController">Trang chủ</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<%
                    CGioHang g = (CGioHang) session.getAttribute("gh");
                    %>
					<li class=""><a href="gioController">Giỏ hàng (<%=(g != null) ? g.ds.size() : 0%>)
					</a></li>
					<li class=""><a href="xacnhanController">Thanh toán</a></li>
					<li class=""><a href="lichsuController">Lịch sử mua hàng</a></li>
				</ul>	
				<form class="navbar-form navbar-left" method="post" action="sachController">
     			 <div class="form-group">
       				 <input type="text" class="form-control" placeholder="Search" name="txttim" id="txttim">
      			</div>
      				<button type="submit" class="btn btn-primary">Tìm</button>
    			</form>
				<ul class="nav navbar-nav navbar-right">
					<%
					khachhangbean kh =(khachhangbean)session.getAttribute("dn");
                    if ( kh == null) {
                    %>
					<li><a data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-log-in"></span> Đăng Nhập
					</a></li>
					<li><a href="dangkyController">
					<span class="glyphicon glyphicon-user"></span> Đăng Ký</a></li>
					<%
                    } else {
                    %>
                    
					<li class="active"><a href="#"><span
							class="glyphicon glyphicon-user"></span>Xin chào <%=kh.getHoten()%></a></li>
					<li><a href="dangxuatController"><span
							class="glyphicon glyphicon-log-out"></span> Đăng Xuất</a></li>
					<%
                    }
                    %>
				</ul>
			</div>
		</div>
	</nav>
	
    <div class="container" style="margin-top: 50px;">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Lịch sử mua hàng</h2>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th> Mã KH </th>
                            <th> Mã Sách </th>
                            <th> Tên Sách </th>
                            <th> Số lượng</th>
                            <th> Giá </th>
                            <th> Thành tiền </th>
                            <th> Đã Mua </th>
                            <th> Ngày Mua </th>
                        </tr>
                    </thead>
                    <tbody>
                         <%  ArrayList<lichsubean> dslsh=(ArrayList<lichsubean>)request.getAttribute("dslsh");
                		 for (lichsubean lsh : dslsh) { %>
                        <tr>
                            <td><%= lsh.getMakh() %></td>
                            <td><%= lsh.getMasach() %></td>
                            <td><%= lsh.getTensach() %></td>
                            <td><%= lsh.getSoluongmua() %></td>
                            <td><%= lsh.getGia() %></td>
                            <td><%= lsh.getThanhtien() %></td>
                            <td><%= lsh.isDamua() ? "Đã thanh toán" : "Chưa thanh toán" %></td>
                            <td><%= lsh.getNgaymua() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>Đăng Nhập</h3>
					<form method="post" action="dangnhapController" class="form-flex">
						<div class="form-group">
							<label for="txttk">Tên Tài Khoản:</label> <input type="text"
								class="form-control" id="txtun" name="txtun"
								placeholder="Nhập Tài Khoản">
						</div>
						<div class="form-group">
							<label for="txtmk">Nhập Mật Khẩu:</label> <input type="password"
								class="form-control" id="txtpass" name="txtpass"
								placeholder="Nhập Mật Khẩu">
						</div>
						<br> <input type="submit" name="but" value="login"
							class="btn btn-primary btn-block btn-flat">
					</form>
					<%
                    String tb = request.getParameter("tb");
                    if (request.getParameter("tb") != null) {
                    %>
					<br> <b> Đăng nhập sai </b>
					<%
                    }
                    %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

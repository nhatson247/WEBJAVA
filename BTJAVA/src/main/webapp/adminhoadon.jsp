<%@page import="bean.adminxacnhanbean"%>
<%@page import="bean.chitiethoadonbean"%>
<%@page import="bean.admindangnhapbean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html style="height: auto; min-height: 100%;">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>DT Shop</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="./Themes/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./Themes/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="./Themes/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./Themes/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="./Themes/dist/css/skins/_all-skins.min.css">
</head>
<body class="skin-blue sidebar-mini"
	style="height: auto; min-height: 100%;">
	<!-- Site wrapper -->
	<div class="wrapper" style="height: auto; min-height: 100%;">

		<header class="main-header">
			<!-- Logo -->
			<a href="admintrangchuController" class="logo"> <span
				class="logo-mini"><b>Shoes House</b></span> <span class="logo-lg"><b>Shoes</b>House</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

				<div class="navbar-custom-menu">
					<%
					admindangnhapbean admin =(admindangnhapbean)session.getAttribute("dn");
                    if ( admin == null) {
                    %>
					<ul class="nav navbar-nav">
						<li>
						<a href="admindangnhapController"  class="hidden-xs"> Sign In</a>
						</li>
					</ul>
					<%}else{ %>
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"> <img src="dist/img/user2-160x160.jpg"
								class="user-image" alt="User Image"> <span
								class="hidden-xs"><%=admin.getTenDangNhap()%></span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="dist/img/user2-160x160.jpg" class="img-circle"
									alt="User Image">
									<p>
										<%=admin.getTenDangNhap() %>
									</p></li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="admindoimkController"
											class="btn btn-default btn-flat">Change PassWord</a>
									</div>
									<div class="pull-right">
										<a href="admindangxuatController"
											class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul></li>
					</ul>
					<%} %>
				</div>
			</nav>
		</header>


		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar" style="height: auto;">
				<!-- Sidebar user panel -->

				<!-- search form -->

				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu tree" data-widget="tree">
					<li class="treeview"><a href="#"> <i class="fa fa-home"></i>
							<span>Trang Chủ</span>
					</a></li>
					<li class="treeview active menu-open"><a href="#"> <i
							class="fa fa-folder"></i> <span>Quản Lý Dữ Liệu</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="adminloaiController"><i class="fa fa-group"></i>Quản
									lý Loại Giày</a></li>
							<li><a href="admingiayController"><i class="fa fa-user"></i>Quản
									Lý Giày</a></li>
							<li><a href="adminindsController"><i
									class="fa fa-vcard-o"></i>Quản Lý Khách Hàng</a></li>

						</ul></li>
					<li class="treeview active menu-open"><a href="#"> <i
							class="fa fa-shopping-cart"></i> <span>Quản Lý Đơn Hàng</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="adminxacnhanController"><i
									class="fa fa-search-plus"></i>Xác Nhận Hóa Đơn</a></li>

						</ul></li>
				</ul>
			</section>
		</aside>


		<div class="content-wrapper" style="min-height: 645.2px;">
			<section class="content-header">
				<h1>Xác Nhận Hóa Đơn</h1>
			</section>

			<section class="content">
				<div class="box box-primary">
					<div class="box-body">
						<% 
					ArrayList<chitiethoadonbean> cthd = (ArrayList<chitiethoadonbean>) request.getAttribute("ds");
					int soLuongLoai = cthd.size();
					%>
						<p style="margin-top: 8px">
							Có Tổng cộng <strong><%= cthd.size() %></strong> hóa đơn
						</p>
						<div id="searchResult">

							<table class="table table-bordered table-hover">
								<thead>
									<tr class="bg-primary">
										<th>Họ Tên</th>
										<th>Tên Giày</th>
										<th>Size</th>
										<th>Số Lượng Mua</th>
										<th>Giá</th>
										<th>Thành Tiền</th>
										<th>NgayMua</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									if (request.getAttribute("ds") != null) {
										ArrayList<adminxacnhanbean> dsxn = (ArrayList<adminxacnhanbean>) request.getAttribute("ds");
										for (adminxacnhanbean xn : dsxn) {
									%>
									<tr>
										<td><%=xn.getHoten()%></td>
										<td><%=xn.getTengiay()%></td>
										<td><%=xn.getSize()%></td>
										<td><%=xn.getSoLuongMua()%></td>
										<td><%=xn.getGia()%></td>
										<td><%=xn.getThanhtien()%></td>
										<td><%=xn.getNgaymua() %></td>
										<td class="text-right" style="width: 10%"><a
											href="adminxacnhanController?mact=<%=xn.getMaChiTietHD()%>&tab=sua"
											class="btn btn-success glyphicon glyphicon-ok"></a> <a
											href="adminxacnhanController?mact=<%=xn.getMaChiTietHD()%>&tab=xoa"
											class="btn btn-danger glyphicon glyphicon-trash"></a></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			<strong>Copyright © 2023 <a href="/">DT Shop</a>.
			</strong>
		</footer>
		<script src="./Themes/bower_components/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script
			src="./Themes/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- SlimScroll -->
		<script
			src="./Themes/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="./Themes/bower_components/fastclick/lib/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="./Themes/dist/js/adminlte.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="./Themes/dist/js/demo.js"></script>
		<script>$(document).ready(function () {
    $('.sidebar-menu').tree()
  })</script>
	</div>
</body>
</html>
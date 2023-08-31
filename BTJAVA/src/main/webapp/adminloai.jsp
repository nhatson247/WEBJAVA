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
			<%
			String ml = (String) request.getAttribute("maloai");
			String tenloai = (String) request.getAttribute("tenloai");
			%>
			<section class="content-header">
				<h1>Quản Lí Loại Sách</h1>

				<form action="adminloaiController" method="post"
					class="table table-bordered table-hover mt-3">
					<div class="form-group">
						<label>Mã loại:</label> <input type="text" class="form-control"
							name="txtmaloai" value="<%=(ml == null) ? "" : ml%>" required>
					</div>
					<div class="form-group">
						<label>Tên loại:</label> <input type="text" class="form-control"
							name="txttenloai" value="<%=(tenloai == null) ? "" : tenloai%>"
							required>
					</div>
					<button type="submit"
						class="btn btn-primary glyphicon glyphicon-plus" name="butadd"></button>
					<button type="submit"
						class="btn btn-success glyphicon glyphicon-edit" name="butupdate"></button>
				</form>
			</section>

			<section class="content">
				<div class="box box-primary">
					<div class="box-body">
						<form action="adminloaiController" method="post">
							<div class="input-group input-group-sm">
								<input type="search" class="form-control" name="txttim"
									placeholder="Search theo tên loại, mã loại"
									value="<%= (request.getParameter("txttim")== null) ? "" : request.getParameter("txttim") %>">
								<span class="input-group-btn">
									<button class="btn btn-info" type="submit">
										<i class="glyphicon glyphicon-search"></i> <strong>
											Tìm kiếm</strong>
									</button>
								</span>
							</div>
						</form>
						<%
						ArrayList<loaibean> dsLoai = (ArrayList<loaibean>) request.getAttribute("ds");
						int soLuongLoai = dsLoai.size();
						%>
						<p style="margin-top: 8px">
							Có Tổng cộng <strong><%= dsLoai.size() %></strong> loại
						</p>
						<div id="searchResult">

							<table class="table table-bordered table-hover">
								<thead>
									<tr class="bg-primary">
										<th>Mã Loại</th>
										<th>Tên Loại</th>
										<th>Thao Tác</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									if (request.getAttribute("ds") != null) {
										ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("ds");
										for (loaibean loai : dsloai) {
									%>
									<tr>
										<td><%=loai.getMaloai()%></td>
										<td><%=loai.getTenloai()%></td>
										<td><a
											href="adminloaiController?ml=<%=loai.getMaloai()%>&tab=select">chọn</a>
										</td>
										<td class="text-right" style="width: 10%"><a
											href="adminloaiController?ml=<%=loai.getMaloai()%>&tab=delete"
											class="btn btn-danger glyphicon glyphicon-trash"></a></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
					<%
					int totalPages = (Integer) request.getAttribute("totalPages");
					int currentPage = (Integer) request.getAttribute("currentPage");
					%>
					<div class="text-center d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>">
									<a class="page-link"
									href="adminloaiController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber"
									tabindex="-1" aria-disabled="true">Previous</a>
								</li>
								<%
								for (int i = 1; i <= totalPages; i++) {
								%>
								<li class="page-item <%=currentPage == i ? "active" : ""%>">
									<a class="page-link"
									href="adminloaiController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=i%>"><%=i%></a>
								</li>
								<%
								}
								%>
								<li
									class="page-item <%=currentPage == totalPages ? "disabled" : ""%>">
									<a class="page-link"
									href="adminloaiController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=currentPage + 1%>">Next</a>
								</li>
							</ul>
						</nav>
					</div>
						</div>
					</div>
				</div>
			</section>
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
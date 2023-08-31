<%@page import="bean.giaybean"%>
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
<style>
img{
height: 150px;
}
</style>
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
		    String magiay = (String) request.getAttribute("magiay");
		    String tengiay = (String) request.getAttribute("tengiay");
		    String size = (String) request.getAttribute("size");
		    String soluong = (String) request.getAttribute("soluong");
		    String gia = (String) request.getAttribute("gia");
		    String anh = (String) request.getAttribute("anh");
		    String tieude = (String) request.getAttribute("tieude");
		    String maloai = (String) request.getAttribute("maloai");
		%>
			<section class="content-header">
				<h1>Quản Lí Giày</h1>

				<form action="admingiayController" method="post" enctype="multipart/form-data" class="table table-bordered table-hover mt-3">
					<div class="form-group">
						<label>Mã Giày:</label> <input type="text" class="form-control"
							name="txtmagiay"  value="<%=(magiay == null) ? "" : magiay%>"
							required>
					</div>
					<div class="form-group">
						<label>Tên Giày:</label> <input type="text" class="form-control"
							name="txttengiay" value="<%=(tengiay == null) ? "" : tengiay%>"
							required>
					</div>
					<div class="form-group">
						<label>Size:</label> <input type="text" class="form-control"
							name="txtsize"  value="<%=(size == null) ? "" : size%>"
							required>
					</div>
					<div class="form-group">
						<label>Số Lượng:</label> <input type="number" class="form-control"
							name="txtsoluong" 
							required>
					</div>
					<div class="form-group">
						<label>Giá:</label> <input type="number" min="0" class="form-control"
							name="txtgia" value="<%=(gia == null) ? "" : gia%>"
							required>
					</div>
					<div class="form-group">
						<label>Mã Loại:</label> <input type="text" class="form-control"
							name="txtmaloai"  value="<%=(maloai == null) ? "" : maloai%>"
							required>
					</div>
					<div class="form-group">
					<img  src="./img/product4/<%=(anh == null) ? "" : anh%>"
                         class="profile-user-img "
                         alt="Ảnh Sách">
						<label>Ảnh:</label> <input type="file" class="form-control"
							name="txtanh"  value="<%=(anh == null) ? "" : anh%>"
							required>
					</div>
					<div class="form-group">
						<label>Tiêu Đề:</label> <input type="text" class="form-control"
							name="txttieude" value="<%=(tieude == null) ? "" : tieude%>"
							required>
					</div>
					<button type="submit" class="btn btn-primary glyphicon glyphicon-plus" name="butadd"></button>
					<button type="submit" class="btn btn-success glyphicon glyphicon-edit" name="butupdate"></button>
				</form>
			</section>

			<section class="content">
				<div class="box box-primary">
					<div class="box-body">
						<form action="admingiayController" method="post">
							<div class="input-group input-group-sm">
								<input type="search" class="form-control" name="txttim"
									placeholder="Search"
									value="<%= (request.getParameter("txttim")== null) ? "" : request.getParameter("txttim") %>">
								<span class="input-group-btn">
									<button class="btn btn-info" type="submit">
										<i class="glyphicon glyphicon-search"></i> <strong>
											Tìm kiếm</strong>
									</button>
								</span>
							</div>
						</form>
						<div id="searchResult">
						<%
						ArrayList<giaybean> dsGiay = (ArrayList<giaybean>) request.getAttribute("dss");
						int soLuongGiay = dsGiay.size();
						%>
							<p style="margin-top: 8px">
								Có <strong><%= dsGiay.size() %></strong> Giày
							</p>

							<!--begin: Employee-->
							<div class="row">
										<%
									if (request.getAttribute("dss") != null) {
										ArrayList<giaybean> dsgiay = (ArrayList<giaybean>) request.getAttribute("dss");
										for (giaybean giay : dsgiay) {
									%>
								<div class="col-sm-4">
									<div class="box box-primary">
										<div class="box-body box-profile">
											<span class="input-group-btn"> 
											<a
												href="admingiayController?mg=<%=giay.getMagiay() %>&tab=delete" 
												class="btn btn-danger pull-right">
													<i class="glyphicon glyphicon-trash" title="Xóa"></i>
											</a>
											<a
												href="admingiayController?mg=<%=giay.getMagiay() %>&tab=select" 
												class="btn btn-success pull-right">
													<i class="glyphicon glyphicon-ok" title="Chọn"></i>
											</a>
											</span>
											<img src="<%=giay.getAnh() %>" class="profile-user-img img-responsive img-circle">
											<h3 class="profile-employeename text-center"><%=giay.getTengiay()%></h3>
											<p class="text-BirthDate text-center">Mã Giày: <%=giay.getMagiay() %></p>
											<ul class="list-group list-group-unbordered">
												<li class="list-group-item"><b>Loại:</b> 
												<span class="pull-right"><%=giay.getMaloai() %></span></li>
												<li class="list-group-item"><b>Giá:</b> 
												<span class="pull-right"> $<%=giay.getGia() %></span></li>
												<li class="list-group-item"><b>Số Lượng:</b> 
												<span class="pull-right"><%=giay.getSoluong() %></span></li>
											</ul>
											<div class="box-body">
												<strong><i class="fa fa-file-text-o margin-r-5"></i>Tiêu Đề:</strong>
												<textarea class="form-control" rows="3" placeholder=""><%=giay.getTieude()%></textarea>
											</div>

										</div>
									</div>
								</div>
								<%
										}
									}
								%>
							</div>
						</div>
							<% Integer totalPages = (Integer) request.getAttribute("totalPages");
				   Integer currentPage = (Integer) request.getAttribute("currentPage");
				%>
					<!-- Hiển thị nút phân trang -->
					<div class="text-center d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>">
									<a class="page-link"
									href="admingiayController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber"
									tabindex="-1" aria-disabled="true">Previous</a>
								</li>
								<%
								for (int i = 1; i <= totalPages; i++) {
								%>
								<li class="page-item <%=currentPage == i ? "active" : ""%>">
									<a class="page-link"
									href="admingiayController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=i%>"><%=i%></a>
								</li>
								<%
								}
								%>
								<li
									class="page-item <%=currentPage == totalPages ? "disabled" : ""%>">
									<a class="page-link"
									href="admingiayController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=currentPage + 1%>">Next</a>
								</li>
							</ul>
						</nav>
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
    <script src="./Themes/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="./Themes/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
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
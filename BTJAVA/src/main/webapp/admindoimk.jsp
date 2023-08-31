<%@page import="bean.admindangnhapbean"%>
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
<!-- Bootstrap 3.3.7 -->
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
						<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
						<img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image"> 
						<span class="hidden-xs"><%=admin.getTenDangNhap()%></span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header">
								<img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
									<p>
										<%=admin.getTenDangNhap() %>
									</p>
								</li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="admindoimatkhauController" class="btn btn-default btn-flat">Change PassWord</a>
									</div>
									<div class="pull-right">
										<a href="admindangxuatController" class="btn btn-default btn-flat">Sign out</a>
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Change PassWord</h1>
			</section>

			<section class="content">
				<div class="box box-primary">
					<div class="box-body">
						<form class="form-horizontal" action="admindoimkController" method="post">

							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Current Password</label>
								<div class="col-sm-10">
									<input type="password" name="oldPass" class="form-control" >
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">New Password</label>
								<div class="col-sm-10">
									<input type="password" name="newPass" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Confirm Password</label>
								<div class="col-sm-10">
									<input type="password" name="confirmNewPass" class="form-control">
								</div>
							</div>

							<div class="col-xs-8">
								<span class="field-validation-valid text-danger"
									data-valmsg-for="" data-valmsg-replace="true"></span>
							</div>
							     <%
							String successParam = request.getParameter("success");
							if (successParam != null && successParam.equals("true")) {
							    // Hiển thị thông báo "Đổi mật khẩu thành công"
							%>
							<div class="alert alert-success">
		                      Change password successfully
		                     </div>
							<%
							}
							%>
                          <%
						String errorMessage = (String)request.getAttribute("errorMessage");
						if (errorMessage != null && !errorMessage.isEmpty()) {
						%>
						    <div class="alert alert-danger">
		                      <%= request.getAttribute("errorMessage") %>
		                     </div>
						<%
						}
						%>
                        <div class="text-center">
                        <%
                        admindangnhapbean tk =(admindangnhapbean)session.getAttribute("dn");
                        if ( tk != null) {
                        %>
                        <input type="hidden" name="tendn" class="form-control" value="<%=tk.getTenDangNhap()%>" required>
                        <%} %>
                        </div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">
										<i></i>Change PassWord
									</button>
									<a href="admintrangchuController" class="btn btn-default">Come Back</a>
								</div>
							</div>
						</form>
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

		<!-- Control Sidebar -->


	</div>
	<!-- ./wrapper -->
	<!-- jQuery 3 -->
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



</body>
</html>
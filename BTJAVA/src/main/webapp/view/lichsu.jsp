
<%@page import="bo.giohangbo"%>
<%@page import="bean.lichsubean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="assets/logo.png" />
    <title>Shoes Houes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">
    <!-- Css Styles -->
	<link href="css/chitiet.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<style>
.update {
	height: 45px;
	margin: 28px 0 10px 10px;
}
</style>
</head>
<body>
	  <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
              <%
					khachhangbean kh =(khachhangbean)session.getAttribute("dn");
                    if ( kh == null) {
                    %>
            <div class="offcanvas__links">
                <a href="dangnhapController">Sign in</a>
            </div>
            <%}else {%>
			<div class="offcanvas__top__hover">
				<span> Hello <b class="name"> <%=kh.getHoten()%></b><i
					class="arrow_carrot-down"></i></span>
				<ul>
					<li><a class="dropdown-item" href="doimkController">Change
							Password</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="dangxuatController">Logout</a></li>
				</ul>
			</div>
			<%} %>
		</div>
        
        <div class="offcanvas__nav__option">
         <%
                    giohangbo g = (giohangbo) session.getAttribute("gh");
                    %>
            <a href="giohangController"><img src="img/icon/cart.png" alt=""> <span class="text-primary"><%=(g != null) ? g.ds.size() : 0 %></span></a>   	
            <div class="price">$<%=(g != null) ? g.Tongtien() : 0  %></div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
    <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 7-day return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                        <%
                    if ( kh == null) {
                    %>
                            <div class="header__top__links">
                                <a href="dangnhapController">Sign in</a>
                            </div>
                            <%}else {%>
							<div class="header__top__hover">
								<span> Hello <b class="name"> <%=kh.getHoten()%></b><i
									class="arrow_carrot-down"></i></span>
								<ul>
									<li><a class="dropdown-item" href="doimkController">Change
											Password</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="dangxuatController">Logout</a></li>
								</ul>
							</div>
							<%
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="trangchuController"><img src="assets/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="trangchuController">Home</a></li>
                            <li><a href="giayController">Shop</a></li>
                            <li class="active"><a href="lichsuController">History</a></li>
                            <li><a href="thanhtoanController">Check Out</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="giohangController"><img src="img/icon/cart.png"> <span class="text-primary"><%=(g != null) ? g.ds.size() : 0 %></span></a>
                        <div class="price">$<%=(g != null) ? g.Tongtien() : 0 %></div>
                    </div>
                </div>
                
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shop</h4>
						<div class="breadcrumb__links">
							<a href="giayController">Home</a> <span>History</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="shop__sidebar__search">
		<form action="lichsuController" method="post">
			<input class="form-control mr-sm-2" type="search" name="txttim"
				placeholder="Search theo mã hóa đơn, tên sản phẩm">
			<button type="submit">
				<span class="icon_search"></span>
			</button>
		</form>
	</div>
	<div class="container" style="margin-top: 50px; margin-bottom: 50px">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center">Purchase history</h2>
				<section class="content">
				<h3>Hóa đơn chưa thanh toán:</h3>
					<div class="box box-primary">
						<div class="box-body">
							<p style="margin-top: 8px">
							<%ArrayList<lichsubean> dslshchuatt = (ArrayList<lichsubean>) request.getAttribute("dslshchuatt"); %>
							<%ArrayList<lichsubean> dslshdatt = (ArrayList<lichsubean>) request.getAttribute("dslshdatt"); %>
								
								<%if (dslshchuatt.size() > 0){ %>
								Có Tổng cộng <strong><%=dslshchuatt.size() %></strong> kết quả
							</p>
							<div id="searchResult">
								<table class="table table-bordered table-hover">
									<thead>
										<tr class="bg-primary">
											<th>Mã Hóa Đơn</th>
											<th>Mã KH</th>
											<th>Mã Giày</th>
											<th>Tên Giày</th>
											<th>Số lượng</th>
											<th>Giá</th>
											<th>Thành tiền</th>
											<th>Đã Mua</th>
											<th>Ngày Mua</th>
										</tr>
									</thead>
									<tbody>
										<%
										
										for (lichsubean lsh : dslshchuatt) {
										%>
										<tr>
											<td><%=lsh.getMahoadon()%></td>
											<td><%=lsh.getMakh()%></td>
											<td><%=lsh.getMagiay()%></td>
											<td><%=lsh.getTengiay()%></td>
											<td><%=lsh.getSoluongmua()%></td>
											<td><%=lsh.getGia()%></td>
											<td><%=lsh.getThanhtien()%></td>
											<td><%=lsh.isDamua() ? "Đã thanh toán" : "Chưa thanh toán"%></td>
											<td><%=lsh.getNgaymua()%></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
								<% } else { %>
								<p>Không có đơn hàng chưa thanh toán.</p>
								<% } %>
						</div>
					</div>
					<%
					int totalPages = (Integer) request.getAttribute("totalPages");
					int currentPage = (Integer) request.getAttribute("currentPage");
					%>
					<!-- Hiển thị nút phân trang -->
					<div class="text-center d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>">
									<a class="page-link"
									href="lichsuController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber"
									tabindex="-1" aria-disabled="true">Previous</a>
								</li>
								<%
								for (int i = 1; i <= totalPages; i++) {
								%>
								<li class="page-item <%=currentPage == i ? "active" : ""%>">
									<a class="page-link"
									href="lichsuController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=i%>"><%=i%></a>
								</li>
								<%
								}
								%>
								<li
									class="page-item <%=currentPage == totalPages ? "disabled" : ""%>">
									<a class="page-link"
									href="lichsuController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=currentPage + 1%>">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</section>

				<!-- Hiển thị hóa đơn đã thanh toán -->
				<h3>Hóa đơn đã thanh toán:</h3>
				<section class="content">
					<div class="box box-primary">
						<div class="box-body">
							<p style="margin-top: 8px">
							<% if (dslshdatt.size() > 0) { %>
								Có Tổng cộng <strong><%=dslshdatt.size() %></strong> kết quả
							</p>
							<div id="searchResult">

								<table class="table table-bordered table-hover">
									<thead>
										<tr class="bg-primary">
											<th>Mã Hóa Đơn</th>
											<th>Mã KH</th>
											<th>Mã Giày</th>
											<th>Tên Giày</th>
											<th>Số lượng</th>
											<th>Giá</th>
											<th>Thành tiền</th>
											<th>Đã Mua</th>
											<th>Ngày Mua</th>
										</tr>
									</thead>
									<tbody>
										<%
										
										for (lichsubean lsh : dslshdatt) {
										%>
										<tr>
											<td><%=lsh.getMahoadon()%></td>
											<td><%=lsh.getMakh()%></td>
											<td><%=lsh.getMagiay()%></td>
											<td><%=lsh.getTengiay()%></td>
											<td><%=lsh.getSoluongmua()%></td>
											<td><%=lsh.getGia()%></td>
											<td><%=lsh.getThanhtien()%></td>
											<td><%=lsh.isDamua() ? "Đã thanh toán" : "Chưa thanh toán"%></td>
											<td><%=lsh.getNgaymua()%></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
							<% }else{%>
							<p>Không có đơn hàng đã thanh toán.</p>
								<% } %>
						</div>
					</div>
					<!-- Hiển thị nút phân trang -->
					<div class="text-center d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>">
									<a class="page-link"
									href="lichsuController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber"
									tabindex="-1" aria-disabled="true">Previous</a>
								</li>
								<%
								for (int i = 1; i <= totalPages; i++) {
								%>
								<li class="page-item <%=currentPage == i ? "active" : ""%>">
									<a class="page-link"
									href="lichsuController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=i%>"><%=i%></a>
								</li>
								<%
								}
								%>
								<li
									class="page-item <%=currentPage == totalPages ? "disabled" : ""%>">
									<a class="page-link"
									href="lichsuController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>
									&pageNumber=<%=currentPage + 1%>">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</section>
			</div>
		</div>
	</div>

	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>

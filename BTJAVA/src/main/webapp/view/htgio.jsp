
<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.giaybean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="assets/logo.png" />
    <title>Shouse House</title>
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
                            <li class="active"><a href="giayController">Shop</a></li>
                            <li><a href="lichsuController">History</a></li>
                            <li><a href="xacnhanController">Check Out</a></li>
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

	<section class="h-100 gradient-custom">
		<div class="container py-5">
			<div class="row d-flex justify-content-center my-4">
				<div class="col-md-8">
					<div class="card mb-4">

						<form method="post" action="xoaController">
						<div class="card-header py-3">
						<h5 class="mb-0">
								Cart -
								<%= (g != null) ? g.ds.size() : 0 %>
								items
							</h5>
							<div class="d-flex justify-content-end">
							 <% if (g != null && !g.ds.isEmpty()) { %>
							<button type="submit" name="Xoatatca" value="Xóa Tất Cả"
								class="btn btn-dark btn-sm me-1 mb-2">
								<i class="fa-solid fa-trash-can"></i>
							</button>
							<button type="submit" name="Xoachon" value="Xóa Chọn"
								class="btn btn-warning btn-sm me-1 mb-2">
								<i class="fa-regular fa-square-minus"></i>
							</button>
							<%}%>
							</div>
						</div>

							<div class="card-body">
								<%
                            if (g == null) {
                                g = new giohangbo();
                                session.setAttribute("gh", g);
                            }
						
                            for (int i = 0; i < g.ds.size(); i++) {
                                giaybean ctgh = g.ds.get(i);
                            %>

								<div class="row">
									<div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
										<div class="card-header py-3">
											<input type="checkbox" name="chonHang"
												value="<%=ctgh.getMagiay()%>"> items -
											<%=i + 1%>
										</div>
										<div class="bg-image hover-overlay hover-zoom ripple rounded"
											data-mdb-ripple-color="light">
											<img src="<%=ctgh.getAnh()%>" class="w-100"
												alt="<%=ctgh.getTengiay()%>" />
										</div>
										<!-- Image -->
									</div>

									<div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
										<!-- Data -->
										<p>
											<strong><%=ctgh.getTengiay()%></strong>
										</p>
										<p>
											Price:
											$<%=ctgh.getGia()%></p>
										<p>
											Size:
											<%=ctgh.getSize() %>
											</p>
										<form></form>
										<form action="xoaController?mg=<%=ctgh.getMagiay()%>"
											method="post">
											<button type="submit" name="tralai"
												class="btn btn-danger btn-sm me-1 mb-2">
												<i class="fas fa-trash"></i>
											</button>
										</form>
									</div>

									<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
										<!-- Quantity -->
										<div class="d-flex mb-4" style="max-width: 300px">
											<form action="suaController?mg=<%=ctgh.getMagiay()%>"
												method="post" class="d-flex">
												<div class="form-outline">
													<label class="form-label" for="quantity<%=i%>">Quantity</label>
													<input id="quantity<%=i%>" min="0" name="txtsua"
														value="<%=ctgh.getSoluong()%>" type="number"
														class="form-control" />
												</div>
												<input type="submit" name="Capnhat" value="Update"
													class="btn btn-primary mb-2 update">
											</form>
										</div>
										<!-- Quantity -->


										<!-- Price -->
										<p class="text-start text-md-center">Total:
											<strong>$<%=ctgh.getThanhtien()%></strong>
										</p>
										<!-- Price -->
									</div>
								</div>
								<hr class="my-4" />
						
						<%
							}
							%>
							
						</div>
					</form>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card mb-4">
						<div class="card-header py-3">
							<h5 class="mb-0">Summary</h5>
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
									Subtotal <span><%=g.Tongtien()%>$</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center px-0">
									Estimated Delivery & Handling <span>Free</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
									<div>
										<strong>Total</strong>
									</div> <span><strong><%=g.Tongtien()%>$</strong></span>
								</li>
							</ul>

							<a href="xacnhanController" type="button" class="btn btn-primary btn-lg btn-block" <% if (g == null || g.Tongtien() == 0) { %>disabled <% } %>>
							    Go to checkout
							</a>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
</body>
</html>
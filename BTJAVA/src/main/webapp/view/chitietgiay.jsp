<%@page import="bo.giohangbo"%>
<%@page import="bo.hoadonbo"%>
<%@page import="bo.lichsuhangbo"%>
<%@page import="bean.lichsubean"%>
<%@page import="bean.sizebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.giaybean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="assets/logo.png" />
    <title>Shoes House</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
    .name{
    color: #f44336;
    font-weight: bold;
    }    
    .dropdown-item{
    text-align: left;
    }
    .rating i{
    color: #f7941d;
    }
    </style>
</head>
<body>
    <!-- Offcanvas Menu Begin -->
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
                            <li><a href="thanhtoanController">Check Out</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="giohangController"><img src="img/icon/cart.png"> <span class="text-primary"><%=(g != null) ? g.ds.size() : 0 %></span></a>
                        <div class="price">$<%=(g != null) ? g.Tongtien() : 0 %></div>
                    </div>
                      <div class="shop__sidebar__search">
							<form action="giayController" method="post">
								<input class="form-control mr-sm-2" type="search" name="txttim"
									placeholder="Search..." value="<%= (request.getParameter("txttim")== null) ? "" : request.getParameter("txttim") %>">
								<button type="submit">
									<span class="icon_search"></span>
								</button>
							</form>
					</div>
                </div>
                
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Product Details</h4>
						<div class="breadcrumb__links">
							<a href="giayController">Home</a>
							<%
							String ml = null;
							if (request.getAttribute("ctgiay") != null) {
								giaybean dsct = (giaybean) request.getAttribute("ctgiay");
								ml = dsct.getMaloai();
							}
							ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
							if (request.getAttribute("dsloai") != null) {
								for (loaibean loai : dsloai) {
							%>
							<%
							if (ml != null && ml.equals(loai.getMaloai())) {
							%>
							<a href="giayController?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
							<%
							}
							%>

							<%
							}
							}
							%>
							<%
							if (request.getAttribute("ctgiay") != null) {
								giaybean dsct = (giaybean) request.getAttribute("ctgiay");
							%>
							<span class="breadcrumb-item active" aria-current="page"><%=dsct.getTengiay()%></span>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!-- Breadcrumb -->
	   
	<!-- Product section-->
	<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <%
        if (request.getAttribute("ctgiay") != null) {
            giaybean dsct = (giaybean) request.getAttribute("ctgiay");
        %>
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6">
                <img class="card-img-top mb-5 mb-md-0" src="<%=dsct.getAnh()%>"
                     alt="<%=dsct.getTengiay()%>" />
            </div>
            <div class="col-md-6">
             <span><i class="fa-solid fa-eye"></i> <%=dsct.getSoluotxem() %></span>
                <div class="small mb-1">
                    ID: <%=dsct.getMagiay()%>
                </div>
                <h1 class="display-5 fw-bolder"><%=dsct.getTengiay()%></h1>
                <div class="fs-5 mb-5">
                    <div class="rating">
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                            class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                            class="fa fa-star-o"></i>
                    </div>
                    <span class="text-decoration-line-through ">$500</span>
                    <span class="name">$<%=dsct.getGia()%></span>
                </div>
                <p class="lead"><%=dsct.getTieude()%></p>
                <form class="d-flex align-items-center" action="giohangController"
                      method="post">
                    <label for="inputQuantity" class="me-2">Quantity:</label>
                    <input class="form-control text-center me-3" id="inputQuantity"
                           type="number" name="sl" min="1"
                           value="<%=request.getAttribute("slgiay")%>"
                           style="max-width: 5rem" />
                           
                    <% if (request.getAttribute("dssize") != null) { %>
                        <label for="size" class="me-2">Size:</label>
                        <select class="form-control me-3" id="size" name="size" style="width: auto;">
                            <%
                            ArrayList<sizebean> dssize = (ArrayList<sizebean>) request.getAttribute("dssize");
                            for (sizebean size : dssize) {
                            %>
                            <option value="<%=size.getTensize()%>"><%=size.getTensize()%></option>
                            <%
                            }
                            %>
                        </select>
                    <% } %>
                    <input type="hidden" name="mg" value="<%=dsct.getMagiay()%>" />
                    <button type="submit" class="btn btn-outline-dark mt-auto">Add to cart</button>
                </form>
            </div>
        </div>
        <% } else { %>
        <div class="text-center">
            <p>No product information found.</p>
            <a href="giayController" class="btn btn-primary">Back to main page</a>
        </div>
        <% } %>
    </div>
</section>
	
<!-- 	ds lien quan -->
        <section class="related spad bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                        <%
	                    if (request.getAttribute("ctloai") != null) {
	                        ArrayList<giaybean> ctgiay = (ArrayList<giaybean>) request.getAttribute("ctloai");
	                        for (giaybean lct : ctgiay) { 
						%>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                        <img src="<%=lct.getAnh()%>"> 
                            <span class="label">New</span>
                        </div>
                        <div class="product__item__text">
                            <h6><%=lct.getTengiay() %></h6>
                            <a href="chitietgiayController?mg=<%=lct.getMagiay()%>&sl=1&size=36" class="add-cart">+ Add To Cart</a>
                            <h5 >$<%=lct.getGia() %></h5>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <span><i class="fa-solid fa-eye"></i> <%=lct.getSoluotxem() %></span>
                        </div>
                    </div>
                    
                </div>
                <%
	                        }
	                        }
                        %>
                </div>
            </div>
    </section>
<!--     ds view  -->
     <section class="related spad bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Products Top View</h3>
                </div>
            </div>
            <div class="row">
                        <%
                        if (request.getAttribute("dsTopLuotXem") != null) {
                            ArrayList<giaybean> view = (ArrayList<giaybean>) request.getAttribute("dsTopLuotXem");
                            for (giaybean gct : view) { 
						%>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                        <img src="<%=gct.getAnh()%>"> 
                            <span class="label">Hot</span>
                        </div>
                        <div class="product__item__text">
                            <h6><%=gct.getTengiay() %></h6>
                            <a href="chitietgiayController?mg=<%=gct.getMagiay()%>&sl=1&size=36" class="add-cart">+ Add To Cart</a>
                            <h5>$<%=gct.getGia() %> </h5>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <span><i class="fa-solid fa-eye"></i> <%=gct.getSoluotxem() %></span>
                   
                        </div>
                    </div>
                    
                </div>
                <%
	                        }
	                        }
                        %>
                </div>
            </div>
    </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

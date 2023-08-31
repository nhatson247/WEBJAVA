<%@page import="bo.giohangbo"%>
<%@page import="bean.lichsubean"%>
<%@page import="bo.giaybo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.giaybean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/support.css" type="text/css">
    <style>
    .shop__product__option__right .nice-select .list{
    z-index: 200;
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
                            <li class="active"><a href="trangchuController">Home</a></li>
                            <li><a href="giayController">Shop</a></li>
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
                </div>
                
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Summer Collection</h6>
                                <h2>Fall - Winter Collections 2030</h2>
                                <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                                <a href="giayController" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="img/hero/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Summer Collection</h6>
                                <h2>Fall - Winter Collections 2030</h2>
                                <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                                <a href="giayController" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->


    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Best Sellers</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
			 
			<div class="row product__filter" id="MixItUpDDEDFA" style="">
			 <% 
             if (request.getAttribute("dsTopLuotXem") != null) {
                 ArrayList<giaybean> view = (ArrayList<giaybean>) request.getAttribute("dsTopLuotXem");
                 for (giaybean gct : view) { 
				%>
				<div
					class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix "
					style="display: none;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img src="<%=gct.getAnh()%>">
						</div>
						<div class="product__item__text">
							<h6><%=gct.getTengiay() %></h6>
							<a href="chitietgiayController?mg=<%=gct.getMagiay()%>&sl=1&size=36" class="add-cart">+ Add To Cart</a>
							<h5>$<%=gct.getGia() %></h5>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							 
						</div>
					</div>
				</div>
				<%
                  }
              }
				%>
			<!-- 	top mua  -->
				 <% 
             if (request.getAttribute("dsTopMua") != null) {
                 ArrayList<lichsubean> viewmua = (ArrayList<lichsubean>) request.getAttribute("dsTopMua");
                 for (lichsubean gct : viewmua) { 
				%>
				<div
					class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales"
					style="display: none;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img src="<%=gct.getAnh()%>">
						</div>
						<div class="product__item__text">
							<h6><%=gct.getTengiay() %></h6>
							<a href="chitietgiayController?mg=<%=gct.getMagiay()%>&sl=1&size=36" class="add-cart">+ Add To Cart</a>
							<h5>$<%=gct.getGia() %></h5>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
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
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2> <br /> <span>Shoe Collection</span> <br /> </h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="img/product-sale.png" alt="">
                        <div class="hot__deal__sticker">
                            <span>Sale Of</span>
                            <h5>$29.99</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Deal Of The Week</span>
                        <h2>Multi-pocket Chest Bag Black</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Days</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Hours</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Minutes</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="giayController" class="primary-btn">Shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->
       
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
</body>
</html>
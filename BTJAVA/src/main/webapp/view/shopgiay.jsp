<%@page import="bo.giohangbo"%>
<%@page import="bo.lichsuhangbo"%>
<%@page import="bean.lichsubean"%>
<%@page import="bean.chitiethoadonbean"%>
<%@page import="bean.sizebean"%>
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
     <div class="scroll-top">
        <i class="fas fa-arrow-up"></i>
     </div>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="giayController">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop__sidebar">
						<div class="shop__sidebar__accordion">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
									</div>
									<div id="collapseOne" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<%
				           ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
				           		for(loaibean loai : dsloai){ 
				            %>
											<div class="shop__sidebar__categories">
												<ul style="height: 35px;">
													<li><a href="giayController?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
													</li>
												</ul>
											</div>
											<%} %>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseThree">Filter
											Price</a>
									</div>
									<div id="collapseThree" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__price">
												<ul>

													<li><a class="price-range" data-min="50"
														data-max="100" href="#">$50 - $100</a></li>
													<li><a class="price-range" data-min="100"
														data-max="150" href="#">$100 - $150</a></li>
													<li><a class="price-range" data-min="150"
														data-max="200" href="#">$150 - $200</a></li>
													<li><a class="price-range" data-min="200"
														data-max="250" href="#">$200 - $250</a></li>
													<li><a class="price-range" data-min="250"
														data-max="9999" href="#">Over $250</a></li>
												</ul>
											</div>

										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseFour">Size</a>
									</div>
									<div id="collapseFour" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__size">
												<form id="sizeForm">
													<%
													ArrayList<sizebean> dssize = (ArrayList<sizebean>) request.getAttribute("dssize");
													for (sizebean size : dssize) {
													%>
													<label for="<%=size.getMasize()%>"> <input
														type="radio" id="<%=size.getMasize()%>" name="size"
														value="<%=size.getMasize()%>"
														onclick="submitForm('<%=size.getMasize()%>')"> <%=size.getTensize()%>
													</label>
													<%
													}
													%>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="card"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="shop__product__option">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<%
                            ArrayList<giaybean> dsgiay =(ArrayList<giaybean>)request.getAttribute("dsgiay");
                            %>
								<div class="shop__product__option__left">
									<p>
										Showing
										<%=dsgiay.size() %>
										results
									</p>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__right">
									<form id="sortForm">
										<p>Sort by Price:</p>
										<select name="sort" id="sortOption" onchange="sortByPrice()">
											<option value="asc">Low To High</option>
											<option value="desc">High To Low</option>
										</select>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<%
                    request.setCharacterEncoding("UTF-8");
                    response.setCharacterEncoding("UTF-8");

                    if (dsgiay.isEmpty()) {
                    %>
						<p>Không tìm thấy kết quả phù hợp.</p>
						<% 
		              } else {
		                  for (giaybean giay : dsgiay) {
		              %>
						<div class="col-lg-4 col-md-6 col-sm-6" id="resultContainer">
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem; z-index: 100">Sale</div>
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="<%=giay.getAnh() %>"></div>
								<div class="product__item__text">
									<h6><%=giay.getTengiay() %></h6>
									<a class="add-cart"
										href="chitietgiayController?mg=<%=giay.getMagiay()%>&sl=1&size=36">
										+ Add To Cart </a>
									<h5>
										$<%=giay.getGia() %></h5>

									<div class="rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<span><i class="fa-solid fa-eye"></i> <%=giay.getSoluotxem() %></span>
								</div>
							</div>
						</div>
						<%
		                  	}
		                  }
                        %>
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
									href="giayController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>&ml=<%= request.getParameter("ml") == null ? "" : request.getParameter("ml") %>
									&size=<%= request.getParameter("size") == null ? "" : request.getParameter("size") %>&sort=<%= request.getParameter("sort") == null ? "" : request.getParameter("sort") %>
									&minPrice=<%= request.getParameter("minPrice") == null ? "" : request.getParameter("minPrice") %>&maxPrice=<%= request.getParameter("maxPrice") == null ? "" : request.getParameter("maxPrice") %>
									&pageNumber"
									tabindex="-1" aria-disabled="true">Previous</a>
								</li>
								<%
								for (int i = 1; i <= totalPages; i++) {
								%>
								<li class="page-item <%=currentPage == i ? "active" : ""%>">
									<a class="page-link"
									href="giayController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>&ml=<%= request.getParameter("ml") == null ? "" : request.getParameter("ml") %>
									&size=<%= request.getParameter("size") == null ? "" : request.getParameter("size") %>&sort=<%= request.getParameter("sort") == null ? "" : request.getParameter("sort") %>
									&pageNumber=<%=i%>"><%=i%></a>
								</li>
								<%
								}
								%>
								<li
									class="page-item <%=currentPage == totalPages ? "disabled" : ""%>">
									<a class="page-link"
									href="giayController?txttim=<%=(request.getParameter("txttim")== null) ? "" : request.getParameter("txttim")%>&ml=<%= request.getParameter("ml") == null ? "" : request.getParameter("ml") %>
									&size=<%= request.getParameter("size") == null ? "" : request.getParameter("size") %>&sort=<%= request.getParameter("sort") == null ? "" : request.getParameter("sort") %>
									&pageNumber=<%=currentPage + 1%>">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
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
    <script src="js/javascript.js"></script>
</body>
</html>
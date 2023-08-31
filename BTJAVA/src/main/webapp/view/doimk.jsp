
<%@page import="bo.giohangbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.khachhangbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shoes House</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
    .name{
    color: #f44336;
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
                <a href="#">Sign in</a>
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
            <a href="#"><img src="img/icon/cart.png" alt=""> <span class="text-primary"><%=(g != null) ? g.ds.size() : 0 %></span></a>
           	
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
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="trangchuController">Home</a></li>
                            <li><a href="giayController">Shop</a></li>
                            <li><a href="lichsuController">History</a></li>
                            <li><a href="thanhtoanController">Check Out</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#"><img src="img/icon/cart.png"> <span class="text-primary"><%=(g != null) ? g.ds.size() : 0 %></span></a>
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
                        <h4>Change Password</h4>
                        <div class="breadcrumb__links">
                            <a href="giayController">Home</a>
                            <span>Change Password</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<div class="container mt-5 my-5">
    <div class="row justify-content-center">
        <div class="col-lg-4 col-md-6 col-sm-8">
                    <form action="doimkController" method="post">
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">CurrentPassword</label>
                            <input type="password" name="oldPass" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">NewPassword</label>
                            <input type="password" name="newPass" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">ConfirmPassword</label>
                            <input type="password" name="confirmNewPass" class="form-control"  required>
                        </div>
                        <%
							String successParam = request.getParameter("success");
							if (successParam != null && successParam.equals("true")) {
							    // Hiển thị thông báo "Đổi mật khẩu thành công"
							%>
							<div class="alert alert-success">
		                     <p>Change password successfully</p>
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
                        khachhangbean tk =(khachhangbean)session.getAttribute("dn");
                        if ( tk != null) {
                        %>
                        <input type="hidden" name="tendn" class="form-control" value="<%=tk.getTendn()%>" required>
                        <%} %>
                            <button type="submit" class="btn btn-primary">Change Password</button>
                        </div>
                    </form> 
                    	
                </div>
            </div>
        </div>
<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="footer__copyright__text">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p>
							Copyright ©
							<script>
								document.write(new Date().getFullYear());
							</script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
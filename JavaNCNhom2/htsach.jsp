<%@page import="bean.khachhangbean"%>
<%@page import="bo.CGioHang"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.sachbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<link rel="stylesheet" href="htsach.css">
<link rel="stylesheet" href="base.css">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet" href="grid.css">
<link rel="stylesheet" href="responsive.css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="sachController">Trang chủ</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<%
                    CGioHang g = (CGioHang) session.getAttribute("gh");
                    %>
					<li class=""><a href="gioController">Giỏ hàng (<%=(g != null) ? g.ds.size() : 0%>)
					</a></li>
					<li class=""><a href="xacnhanController">Xác nhận đặt mua</a></li>
					<li class=""><a href="lichsuController">Lịch sử mua hàng</a></li>
				</ul>
		
				<form class="navbar-form navbar-left" method="post" action="sachController">
     			 <div class="form-group">
       				 <input type="text" class="form-control" placeholder="Search" name="txttim" id="txttim">
      			</div>
      				<button type="submit" class="btn btn-primary">Tìm</button>
    			</form>
				<ul class="nav navbar-nav navbar-right">
					<%
					khachhangbean kh =(khachhangbean)session.getAttribute("dn");
                    if ( kh == null) {
                    %>
					<li><a data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-log-in"></span> Đăng Nhập
					</a></li>
					<li><a href="dangkyController">
					<span class="glyphicon glyphicon-user"></span> Đăng Ký</a></li>
					<%
                    } else {
                    %>
                    
					<li class="active"><a href="#"><span
							class="glyphicon glyphicon-user"></span>Xin chào <%=kh.getHoten()%></a></li>
					<li><a href="dangxuatController"><span
							class="glyphicon glyphicon-log-out"></span> Đăng Xuất</a></li>
					<%
                    }
                    %>
				</ul>
			</div>
		</div>
	</nav>

  <!-- Main Content -->
  <div class="app__container">
    <div class="grid wide">
      <div class="row sm-gutter app__content">
        <div class="col l-2 m-0 c-0">
          <!-- Category -->
          <nav class="category">
            <h3 class="category__heading">
              <i class="category__heading"></i> <b>Danh mục</b>
            </h3>
            <ul class="category-list">
              <% /* loaibo lbo = new loaibo(); */
              ArrayList<loaibean> dsloai=(ArrayList<loaibean>)request.getAttribute("dsloai");
                 for (loaibean loai : dsloai) { %>
                 <li class="category-item">
                   <a class="category-item__link" href="sachController?ml=<%=loai.getMaloai()%>">
                     <%=loai.getTenloai()%>
                   </a>
                 </li>
              <% } %>
            </ul>
          </nav>
        </div>
        <div class="col l-10 m-12 c-12">
          <!-- Products -->
          <div class="home-product">
            <div class="row sm-gutter flex">
              <% 
               request.setCharacterEncoding("UTF-8");
              response.setCharacterEncoding("UTF-8");
              
              /* sachbo sbo = new sachbo(); */
               ArrayList<sachbean> ds=(ArrayList<sachbean>)request.getAttribute("dssach");

              if (ds.isEmpty()) {
              %>
              <p>Không tìm thấy kết quả phù hợp.</p>
              <% 
              } else {
                  for (sachbean s : ds) {
              %>
              <div class="col l-2-4 m-4 c-6 mg-5">
                <!-- Product item-->
                <a class="home-product-item" href="gioController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&sl=1&anh=<%=s.getAnh()%>">
                  <img src="<%=s.getAnh()%>" alt="<%=s.getTensach()%>"> 
                  <span class="home-product-item__name"><b><%=s.getTensach()%></b></span>
                  <div class="home-product-item__price">
                    <div class="home-product-item__price-current">Giá: <%=s.getGia()%></div>
                  </div>
                  <div class="home-product-item__action">
                    <span class="home-product-item__like home-product-item__like--liked">
                      <i class="home-product-item__like-icon-empty far fa-heart"></i>
                      <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                    </span>
                    <div class="home-product-item__rating">
                      <i class="home-product-item__star--gold fas fa-star"></i> 
                      <i class="home-product-item__star--gold fas fa-star"></i> 
                      <i class="home-product-item__star--gold fas fa-star"></i> 
                      <i class="home-product-item__star--gold fas fa-star"></i> 
                      <i class="fas fa-star"></i>
                    </div>
                  </div>
                  <div class="home-product-item__favourite">
                    <i class="fas fa-check"></i> <span>Yêu thích</span>
                  </div>
                  <div class="home-product-item__sale-off">
                    <span class="home-product-item__sale-off-percent">43%</span> 
                    <span class="home-product-item__sale-off-label">GIẢM</span>
                  </div>
                </a>
              </div>
              <% } } %>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>Đăng Nhập</h3>
					<form method="post" action="dangnhapController" class="form-flex">
						<div class="form-group">
							<label for="txttk">Tên Tài Khoản:</label> <input type="text"
								class="form-control" id="txtun" name="txtun"
								placeholder="Nhập Tài Khoản">
						</div>
						<div class="form-group">
							<label for="txtmk">Nhập Mật Khẩu:</label> <input type="password"
								class="form-control" id="txtpass" name="txtpass"
								placeholder="Nhập Mật Khẩu">
						</div>
						<br> <input type="submit" name="but" value="login"
							class="btn btn-primary btn-block btn-flat">
					</form>
					<%
                    String tb = request.getParameter("tb");
                    if (request.getParameter("tb") != null) {
                    %>
					<br> <b> Đăng nhập sai </b>
					<%
                    }
                    %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

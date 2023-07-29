<%@page import="bean.khachhangbean"%>
<%@page import="bean.chitietgiohang"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="htgio.css">
<style>
@media (min-width: 768px) and (max-width: 1006px){
	 .container {
        padding: 0px 5px 0px 5px;
        margin-top: 50px;
    }
}
.mg-10{
margin-bottom: 10px;
}
</style>
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
					<li><a data-toggle="modal" data-target="#myModal"> 
					<span class="glyphicon glyphicon-log-in"></span> Đăng Nhập
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
	<div class="container mg-7">
		<div class="row">
			<div class="container">
				<h3>Giỏ Hàng Của Bạn</h3>
				<%
				if (g == null) {
					g = new CGioHang();
					session.setAttribute("gh", g);
				}
				
				if (g != null && !g.ds.isEmpty()) {
					int sh = g.ds.size();
				%>
			<form method="post" action="tralaiController">
			<div class="btn-group mg-10">
       		 <input type="submit" name="Xoachon" value="Xóa Chọn" class="btn btn-warning">
       		 </div>
                <section class="h-100 gradient-custom">
                  <div class="container py-5">
                    <div class="row d-flex justify-content-center my-4">
                     <div class="btn-group">
						<form method="post" action="tralaiController">
							<input type="submit" name="Xoatatca" value="Xóa Tất Cả" class="btn btn-danger m10" >
							
						</form>
					</div>
                   <%
						for (int i = 0; i < sh; i++) {
						chitietgiohang ctgh = g.ds.get(i);
					%>
                      <div class="col-md-8">
                        <div class="card mb-4">
                          <br>
                          <div class="card-header py-3">
                          	 <input type="checkbox" name="chonHang" value="<%=ctgh.getMasach()%>"> Sản Phẩm Số - <%=i+1%>
                          </div>
                      
                          <div class="card-body">
                            <div class="row">
                                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                              	 <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                  <img src="<%= ctgh.getAnh() %>" class="w-100" alt="<%= ctgh.getTensach() %>" />
                                  <a href="#!">
                                    <span class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></span>
                                  </a>
                                </div>
                              </div>
                              <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                <p><strong>Tên Sách:<%= ctgh.getTensach() %></strong></p>
                                <p>Giá: <%= ctgh.getGia() %></p>
                                <form action="tralaiController?ms=<%=ctgh.getMasach()%>"
										method="post">
										<input type="submit" name="Tralai" value="Trả Lại" class="btn btn-danger">
									</form>
                              </div>
                              <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                <!-- Quantity -->
                                <div class="d-flex mb-4" style="max-width: 300px">      
                                  <div class="form-outline">
                                    <form action="capnhatController?ms=<%=ctgh.getMasach()%>" method="post">
										<i class="fas fa-trash">
										<strong>Số lượng</strong>
										<input type="number" min="0" class="form-control" name="txtsua"
											value="<%=ctgh.getSoluong()%>"> 
											<br>
											<input type="submit" name="Capnhat" value="Cập Nhật" class="btn btn-primary">
										</i>
									</form>						
                                  </div>
                                </div>
                                <!-- Quantity -->
                                <!-- Price -->
                                <p class="text-start text-md-center">
                                <br>
                                  <strong>Thành Tiền: <%=ctgh.getThanhtien() %></strong>
                                </p>
                                <!-- Price -->
                              </div>
                            </div>
                      
                          </div>
                        </div>
                      
                      </div>
                       <%
							}
                		%>
                	</form>
                      <div class="col-md-4">
                        <!-- Your Java-generated cart summary will go here -->
                        <div class="card mb-4">
                          <div class="card-header py-3">
                            <b class="mb-0">Đơn Mua</b>
                          </div>
                          <div class="card-body">
                            <ul class="list-group list-group-flush">
                              <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                Số Lượng Sản Phẩm:
                                <span><%=(g != null) ? g.ds.size() : 0%></span> 
                              </li>
                              <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                <div>
                                  <strong>
                                    <span class="mb-0">Tổng Thanh Toán: <span style="color: #ee4d2d "><%=(g != null)? g.Tongtien() : 0%></span></span>
                                  </strong>
                                </div>
                              </li>
                            </ul>
                     <div class="button-container">
						<div class="input-form btn-group btn-group-justified">
							<div class="btn-group">
								<form action="xacnhanController" method="post">
									<input type="submit" name="xacnhan" value="Mua Hàng"
										class="btn btn-primary">
								</form>
							</div>
							<div class="btn-group">
								<form action="sachController" method="post">
									<input type="submit" name="muahang" value="Tiếp tục mua hàng"
										class="btn">
								</form>
							</div>
						</div>
					</div>
                          </div>
                        </div>
                      </div> 
                    </div>
                  </div>
                </section>
                 <% 
				}else { 
            %>
            <div class="text-center">
                <h4>Giỏ hàng của bạn trống</h4>
                <form action="sachController" method="post">
                    <input type="submit" name="muahang" value="Tiếp tục mua hàng" class="btn btn-primary">
                </form>
            </div>
            <% } %>
			</div>
		</div>
	</div>
	
	<!-- Login-Account -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
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
					String un = request.getParameter("txtun");
					String pass = request.getParameter("txtpass");
					String butt = request.getParameter("but");
					if (butt != null) {
						if (un.equals("123") && pass.equals("123")) {
							response.sendRedirect("sachController");
							session.setAttribute("dn", un);
						} else
							response.sendRedirect("sachController?tb=Dang-nhap-sai");
					}
					%>
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

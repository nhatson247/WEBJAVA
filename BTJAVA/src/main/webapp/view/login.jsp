<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.left{
float: left;
}
.btn-color{
background: #3b5998;
color: white;
}
</style>
</head>
<body>
<section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <h3 class="mb-5">Sign in</h3>
			<form action="dangnhapController" method="post">
            <div class="form-outline mb-4">
              <label class="form-label left" for="typeEmailX-2">User Name</label>
              <input type="text" name="txtun" class="form-control form-control-lg" />
            </div>
            <div class="form-outline mb-4">
              <label class="form-label left" for="typePasswordX-2">Password</label>
              <input type="password" name="txtpass"  class="form-control form-control-lg" />
            </div>
            <% if (request.getAttribute("errorMessage") != null ) { %>
                     <div class="alert alert-danger">
                      <%= request.getAttribute("errorMessage") %>
                     </div>
            <% } %>
            <button class="btn btn-color btn-lg btn-block" type="submit">Login</button>
			</form>	
			<br>
			<a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-lg btn-block">
			     Sign up New Account
			</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				  <div class="modal-header">
                <h3 class="modal-title">Sign Up</h3>
                <a type="button"  href="dangnhapController" class="close" >&times;</a>
            </div>
            <form method="post" action="dangkyController" class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtname">User Name:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtname" name="txtname" placeholder="Nhập Họ Tên" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtdiachi">Address:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtdiachi" name="txtdiachi" placeholder="Nhập Địa Chỉ" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtsdt">Phone:</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="txtsdt" name="txtsdt" placeholder="Nhập SĐT" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtemail">Email:</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" id="txtemail" name="txtemail" placeholder="Nhập Email" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txttk">User Name:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txttk" name="txttk" placeholder="Tên Đăng Nhập" required>
                        </div>
                    </div>
                    <% if (request.getAttribute("error") != null ) { %>
                     <div class="alert alert-danger">
                      <%= request.getAttribute("error") %>
                     </div>
                    <% } %>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtmk">Password:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="txtmk" name="txtmk" placeholder="Nhập Mật Khẩu" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" name="button" value="Sign Up" class="btn btn-primary">
                </div>
            </form>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

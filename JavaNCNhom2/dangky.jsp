<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký Tài Khoản</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Đăng Ký Tài Khoản</h3>
                <a type="button"  href="sachController" class="close" >&times;</a>
            </div>
            <form method="post" action="dangkyController" class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtname">Họ Tên:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtname" name="txtname" placeholder="Nhập Họ Tên" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtdiachi">Địa Chỉ:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtdiachi" name="txtdiachi" placeholder="Nhập Địa Chỉ" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtsdt">SĐT:</label>
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
                        <label class="col-sm-3 col-form-label" for="txttk">Tên Đăng Nhập:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txttk" name="txttk" placeholder="Tên Đăng Nhập" required>
                        </div>
                    </div>
                    <% if (request.getAttribute("errorMessage") != null ) { %>
                     <div class="alert alert-danger">
                      <%= request.getAttribute("errorMessage") %>
                     </div>
                    <% } %>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label" for="txtmk">Mật Khẩu:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="txtmk" name="txtmk" placeholder="Nhập Mật Khẩu" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" name="button" value="Đăng Ký" class="btn btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Add Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

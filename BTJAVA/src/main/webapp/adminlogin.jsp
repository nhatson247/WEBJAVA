<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>DT Shop</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="./Themes/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Themes/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Themes/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="./Themes/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="./Themes/plugins/iCheck/square/blue.css">    
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="admintrangchuController"><b>Shoes</b>House</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Login</p>

            <form action="admindangnhapController" method="post">
                <input name="" type="hidden" value="">
                <div class="form-group has-feedback">
                    <input name="txtun" type="text" class="form-control" placeholder="User Name">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input name="txtpass" type="password" class="form-control" placeholder="Password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <% if (request.getAttribute("errorMessage") != null ) { %>
                     <div class="alert alert-danger">
                      <%= request.getAttribute("errorMessage") %>
                     </div>
            <% } %>
                <div class="row">
                    <div class="col-xs-8">
                        <span class="field-validation-valid text-danger" data-valmsg-for="" data-valmsg-replace="true"></span>
                    </div>
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
    <!-- jQuery 3 -->
    <script src="./Themes/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="./Themes/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="./Themes/plugins/iCheck/icheck.min.js"></script>
    <script>$(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });</script>
</body></html>
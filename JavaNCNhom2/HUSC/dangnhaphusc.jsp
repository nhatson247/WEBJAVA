<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập Hệ Thống</title>
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <header>
        <div class="login">
            <div class="right-login text-center">
                <div class="top-login">
                    <a href="https://ums.husc.edu.vn/">
                        <img src="Logo-ko-nen.png" alt="">
                    </a>
                </div>
                <div class="bottom-login">
                    <img src="image1.png" alt="">
                </div>
            </div>
        </div>
        <div class="lb-sigin">
            <div class="lb-sigin-background">
                <img src="logo-small.png" alt="">
                <h2 class="lb-sigin-heading">SINH VIÊN</h2>
                <div class="form-group">
                    <label for="loginID">Mã sinh viên:</label>
                    <input type="text" id="loginID" name="loginID" class="input-lg" placeholder="Mã sinh viên" required="" autofocus="" value="">
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" class="input-lg" placeholder="Mật khẩu" required="" value="">
                </div>
                <button class="btn btn-lg" type="submit">Đăng nhập</button>
            </div>
        </div>
    </header>
    <footer>
        <div class="footer__text">
            <div class="text-center">
                <p><a href="http://husc.edu.vn" style="color:#fff" target="_blank">Trường Đại học Khoa học, Đại học Huế</a></p>
                <p><span class="fa-solid fa-house" style="color: #fff;"></span> 77 Nguyễn Huệ, Thành phố Huế, Tỉnh Thừa Thiên Huế, Việt Nam</p>
                <p><span class="fa-solid fa-mobile-screen-button"></span> Điện thoại: (+84) 0234.3823290 – Fax: (+84) 0234.3824901</p>                
            </div>
        </div>
    </footer>
</body>
</html>
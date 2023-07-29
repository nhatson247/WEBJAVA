<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="container">
        <div class="container__login">
            <div class="login__title">
                <span>ĐĂNG KÝ</span>
                <div class="fa-solid fa-xmark login_icon"></div>
            </div>
            <div class="login__body">
                <p class="login__body-text">
                    <span class="body__text-img"></span>
                    Đăng ký nhanh qua facebook
                </p>
                
                <div class="login__body-fb">
                    <a href="https://www.facebook.com/"><img src="btnfb277x45.jpg"></a>
                    <div class="login__body-note">
						<ul>
							<li>Thưởng ngay <span class="color">50</span> ePoints khi đăng ký mới &amp; <span class="color">5</span> ePoints cho mỗi lượt chia sẻ Facebook</li>
							<li>Tích lũy nhiều ePoints khi Upload tài liệu <a rel="nofollow" href="https://tailieu.vn/gioi-thieu-diem-epoints.html"></a></li>
						</ul>
					</div>
				<p class="login__body-fb login__body-text cblue">Đăng ký mới bằng tài khoản TaiLieu.VN</p>
				</div>
                <div class="login__body-form">
                <p>Bạn cần kích hoạt tài khoản qua Email sau khi đăng ký để nhận ngay 50 ePoints thưởng từ TaiLieu.VN</p>
                <div class="login__form-input m-10">
                    <input placeholder="Nhập Username" type="text" maxlength="50" class="inputtext"/>
                    <input placeholder="Nhập Họ và Tên" type="text" maxlength="100"  class="inputtext"/>
                </div>
                <div class="login__form-input">
                    <input placeholder="Nhập mật khẩu" type="password" maxlength="20" class="inputtext"/>
                    <select  class="inputtext select-gt">
						<option value="">Giới Tính</option>
						<option value="1">Nam</option>
						<option value="0">Nữ</option>
					</select>
                </div>
                <div class="login__form-input">
                    <input placeholder="Nhập lại mật khẩu" type="password" maxlength="20" class="inputtext"/>
                    <select  class="select-gt  inputtext">
                        <option value="">Ngày sinh</option>
                        <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>	
                    </select>
                <select class="select-gt  inputtext">
                        <option value="">Tháng</option>
                        <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>					</select>
                <select class="select-gt  inputtext">
                        <option value="">Năm</option>
                        <option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option>					
                    </select>
                </div>
                <div class="login__form-input">
                    <input placeholder="Nhập địa chỉ emal" type="email" maxlength="50" class="inputtext"/>
                    <select class="select-gt  inputtext">
						<option value="">Tỉnh/TP</option><option value="76">An Giang</option><option value="64">Bà Rịa Vũng Tàu</option><option value="281">Bắc Cạn</option><option value="240">Bắc Giang</option><option value="781">Bạc Liêu</option><option value="241">Bắc Ninh</option><option value="75">Bến Tre</option><option value="650">Bình Dương</option><option value="651">Bình Phước</option><option value="62">Bình Thuận</option><option value="56">Bình Định</option><option value="78">Cà Mau</option><option value="71">Cần Thơ</option><option value="26">Cao Bằng</option><option value="59">Gia Lai</option><option value="19">Hà Giang</option><option value="351">Hà Nam</option><option value="4">Hà Nội</option><option value="34">Hà Tây</option><option value="39">Hà Tỉnh</option><option value="320">Hải Dương</option><option value="31">Hải Phòng</option><option value="18">Hòa Bình</option><option value="321">Hưng Yên</option><option value="58">Khánh Hòa</option><option value="77">Kiên Giang</option><option value="60">Kon Tum</option><option value="23">Lai Châu</option><option value="63">Lâm Đồng</option><option value="25">Lạng Sơn</option><option value="20">Lào Cai</option><option value="72">Long An</option><option value="350">Nam Định</option><option value="38">Nghệ An</option><option value="30">Ninh Bình</option><option value="68">Ninh Thuận</option><option value="901">Nơi khác</option><option value="210">Phú Thọ</option><option value="57">Phú Yên</option><option value="52">Quảng Bình</option><option value="510">Quảng Nam</option><option value="55">Quảng Ngãi</option><option value="33">Quảng Ninh</option><option value="53">Quảng Trị</option><option value="79">Sóc Trăng</option><option value="22">Sơn La</option><option value="66">Tây Ninh</option><option value="36">Thái Bình</option><option value="280">Thái Nguyên</option><option value="37">Thanh Hóa</option><option value="54">Thừa Thiên Huế</option><option value="73">Tiền Giang</option><option value="8">TP.HCM</option><option value="74">Trà Vinh</option><option value="27">Tuyên Quang</option><option value="70">Vĩnh Long</option><option value="211">Vĩnh Phúc</option><option value="29">Yên Bái</option><option value="511">Đà Nẵng</option><option value="50">Đắc Lắc</option><option value="1042">Đắc Nông</option><option value="900">Điện Biên</option><option value="61">Đồng Nai</option><option value="67">Đồng Tháp</option>
					</select>
                </div>
                <div class="login__form-input">
                    <input placeholder="Nhập  lại địa chỉ emal" type="email" maxlength="50" class="inputtext"/>
                    <input  maxlength="50" class="inputtext capcha"/>
                </div>
                <div class="login__form-input">
                    <a class="newcap">Chọn mã xác nhận khác.</a>
                </div>

                <div id="login">
                    <div class="left m-10">
                        <div class="left">
                            <div class="btn-center">
                                <div class="btn-text">Đăng Ký</div>
                            </div>
                        </div>
                        <div class="left pt-10 mf-10">
                            <input checked="checked" type="checkbox" value="1">Tôi đồng ý với các Chính Sách và Thỏa Thuận Sử Dụng của TaiLieu.VN
                        </div>
                    </div>
                </div>
                <div class="left"></div>
                <span class="line-bottom"></span>
                <p class="login__body-fb c-blue">Bạn đã có tài khoản TaiLieu.VN? Đăng nhập</p>
                </div>
            </div>
            <footer>
				<ul>
					<li>
						<p>Thưởng <span class="number-blue">50</span> ePoints khi đăng ký mới</p>
						<p>Tặng <span class="number-blue">5</span> ePoints cho mỗi lượt chia sẻ Facebook</p>
					</li>
					<li>
						<p>Xem và Tải trên <span class="number-blue">1 Triệu</span> Tài Liệu miễn phí</p>
						<p>Kết nối <span class="number-blue">5 Triệu</span> Thành Viên <a href="https://tailieu.vn/">TaiLieu.VN</a> </p>
					</li>
					<li class="footer__last">
						<div class="footer__last-text">
							<div class="left" style="margin-bottom:5px;">Kết bạn với <b><a target="_blank" href="https://www.facebook.com/tailieu.vn">TaiLieu.VN</a></b> trên <b><a target="_blank" href="https://www.facebook.com/tailieu.vn">Facebook</a></b> để nhận link download miễn phí <span class="cred">100</span> tài liệu <span class="cred">HOT</span> mỗi ngày</div> 
						</div>
					</li>
				</ul>
			</footer>
        </div>
    </div>
</body>
</html>
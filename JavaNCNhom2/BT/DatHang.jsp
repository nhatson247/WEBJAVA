<%@page import="tam.giohang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="main.css">
</head>
<body>
	<div class="container">
		<form method="post" action="DatHang.jsp" class="form-flex">
			<div class="form-group">
				<label for="txtth">Tên hàng:</label>
				<input type="text" class="form-control" id="txtth" name="txtth">
			</div>
			<div class="form-group">
				<label for="txtgia">Giá:</label>
				<input type="text" class="form-control" id="txtgia" name="txtgia">
			</div>
			<div class="form-group">
				<label for="txtsl">Số lượng:</label>
				<input type="text" class="form-control" id="txtsl" name="txtsl">
			</div>
			<br>
			<input type="submit" name="un1" value="Đặt Hàng" class="btn btn-primary">
		</form>
		<h3>Giỏ Hàng</h3>
		<form method="post" action="Xoa.jsp">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Tên Hàng</th>
						<th>Giá</th>
						<th>Số Lượng</th>
						<th>Thành Tiền</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
					String th = request.getParameter("txtth");
					String gia = request.getParameter("txtgia");
					String sl = request.getParameter("txtsl");

					if (th != null && gia != null && sl != null) {
						giohang g = (giohang) session.getAttribute("gh");
						if (g == null) {
							g = new giohang();
							session.setAttribute("gh", g);
						}
						g.Them(th, Integer.parseInt(gia), Integer.parseInt(sl));
					}

					giohang g = (giohang) session.getAttribute("gh");
					if (g != null) {
						int sh = g.ds.size();
						for (int i = 0; i < sh; i++) {
					%>
					<tr>
						<td><input type="checkbox" name="chonHang" value="<%=g.ds.get(i).getTenhang()%>"></td>
						<td><%=g.ds.get(i).getTenhang()%></td>
						<td><%=g.ds.get(i).getGia()%></td>
						<form></form>
						<td>
							<form action="Sua.jsp?th=<%=g.ds.get(i).getTenhang()%>" method="post">
								<input type="text" name="txtsua">
								<input type="submit" name="sua" value="Sửa" class="btn btn-info">
							</form>
						</td>
						<td><%=g.ds.get(i).getThanhtien()%></td>
						<td>
							<form action="Xoa.jsp?th=<%=g.ds.get(i).getTenhang()%>" method="post">
								<input type="submit" name="xoa" value="Xóa" class="btn btn-danger">
							</form>
						</td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
				<tfoot>
					<%
					if (g != null) {
					%>
					<tr>
						<td colspan="4" class="total">Tổng Tiền:</td>
						<td colspan="2" class="total"><%=g.Tongtien()%></td>
					</tr>
					<%
					}
					%>
				</tfoot>
			</table>
			<input type="submit" name="Xoachon" value="Xóa Chọn" class="btn btn-warning">
			<input type="submit" name="Xoatatca" value="Xóa Tất Cả" class="btn btn-secondary m10">
		</form>
	</div>
</body>
</html>

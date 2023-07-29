<!DOCTYPE html>
<%@page import="bo.CGioHang"%>
<%@page import="bean.chitietgiohang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="paypal.css">
</head>
<body>
<div class="row">
    <div class="col-75">
        <div class="container">
            <form method="post"  action="/pay">
                <div class="col-50">
                    <h3>Payment</h3>
                    <label>Accepted Cards</label>
                    <div class="icon-container">
                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                    </div>
                    <label for="price">Total</label>
                    <input type="text" id="price" name="price" placeholder="Total">
                    <label for="currency">Currency</label>
                    <input type="text" id="currency" name="currency" placeholder="Enter Currency">
                    <label for="method">Payment Method</label>
                    <input type="text" id="method" name="method" placeholder="Payment Method">
                    <label for="intent">Intent</label>
                    <input type="text" id="intent" name="intent" value="sale">
                    <label for="description">Payment Description</label>
                    <input type="text" id="description" name="description" placeholder="Payment Description">

                </div>

                <input type="submit" value="Continue to checkout" class="btn">
            </form>
        </div>
    </div>
    	<%
    	CGioHang g = (CGioHang) session.getAttribute("gh");
				
		%>
    <div class="col-25">
        <div class="container">

            <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><%=(g != null) ? g.ds.size() : 0%></b></span></h4>
           <%			if (g != null && !g.ds.isEmpty()) {
							int sh = g.ds.size();
						for (int i = 0; i < sh; i++) {
						chitietgiohang ctgh = g.ds.get(i);
					%>
            <p><span ><%=ctgh.getTensach() %></span> <span class="price"><%=ctgh.getGia() %></span></p>
            <%
						}
					}
            %>
            <hr>
            <p>Total <span class="price" style="color:black"><b><%=g.Tongtien() %></b></span></p>
        </div>
    </div>
</div>

</body>
</html>
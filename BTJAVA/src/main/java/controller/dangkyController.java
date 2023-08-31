package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.khachhangbo;

/**
 * Servlet implementation class dangkyController
 */
@WebServlet("/dangkyController")
public class dangkyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 request.setCharacterEncoding("UTF-8");
	         response.setCharacterEncoding("UTF-8");
	          
			String hoten = request.getParameter("txtname");
			String diachi = request.getParameter("txtdiachi");
			String sdt = request.getParameter("txtsdt");
			String email = request.getParameter("txtemail");
			String tendn = request.getParameter("txttk");
			String mk = request.getParameter("txtmk");

			if (hoten == null && diachi == null && sdt == null && email == null && tendn == null && mk == null) {
				RequestDispatcher rd =
 						request.getRequestDispatcher("login.jsp");
 				rd.forward(request, response);
			} else {
				khachhangbo khbo = new khachhangbo();
				if (khbo.kttk(tendn) == null) {
				    // Thêm thành công
					khbo.them(hoten, diachi, sdt, email, tendn, mk);
				    HttpSession session = request.getSession();
				    session.setAttribute("dn", khbo.kttk(tendn));
				    response.sendRedirect("dangnhapController");
				} else {
				    // Tên đăng nhập đã tồn tại, gửi thông báo lỗi về trang đăng ký
				    request.setAttribute("error", "Tên đăng nhập đã tồn tại, vui lòng chọn tên khác.");
				    RequestDispatcher rd = request.getRequestDispatcher("view/login.jsp");
				    rd.forward(request, response);
				}
	            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

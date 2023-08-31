package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giaybean;
import bean.khachhangbean;
import bo.chitiethoadonbo;
import bo.giohangbo;
import bo.hoadonbo;


/**
 * Servlet implementation class xacnhanController
 */
@WebServlet("/xacnhanController")
public class xacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		    HttpSession session = request.getSession();
		    khachhangbean kh = (khachhangbean) session.getAttribute("dn");

		    if (kh == null) {
		        RequestDispatcher rd = request.getRequestDispatcher("dangnhapController");
		        rd.forward(request, response);
		    } else {
		        giohangbo g = (giohangbo) session.getAttribute("gh");

		        if (g == null || g.Tongtien() == 0) {
		            // Giỏ hàng không có sản phẩm, chuyển hướng về trang giayController
		            response.sendRedirect("giayController");
		        } else {
		            hoadonbo hdbo = new hoadonbo();
		            chitiethoadonbo ctbo = new chitiethoadonbo();
		            hdbo.themHD(kh.getMakh());
		            long maxhd = hdbo.MaxHD();

		            for (giaybean h : g.ds) {
		                ctbo.themCTHD(h.getMagiay(), h.getSoluong(), maxhd);
		            }

		            session.removeAttribute("gh");
		            response.sendRedirect("lichsuController");
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

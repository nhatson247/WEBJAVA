package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.chitiethoadonbo;




/**
 * Servlet implementation class adminxacnhanController
 */
@WebServlet("/adminxacnhanController")
public class adminxacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminxacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        String mact = request.getParameter("mact");
	        String tab =request.getParameter("tab");
	        chitiethoadonbo cthdbo = new chitiethoadonbo();
	        if (mact != null && tab != null) {
                if (tab.equals("sua")) {
                    cthdbo.sua(Long.parseLong(mact));
                } else if (tab.equals("xoa")) {
                    cthdbo.xoa(Long.parseLong(mact));
                }
            } 
	        request.setAttribute("ds", cthdbo.getxacnhan());

	        RequestDispatcher rd = request.getRequestDispatcher("adminhoadon.jsp");
	        rd.forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

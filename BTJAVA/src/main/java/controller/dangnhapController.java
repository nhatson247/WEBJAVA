package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;


/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhapController")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String un = request.getParameter("txtun");
            String pass = request.getParameter("txtpass");
            
            if(un == null && pass == null) {
  	          RequestDispatcher rd =
  						request.getRequestDispatcher("view/login.jsp");
  				rd.forward(request, response);
            }else {
            	khachhangbo dnbo = new khachhangbo();
    			khachhangbean  kh = dnbo.ktdn(un, pass);
            	if (kh != null) { // DN thanh cong
            		HttpSession session = request.getSession();
                    session.setAttribute("dn", kh);
                    response.sendRedirect("giayController");
                }else {
                	request.setAttribute("errorMessage", "Wrong User Name Or Password");
				    RequestDispatcher rd = request.getRequestDispatcher("view/login.jsp");
				    rd.forward(request, response);
                }
            }
   
		}catch (Exception e) {
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

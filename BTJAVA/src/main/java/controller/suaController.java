package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class suaController
 */
@WebServlet("/suaController")
public class suaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("gh") != null) {
			    giohangbo g = (giohangbo) session.getAttribute("gh");
			    if (g != null) {
			        String mg = request.getParameter("mg");
			        String sl = request.getParameter("txtsua");

			        if (mg != null && sl != null) {
			            g.Sua(mg, Integer.parseInt(sl));
			            session.setAttribute("gh", g);
			            response.sendRedirect("giohangController");
			        }
			    }
			}
	          RequestDispatcher rd =
						request.getRequestDispatcher("view/htgio.jsp");
				rd.forward(request, response);
   
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

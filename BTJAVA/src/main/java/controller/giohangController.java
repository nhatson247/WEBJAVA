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
import bo.chitietgiaybo;
import bo.giohangbo;

/**
 * Servlet implementation class giohangController
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
    	 
    	    String mg = request.getParameter("mg");
    	    String sl = request.getParameter("sl");
    	    String size = request.getParameter("size");

    	    HttpSession session = request.getSession();
    	    giohangbo gh = (giohangbo) session.getAttribute("gh");
    	    if (gh == null) {
    	        gh = new giohangbo();
    	        session.setAttribute("gh", gh);
    	    }

    	    if (mg != null && sl != null && size != null) {
    	        int soLuong = Integer.parseInt(sl);
    	        chitietgiaybo ctdbo = new chitietgiaybo();
    	        giaybean giay = ctdbo.timgiay(mg);

    	        
    	        gh.Them(giay, soLuong, size);

    	        
    	        response.sendRedirect("giohangController");
    	    } else {
    	        // Handle invalid or missing parameters
    	        RequestDispatcher rd = request.getRequestDispatcher("view/htgio.jsp");
    	        rd.forward(request, response);
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

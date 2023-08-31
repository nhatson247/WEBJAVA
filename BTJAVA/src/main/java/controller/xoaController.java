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
 * Servlet implementation class xoaController
 */
@WebServlet("/xoaController")
public class xoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			giohangbo g = (giohangbo) session.getAttribute("gh");
            String[] th = request.getParameterValues("chonHang");

            if (request.getParameter("Xoatatca") != null) {
                if (g != null) {
                    g.XoaTatCa();
                    session.setAttribute("gh", g);
                }
            } else if (th != null) {
                g.XoaDaChon(th);
            } else {
                String mg = request.getParameter("mg");
                if (mg != null && g != null) {
                    g.Xoa(mg);
                }
            }
	          RequestDispatcher rd =
						request.getRequestDispatcher("giohangController");
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

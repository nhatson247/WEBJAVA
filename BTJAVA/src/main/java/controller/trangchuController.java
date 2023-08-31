package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.giaybean;
import bean.lichsubean;
import bo.chitietgiaybo;
import bo.lichsuhangbo;



/**
 * Servlet implementation class trangchuController
 */
@WebServlet("/trangchuController")
public class trangchuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trangchuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 int slhienthi = 4;
			 chitietgiaybo gbo = new chitietgiaybo();
	          ArrayList<giaybean> dsTopLuotXem = gbo.getGiayByLuotXem(slhienthi);
	          
	          lichsuhangbo lsbo = new lichsuhangbo();
	          ArrayList<lichsubean> dsTopMua = lsbo.gettopmua(slhienthi);
	          
	          request.setAttribute("dsTopMua", dsTopMua);
	          request.setAttribute("dsTopLuotXem", dsTopLuotXem);
	            RequestDispatcher rd = request.getRequestDispatcher("view/home.jsp");
	            rd.forward(request, response);

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

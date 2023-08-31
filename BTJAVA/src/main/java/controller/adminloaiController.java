package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bo.loaibo;


/**
 * Servlet implementation class adminloaiController
 */
@WebServlet("/adminloaiController")
public class adminloaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminloaiController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		    request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    
		    String key = request.getParameter("txttim");
		    String maloai = request.getParameter("txtmaloai");
		    String tenloai = request.getParameter("txttenloai");
		    loaibo lbo = new loaibo();

		    // Phân trang
		    int pageSize = 10; // Số lượng loại hiển thị trên mỗi trang
		    int pageNumber = 1; // Trang mặc định

		    String pageNumberParam = request.getParameter("pageNumber");
		    if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
		        pageNumber = Integer.parseInt(pageNumberParam);
		    }

		    int totalLoaiCount = lbo.getloai().size();
		    int totalPages = (totalLoaiCount + pageSize - 1) / pageSize;
		    
		    ArrayList<loaibean> ds = lbo.getLoaiOnPage(pageNumber, pageSize);
		    
		    if (key != null) {
		        // Tìm kiếm loại theo từ khóa
		        ds = lbo.TimKiemTheoLoai(key, pageNumber, pageSize);
		        totalLoaiCount = lbo.TimKiemTheoTenLoaiCount(key);
		        totalPages = (totalLoaiCount + pageSize - 1) / pageSize;
		    } else {
		        // Lấy danh sách loại theo trang
		        ds = lbo.getLoaiOnPage(pageNumber, pageSize);
		    }
		    
		    if (request.getParameter("butadd") != null)
		        lbo.themloai(maloai, tenloai);
		    else if (request.getParameter("butupdate") != null)
		        lbo.sualoai(maloai, tenloai);
		    else {
		        String tab = request.getParameter("tab");
		        String ml = request.getParameter("ml");
		        if (tab != null) {
		            if (tab.equals("select")) {
		                request.setAttribute("tenloai", lbo.Tim(ml));
		                request.setAttribute("maloai", ml);
		            } else
		                lbo.xoaloai(ml);
		        }
		    }
		    
		    request.setAttribute("ds", ds);
		    request.setAttribute("totalPages", totalPages);
		    request.setAttribute("currentPage", pageNumber);
		    request.setAttribute("txttim", key);

		    RequestDispatcher rd = request.getRequestDispatcher("adminloai.jsp");
		    rd.forward(request, response);
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.khachhangbean;
import bo.khachhangbo;


/**
 * Servlet implementation class adminindsController
 */
@WebServlet("/adminindsController")
public class adminindsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminindsController() {
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
		    
		    String key = request.getParameter("txttim");
			String hoten = request.getParameter("txthoten");
		    String diachi = request.getParameter("txtdiachi");
		    String sdt = request.getParameter("txtsdt");
		    String email = request.getParameter("txtemail");
		    String tendn = request.getParameter("txttendn");
		    String pass = request.getParameter("txtmk");
		    
		    khachhangbo khbo = new khachhangbo();

		    // Phân trang
		    int pageSize = 9; // Số lượng loại hiển thị trên mỗi trang
		    int pageNumber = 1; // Trang mặc định

		    String pageNumberParam = request.getParameter("pageNumber");
		    if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
		        pageNumber = Integer.parseInt(pageNumberParam);
		    }

		    int totalKHCount = khbo.getKH().size();
		    int totalPages = (totalKHCount + pageSize - 1) / pageSize;
		    
		    ArrayList<khachhangbean> ds = khbo.getKhachHangOnPage(pageNumber, pageSize);
		    
		    if (key != null) {
		        // Tìm kiếm loại theo từ khóa
		        ds = khbo.TimKiemKH(key, pageNumber, pageSize);
		        totalKHCount = khbo.TimKiemKHCount(key);
		        totalPages = (totalKHCount + pageSize - 1) / pageSize;
		    } else {
		        // Lấy danh sách loại theo trang
		        ds = khbo.getKhachHangOnPage(pageNumber, pageSize);
		    }
		    
		    if (request.getParameter("butadd") != null)
		        khbo.them(hoten, diachi, sdt, email, tendn, pass);
		    else if (request.getParameter("butupdate") != null)
		        khbo.sua(hoten, diachi, sdt, email, tendn, pass);
		    else {
		        String tab = request.getParameter("tab");
		        String mkh = request.getParameter("mkh");
		        if (tab != null) {
		            if (tab.equals("select")) {
		            	khachhangbean selectedKH = khbo.finByMKH(mkh);
		                if (selectedKH != null) {
		                    request.setAttribute("selectedKH", selectedKH);
		                }
		            } else
		                khbo.xoa(Long.parseLong(mkh));
		        }
		    }
		    
		    request.setAttribute("ds", ds);
		    request.setAttribute("totalPages", totalPages);
		    request.setAttribute("currentPage", pageNumber);
		    request.setAttribute("txttim", key);

		    RequestDispatcher rd = request.getRequestDispatcher("adminkhachhang.jsp");
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

package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bean.lichsubean;
import bo.lichsuhangbo;


/**
 * Servlet implementation class lichsuController
 */
@WebServlet("/lichsuController")
public class lichsuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsuController() {
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
		    HttpSession session = request.getSession();
		    String key = request.getParameter("txttim");
		    khachhangbean kh = (khachhangbean) session.getAttribute("dn");

		    if (kh == null) {
		        RequestDispatcher rd = request.getRequestDispatcher("dangnhapController");
		        rd.forward(request, response);
		    } else {
		        lichsuhangbo sbo = new lichsuhangbo();
		        sbo.xoahoadonchuatt(kh.getMakh(), 15); // Xóa hóa đơn chưa thanh toán cách ngày hiện tại hơn 15 ngày
		        
		        int pageSize = 10;
		        int pageNumber = 1;

		        String pageNumberParam = request.getParameter("pageNumber");
		        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
		            pageNumber = Integer.parseInt(pageNumberParam);
		        }
		        
		        ArrayList<lichsubean> dslsh = new ArrayList<>();
		        
		        // Tim kiem 
		        if (key != null && !key.isEmpty()) {
		            dslsh = sbo.TimKiemLichSu(kh.getMakh(), key, pageNumber, pageSize);
		        } else {
		            dslsh = sbo.TimKiemLichSu(kh.getMakh(), "", pageNumber, pageSize);
		        }
		        
		        // Đếm tổng số lượng dòng dữ liệu trong danh sách lịch sử mua hàng
		        int totalLSCount = dslsh.size();
		        
		        // Tính tổng số trang cần hiển thị
		        int totalPages = (int) Math.ceil((double) totalLSCount / pageSize);

		        ArrayList<lichsubean> dslshchuatt = new ArrayList<>();
		        ArrayList<lichsubean> dslshdatt = new ArrayList<>();

		        for (lichsubean lsh : dslsh) {
		            if (lsh.isDamua()) {
		                dslshdatt.add(lsh);
		            } else {
		                dslshchuatt.add(lsh);
		            }
		        }

		        request.setAttribute("dslshchuatt", dslshchuatt);
		        request.setAttribute("dslshdatt", dslshdatt);
		        request.setAttribute("totalPages", totalPages);
		        request.setAttribute("currentPage", pageNumber);

		        RequestDispatcher rd = request.getRequestDispatcher("view/lichsu.jsp");
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

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
import bean.loaibean;
import bean.sizebean;
import bo.giaybo;
import bo.loaibo;
import bo.sizebo;

/**
 * Servlet implementation class giayController
 */
@WebServlet("/giayController")
public class giayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giayController() {
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

    	    loaibo lbo = new loaibo();
    	    ArrayList<loaibean> dsloai = lbo.getloai();

    	    sizebo sizebo = new sizebo();
    	    ArrayList<sizebean> dssize = sizebo.getsize();

    	    String ml = request.getParameter("ml");
    	    String size = request.getParameter("size");
    	    String key = request.getParameter("txttim");
    	    String sortOrder = request.getParameter("sort");
    	    String minPriceParam = request.getParameter("minPrice");
    	    String maxPriceParam = request.getParameter("maxPrice");
    	    double minPrice = 0.0;
    	    double maxPrice = 0.0;

    	    if (minPriceParam != null && !minPriceParam.trim().isEmpty()) {
    	        minPrice = Double.parseDouble(minPriceParam);
    	    }

    	    if (maxPriceParam != null && !maxPriceParam.trim().isEmpty()) {
    	        maxPrice = Double.parseDouble(maxPriceParam);
    	    }

    	    giaybo gbo = new giaybo();

    	    int pageSize = 12;
    	    int pageNumber = 1;

    	    String pageNumberParam = request.getParameter("pageNumber");
    	    if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
    	        pageNumber = Integer.parseInt(pageNumberParam);
    	    }

    	    ArrayList<giaybean> dsgiay = new ArrayList<>();

    	    int totalGiayCount = 0;
    	    int totalPages = 0;

    	    if (ml != null) {
    	        totalGiayCount = gbo.TimKiemTheoMaLoaiCount(ml);
    	        totalPages = (totalGiayCount + pageSize - 1) / pageSize;
    	        dsgiay = gbo.TimKiemTheoMaLoai(ml, pageNumber, pageSize);
    	    } else if (size != null) {
    	        totalGiayCount = gbo.TimKiemTheoMaSizeCount(size);
    	        totalPages = (totalGiayCount + pageSize - 1) / pageSize;
    	        dsgiay = gbo.TimKiemMaSize(size, pageNumber, pageSize);
    	    } else if (key != null) {
    	        totalGiayCount = gbo.TimKiemTheoTenVaTieuDeCount(key);
    	        totalPages = (totalGiayCount + pageSize - 1) / pageSize;
    	        dsgiay = gbo.TimKiemTheoTenVaTieuDe(key, pageNumber, pageSize);
    	    } else if (minPrice > 0 && maxPrice > 0 && maxPrice >= minPrice) {
    	        totalGiayCount = gbo.TimKiemTheoGiaCaoVaThapCount();
    	        totalPages = (totalGiayCount + pageSize - 1) / pageSize;
    	        dsgiay = gbo.TimKiemTheoKhoangGia(minPrice, maxPrice, pageNumber, pageSize);
    	    } else {
    	        totalGiayCount = gbo.getTotalGiayCount();
    	        totalPages = (totalGiayCount + pageSize - 1) / pageSize;
    	        dsgiay = gbo.getGiayOnPage(pageNumber, pageSize);
    	    }

    	    if ("desc".equals(sortOrder)) {
    	        dsgiay = gbo.TimKiemTheoGiaCao(pageNumber, pageSize);
    	    } else if ("asc".equals(sortOrder)) {
    	        dsgiay = gbo.TimKiemTheoGiaThap(pageNumber, pageSize);
    	    }

    	    request.setAttribute("dsloai", dsloai);
    	    request.setAttribute("dssize", dssize);
    	    request.setAttribute("dsgiay", dsgiay);
    	    request.setAttribute("txttim", key);
    	    request.setAttribute("totalPages", totalPages);
    	    request.setAttribute("currentPage", pageNumber);

    	    RequestDispatcher rd = request.getRequestDispatcher("view/shopgiay.jsp");
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

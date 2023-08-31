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
import bo.chitietgiaybo;
import bo.loaibo;
import bo.sizebo;


/**
 * Servlet implementation class chitietgiayController
 */
@WebServlet("/chitietgiayController")
public class chitietgiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chitietgiayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            loaibo lbo = new loaibo();
            ArrayList<loaibean> dsloai = lbo.getloai();
            request.setAttribute("dsloai", dsloai);
            sizebo sizebo = new sizebo();
            ArrayList<sizebean> dssize = sizebo.getsize();
            request.setAttribute("dssize", dssize);


            String mg = request.getParameter("mg");
            String sl = request.getParameter("sl");
            String size = request.getParameter("size");
            int slgiay = 1;
            int slhienthi = 4;
            if (mg != null && sl != null && size != null) {

                slgiay = Integer.parseInt(sl);
                chitietgiaybo ctdbo = new chitietgiaybo();
                giaybean giay = ctdbo.timgiay(mg);
                ctdbo.tangLuotXem(mg);
                request.setAttribute("ctgiay", giay);

                String ml = giay.getMaloai();
                if (ml != null && !ml.isEmpty()) {
                    ArrayList<giaybean> dsctloai = ctdbo.timloai(ml);
                    dsctloai.removeIf(item -> item.getMagiay().equals(mg)); // Loại bỏ sản phẩm đang có
                    request.setAttribute("ctloai", dsctloai);
                }
                ArrayList<giaybean> dsTopLuotXem = ctdbo.getGiayByLuotXem(slhienthi);
                request.setAttribute("dsTopLuotXem", dsTopLuotXem);
            }

            request.setAttribute("slgiay", slgiay);

            RequestDispatcher rd = request.getRequestDispatcher("view/chitietgiay.jsp");
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

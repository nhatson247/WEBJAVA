package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.admindangnhapbean;
import bo.admindangnhapbo;



/**
 * Servlet implementation class admindoimkController
 */
@WebServlet("/admindoimkController")
public class admindoimkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admindoimkController() {
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

            String tendn = request.getParameter("tendn");
            String oldPass = request.getParameter("oldPass");
            String newPass = request.getParameter("newPass");
            String confirmNewPass = request.getParameter("confirmNewPass");

            HttpSession session = request.getSession();
            admindangnhapbean admin = (admindangnhapbean) session.getAttribute("dn");

            if (admin == null) {
                // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
                response.sendRedirect("admindangnhapController");
                return;
            }

            if (oldPass == null && newPass == null && confirmNewPass == null) {
                RequestDispatcher rd = request.getRequestDispatcher("admindoimk.jsp");
                rd.forward(request, response);
            } else {
                admindangnhapbo khbo = new admindangnhapbo();
                admin = khbo.kttk(tendn);

                if (admin != null && admin.getMatKhau().equals(oldPass)) {
                    if (newPass.equals(confirmNewPass)) {
                        if (khbo.doiMatKhau(tendn, oldPass, newPass) > 0) {
                            session.setAttribute("dn", admin);
                            response.sendRedirect("admindoimk.jsp?success=true");
                        } else {
                            request.setAttribute("errorMessage", "Change password failed");
                            RequestDispatcher rd = request.getRequestDispatcher("admindoimk.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorMessage", "New password and confirm new password are not the same");
                        RequestDispatcher rd = request.getRequestDispatcher("admindoimk.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "Wrong password");
                    RequestDispatcher rd = request.getRequestDispatcher("admindoimk.jsp");
                    rd.forward(request, response);
                }
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

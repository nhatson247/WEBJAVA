package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.giaybean;
import bo.giaybo;


/**
 * Servlet implementation class admingiayController
 */
@WebServlet("/admingiayController")
public class admingiayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admingiayController() {
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

		        String tab = request.getParameter("tab");
		        String magiay = request.getParameter("mg"); // Lấy mã giày từ URL
		        String key = request.getParameter(magiay);

		        giaybo gbo = new giaybo();
		        ArrayList<giaybean> ds = gbo.getgiay();

		        if (tab != null) {
		            if (tab.equals("select") && magiay != null) { // Kiểm tra có mã giày trong URL không
		                giaybean selectedGiay = gbo.finByMG(magiay);
		                if (selectedGiay != null) {
		                    request.setAttribute("selectedGiay", selectedGiay);
		                }
		            } else if (tab.equals("delete")) {
		                if (magiay != null && !magiay.isEmpty()) {
		                    gbo.xoaGiay(magiay);
		                }
		            }
		        }

			 int pageSize = 9; // Số lượng sản phẩm hiển thị trên mỗi trang
		        int pageNumber = 1; // Trang mặc định

		        String pageNumberParam = request.getParameter("pageNumber");
		        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
		            pageNumber = Integer.parseInt(pageNumberParam);
		        }

		        // Tìm kiếm và phân trang theo tên và tiêu đề
		        if (key != null && !key.isEmpty()) {
		            ds = gbo.TimKiemTheoTenVaTieuDe(key, pageNumber, pageSize);
		        } else {
		            ds = gbo.getGiayOnPage(pageNumber, pageSize);
		        }

		        int totalGiayCount = gbo.getTotalGiayCount();
		        int totalPages = (totalGiayCount + pageSize - 1) / pageSize;

		        request.setAttribute("dss", ds);
		        request.setAttribute("totalPages", totalPages);
	    	    request.setAttribute("currentPage", pageNumber);
		        
			RequestDispatcher rd = request.getRequestDispatcher("admingiay.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		 String dirUrl1 = request.getServletContext().getRealPath("")  + "img/product4/";
		 response.getWriter().println(dirUrl1);

		giaybo gbo = new giaybo();
		String magiay = null;
		String tengiay = null;
		String tieude = null;
		String sl = null;
		String gia = null;
		String maloai = null;
		String anh = null;
		String size = null;
		String tab = null;
		String btnadd = null;
		String btnupdate = null;
		try {

			List<FileItem> fileItems = upload.parseRequest(request);// Lấy về các đối tượng gửi lên
			// duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
					// xử lý file
					String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("")  + "img/product4/";
						File dir = new File(dirUrl);
						if (!dir.exists()) {// nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
						String fileImg = dirUrl  + nameimg;
						anh = "img/product4/" + nameimg; 
						File file = new File(fileImg);// tạo file
						try {
							fileItem.write(file);// lưu file
							System.out.println("UPLOAD THÀNH CÔNG...!");
							System.out.println("Đường dẫn lưu file là: " + dirUrl);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else// Neu la control
				{
					String tentk = fileItem.getFieldName();
					if (tentk.equals("txtmagiay")) {
						magiay = fileItem.getString();
					}
					if (tentk.equals("txttengiay")) {
						tengiay = fileItem.getString();
					}
					if (tentk.equals("txttieude")) {
						tieude = fileItem.getString();
					}
					if (tentk.equals("txtsoluong")) {
						sl = fileItem.getString();
					}
					if (tentk.equals("txtgia")) {
						gia = fileItem.getString();
					}
					if (tentk.equals("txtmaloai")) {
						maloai = fileItem.getString();
					}
					if (tentk.equals("txtsize")) {
						size = fileItem.getString();
					}
					if (tentk.equals("tab")) {
						tab = fileItem.getString();
					}
					if (tentk.equals("butadd")) {
						btnadd = fileItem.getString();
					}
					if (tentk.equals("butupdate")) {
						btnupdate = fileItem.getString();
					}
				}
			}
			if (btnadd != null) {
				System.out.print(anh);
				gbo.themGiay(magiay, tengiay, maloai, Integer.parseInt(sl), Long.parseLong(gia), anh, tieude, size);
			} else if (btnupdate != null) {
				gbo.suaGiay(magiay, tengiay, maloai, Integer.parseInt(sl), Long.parseLong(gia), anh, tieude, size);
			} else { 
				if(tab != null) { 
					if(tab.equals("select")) { 
						  giaybean selectedGiay = gbo.finByMG(magiay);
						  if (selectedGiay != null) {
		                        request.setAttribute("tengiay", selectedGiay.getTengiay());
		                        request.setAttribute("magiay", magiay);
								request.setAttribute("size", size);
								request.setAttribute("sl", sl);
								request.setAttribute("gia", gia);
								request.setAttribute("maloai", maloai);
								request.setAttribute("anh", anh);
								request.setAttribute("tieude", selectedGiay.getTieude());
		                    }
				  }else if (tab.equals("delete")) { 
					  if (magiay != null) {
	                        gbo.xoaGiay(magiay);
	                 } 
				  } 
				}
			}
			
			ArrayList<giaybean> ds = gbo.getgiay();
	        request.setAttribute("dss", ds);
			
			response.sendRedirect("admingiayController");
		} catch (FileUploadException e) {
			System.out.println(e.getMessage());
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}

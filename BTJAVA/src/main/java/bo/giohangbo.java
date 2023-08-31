package bo;

import java.util.ArrayList;
import java.util.List;

import bean.giaybean;
import dao.giaydao;


public class giohangbo {
	giaydao sdao = new giaydao();
	// Tao ra 1 mang de luu Hang
	public List<giaybean> ds = new ArrayList<giaybean>();
	    
	public void Them(giaybean mg, int sl, String size) {
	    int n = ds.size();
	    for (int i = 0; i < n; i++) {
	        giaybean giayTrongGio = ds.get(i);
	        if (giayTrongGio.getMagiay().equalsIgnoreCase(mg.getMagiay()) && giayTrongGio.getSize().equalsIgnoreCase(size)) {
	            int slt = giayTrongGio.getSoluong() + sl;
	            giayTrongGio.setSoluong(slt);
	            long tt = (long) slt * mg.getGia();
	            giayTrongGio.setThanhtien(tt);
	            return;
	        }
	    }
	    // Nếu không tìm thấy giày cùng kích thước trong giỏ hàng, thêm giày mới vào
	    giaybean h = new giaybean(mg.getMagiay(), mg.getTengiay(), sl, mg.getGia(), mg.getMaloai(), mg.getAnh(), mg.getTieude(), size, 0);
	    ds.add(h);
	}


	
	public void Sua(String ms, int sl) {
	    int n = ds.size();
	    for (int i = 0; i < n; i++) {
	        if (ds.get(i).getMagiay().equals(ms)) {
	            ds.get(i).setSoluong(sl);
	            int gia = (int) ds.get(i).getGia();
	            long tt = (long) sl * gia; 
	            ds.get(i).setThanhtien(tt);
	            return;
	        }
	    }
	}


	public void Xoa(String ms) {
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (ds.get(i).getMagiay().toLowerCase().trim().equals(ms.toLowerCase().trim())) {
				ds.remove(i);
				return;
			}
		}
	}

	public void XoaTatCa() {
		ds.clear();
	}

	public void XoaDaChon(String[] th) {
		for (String item : th) {
			int n = ds.size();
			for (int i = 0; i < n; i++) {
				if (ds.get(i).getMagiay().equalsIgnoreCase(item.trim())) {
					ds.remove(i);
					break;
				}
			}
		}
	}
	
	
	public long Tongtien() {
		int n = ds.size();
		long s = 0;
		for (int i = 0; i < n; i++) {
			s = s + ds.get(i).getThanhtien();
		}
		return s;
	}
}
	

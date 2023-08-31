package bo;

import java.util.ArrayList;

import bean.sizebean;
import dao.sizedao;

public class sizebo {
	sizedao gzdao = new sizedao();
	public ArrayList<sizebean> getsize()throws Exception{
		return gzdao.getsize();
	}
}

package bo;

import java.util.ArrayList;

import bean.giaysizebean;
import dao.giaysizedao;


public class giaysizebo {
	giaysizedao gzdao = new giaysizedao();
	public ArrayList<giaysizebean> getgiaysize()throws Exception{
		return gzdao.getgiaysize();
	}
}

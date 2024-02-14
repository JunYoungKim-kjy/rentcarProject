package com.basic.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.RentcarVO;

public class AdminCarUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("업데이트");
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int category = Integer.parseInt(request.getParameter("category"));
		int price = Integer.parseInt(request.getParameter("price"));
		int usepeople = Integer.parseInt(request.getParameter("usepeople"));
		int totalQty = Integer.parseInt(request.getParameter("totalQty"));
		String company = request.getParameter("company");
		String info = request.getParameter("info");
		String img = request.getParameter("sFileName");
		RentcarVO vo = new RentcarVO(no, name, category, price, usepeople, totalQty, company, img, info);
		int check = RentCarDAO.getInstance().updateCar(vo);
		System.out.println("기도");
		if(check > 0) {
			DBUtil.alert(response, "업로드 성공", "/adminCarList.do");
			return null;
		}else {
			DBUtil.alert(response, "업로드 실패");
			return null;
		}
	}

}

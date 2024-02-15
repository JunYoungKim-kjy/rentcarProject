package com.basic.rentcar.controller.rentcar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.vo.RentcarVO;

public class CarListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<RentcarVO> list = null;
		System.out.println("category="+request.getParameter("category"));
		if(request.getParameter("category")==null) {
			list = RentCarDAO.getInstance().getSelectCar();
//			request.setAttribute("center", "rentcar/rentCarList.jsp");
			request.setAttribute("list", list);
			return "/rentcar/rentCarList";
		}
		String cate = request.getParameter("category");
		String temp = "";
		if(cate.equals("all")) {
			list = RentCarDAO.getInstance().getAllCar();
			temp = "all";
		}else {
			int cateNum = Integer.parseInt(cate);
			list = RentCarDAO.getInstance().getCategoryCar(cateNum);
			switch(cateNum) {
			case 1 : temp="소형";break;
			case 2 : temp="중형";break;
			case 3 : temp="대형";break;
			}
		}
		request.setAttribute("temp", temp);
		request.setAttribute("list", list);
//		request.setAttribute("center", "rentcar/rentCarList.jsp");
		return "/rentcar/rentCarList";
	}

}

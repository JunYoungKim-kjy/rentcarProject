package com.basic.rentcar.controller.rentcar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.Util;
import com.basic.rentcar.vo.RentcarVO;

public class AdminCarListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("admin")==null) {
			Util.alert(response, "잘못된 접근입니다.", "/main.do");
			return null;
		}
		ArrayList<RentcarVO> list = null;
		list = RentCarDAO.getInstance().getAllCar();
		request.setAttribute("list", list);
		return "/admin/carList";
	}

}

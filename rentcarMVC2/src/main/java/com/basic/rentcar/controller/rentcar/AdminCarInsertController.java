package com.basic.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;

public class AdminCarInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("admin")==null) {
			DBUtil.alert(response, "잘못된 접근입니다.", "/main.do");
			return null;
		}
		//차량 등록으로 이동
//		request.setAttribute("center", "admin/insertCar.jsp");
		return "/admin/insertCar";
	}

}

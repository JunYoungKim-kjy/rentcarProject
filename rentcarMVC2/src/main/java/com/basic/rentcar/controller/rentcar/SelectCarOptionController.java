package com.basic.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.RentcarVO;

public class SelectCarOptionController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("log")==null) {
			DBUtil.alert(response, "로그인 후 이용 가능합니다","/rentcarLogin.do");
			return null;
		}
		int no = Integer.parseInt(request.getParameter("no"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		RentcarVO bean = RentCarDAO.getInstance().getOneCar(no);
		
		request.setAttribute("bean", bean);
		request.setAttribute("qty", qty);
		request.setAttribute("center", "rentcar/carOption.jsp");
		return "main.do";
	}

}

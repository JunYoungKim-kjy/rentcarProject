package com.basic.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.Util;
import com.basic.rentcar.vo.RentcarVO;

public class CarInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("no")==null) {
			return "main.do";
		}
		String ctx = request.getContextPath();
		int no = Integer.parseInt(request.getParameter("no"));
		RentcarVO bean = RentCarDAO.getInstance().getOneCar(no);
		if(bean.getTotalQty() == 0) {
			Util.alert(response, "이 차량은 모두 대여중입니다.");
			return null;
		}
		int cateNum = bean.getCategory();
		String temp="";
		switch(cateNum) {
		case 1 : temp="소형";break;
		case 2 : temp="중형";break;
		case 3 : temp="대형";break;
		}
		request.setAttribute("temp", temp);
		request.setAttribute("bean", bean);
		return "/rentcar/rentcarInfo";
	}

}

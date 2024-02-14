package com.basic.rentcar.controller.rentcar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.ReservationDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.JoinCarViewVO;

public class UserReserveListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("log")==null) {
			System.out.println("[로그인 후 예약 가능]");
			DBUtil.alert(response, "로그인 후 이용 가능합니다","/rentcarLogin.do");
			return null;
		}
		String id = (String)session.getAttribute("log");
		ArrayList<JoinCarViewVO> v = ReservationDAO.getInstance().getAllReserve(id);
		request.setAttribute("v", v);
		request.setAttribute("center", "rentcar/userReserveList.jsp");
			
		return "rentcar/userReserveList";
	}

}

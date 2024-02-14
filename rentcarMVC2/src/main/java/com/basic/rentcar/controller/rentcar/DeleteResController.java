package com.basic.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.rentcar.dao.ReservationDAO;
import com.basic.rentcar.frontController.Controller;

public class DeleteResController implements Controller  {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int qty = Integer.parseInt(request.getParameter("qty"));
		int reserveSeq = Integer.parseInt(request.getParameter("resSeq"));
		int no = Integer.parseInt(request.getParameter("no"));
		String ctx = request.getContextPath();
		ReservationDAO.getInstance().carRemoveReserve(reserveSeq, qty, no);
		return "redirect:"+ctx+"/reserveList.do";
	}

}

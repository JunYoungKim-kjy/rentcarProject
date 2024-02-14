package com.basic.rentcar.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.rentcar.dao.UserDAO;
import com.basic.rentcar.frontController.Controller;

public class ValidateIdController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String result = UserDAO.getInstance().validate(id)? "notValid":"valid";
		System.out.println("result="+result);
		PrintWriter writer = response.getWriter();
		writer.print(result);
		return null;
	}

}

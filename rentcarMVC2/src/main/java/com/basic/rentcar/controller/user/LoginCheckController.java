package com.basic.rentcar.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.UserDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;

public class LoginCheckController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String ctx = request.getContextPath();
		if(request.getParameter("id")==null) {
			request.setAttribute("center", "./user/login.jsp");
			return "./user/login";
		}
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String dbpw = UserDAO.getInstance().checkId(id);
		System.out.println("id ="+ id);
		System.out.println("pw ="+ pw);
		System.out.println("dbpw ="+ dbpw);
		if(dbpw == null || !pw.equals(dbpw)) {
			DBUtil.alert(response, "아이디/비밀번호를 확인해주세요");
			return null;
		}
		HttpSession session = request.getSession();
		session.setAttribute("log", id);
		if(id.equals("admin"))session.setAttribute("admin", "admin");
		DBUtil.alert(response, id+"님 반갑습니다.","/main.do");
		return null;
	}

}

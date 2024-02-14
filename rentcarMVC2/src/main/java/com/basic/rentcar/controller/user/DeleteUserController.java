package com.basic.rentcar.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.UserDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;

public class DeleteUserController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("log")==null || "admin".equals((String)session.getAttribute("log"))) {
			DBUtil.alert(response, "잘못된 접근입니다.");
			return null;
		}
		String id = (String)session.getAttribute("log");
		int check = UserDAO.getInstance().userDelete(id);
		
		if(check > 0) {
			if(session.getAttribute("admin")==null) {
				session.invalidate();
			}
			DBUtil.alert(response, "회원탈퇴가 완료되었습니다", "/main.do");
			return null;
		}else {
			DBUtil.alert(response, "회원탈퇴 실패");
			return null;
		}
	}

}

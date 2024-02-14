package com.basic.rentcar.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.rentcar.dao.UserDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.UserVO;


public class JoinUserController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctx = request.getContextPath();
		System.out.println("id 2 ="+request.getParameter("id"));
		if(request.getParameter("id")==null) {
			request.setAttribute("center", "user/join.jsp");
			return "user/join";
		}
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String job = request.getParameter("job");
		String hobby = request.getParameter("hobby");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String info = request.getParameter("info");
		UserVO vo = new UserVO(id, pw, email, phone, hobby, job, age, info);
		int check = UserDAO.getInstance().joinUser(vo);
		System.out.println("오나요?");
		if(check > 0) {
			DBUtil.alert(response, "회원가입 완료","/main.do");
			return null;
		}else {
			DBUtil.alert(response, "회원가입 실패");
			return null;
		}
	}

}

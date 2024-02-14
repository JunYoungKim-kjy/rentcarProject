package com.basic.rentcar.controller.user;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.UserDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.UserVO;

public class UpdateUserController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log"); 
		String age = request.getParameter("age");//필수
		String job = request.getParameter("job");
		String hobby = request.getParameter("hobby");
		String email = request.getParameter("email");//필수
		String tel = request.getParameter("tel");//필수
		String info = request.getParameter("info");
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setAge(age);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setInfo(info);
		
		System.out.println(request.getParameter("info"));
		System.out.println("update="+id);
		System.out.println(vo.getAge());
		System.out.println(vo.getJob());
		System.out.println(vo.getHobby());
		System.out.println(vo.getEmail());
		System.out.println(vo.getTel());
		System.out.println(vo.getInfo());
		int check = UserDAO.getInstance().userUpdate(vo);
		if(check > 0) {
			DBUtil.alert(response, "회원정보 수정 완료","/main.do");
			return null;
		}else {
			DBUtil.alert(response, "회원정보 수정 실패");
			return null;
		}
	}

}

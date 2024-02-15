package com.basic.rentcar.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.UserDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.UserVO;

public class UserInfoController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("log")==null) {
			DBUtil.alert(response, "로그인 후 이용 가능합니다","/rentcarLogin.do");
			return null;
		}
		String id = (String)session.getAttribute("log");
		System.out.println("마이페이지 id="+id);
		UserVO vo = UserDAO.getInstance().getVO(id);
		request.setAttribute("vo", vo);
//		request.setAttribute("center", "user/userInfo.jsp");
		return "/user/userInfo";
		
	}

}

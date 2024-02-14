package com.basic.rentcar.frontController;

import java.io.IOException;

import javax.naming.spi.Resolver;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class RentcarFrontController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		System.out.println("uri="+uri);
		System.out.println("ctx="+ctx);
		System.out.println("command="+command);
		System.out.println("id="+request.getParameter("id"));
		System.out.println("name="+request.getParameter("name"));
		
		HandlerMapping mapping = new HandlerMapping();
		Controller controller = null;
		String nextPage = null;
		
		controller = mapping.getController(command);
		nextPage = controller.requestHandler(request, response);
		
		if(nextPage != null) {
			if(nextPage.indexOf("redirect:") != -1) {
				response.sendRedirect(nextPage.split(":")[1]);
			}else {
				System.out.println("center=" + request.getAttribute("center"));
				System.out.println("nextPage ="+nextPage);
				System.out.println(ViewResolver.makeView(nextPage));
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
				rd.forward(request, response);
			}
		}
		
		
	}
}

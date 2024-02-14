package com.basic.rentcar.controller.rentcar;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.vo.RentcarVO;

public class DeleteImgController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		//파일 삭제
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
				
		RentcarVO vo = RentCarDAO.getInstance().getOneCar(no);
		Path filePath = Paths.get(saveDirectory, vo.getsFileName());
		try {
			Files.deleteIfExists(filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		int cnt = RentCarDAO.getInstance().uploadImg(no, null, null);
		if (cnt > 0) {
			response.getWriter().print("success");
		}else{
			response.getWriter().print("fail");
		}
		return null;
	}

}

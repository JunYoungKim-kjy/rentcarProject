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
import com.basic.rentcar.util.Util;
import com.basic.rentcar.vo.RentcarVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertCarController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		Path saveDirPath = Paths.get(saveDirectory);
		//저장위치 Path로 받아오기
		if(!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		System.out.println("저장위치 = "+saveDirectory);
		MultipartRequest multi = new MultipartRequest(request, saveDirPath.toString(),5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		//파일 업로드 시에는 MultipartRequest만 사용.
		// 데이터 받기----<주의하기> request가 아닌 multi로 값을 받자
		// 폼에서 전송한 파라미터의 이름을 인자로 받아서 그 파라미터의 값을 반환한다.
		// request 객체 사용 불가.
		// multi 객체로 대체사용
		System.out.println("????");
		
		String sFileName = null;
		String oFileName = null;
		if(multi.getFilesystemName("uploadFile") != null) {
			sFileName = multi.getFilesystemName("uploadFile"); // 실제 서버에 저장되는 파일
			oFileName = multi.getOriginalFileName("uploadFile"); // 원본파일
			String fileType = multi.getContentType("uploadFile");//업로드파일의 형식
			System.out.println("파일 형식 = "+ fileType);
		}
		String name = multi.getParameter("name");
		int category = Integer.parseInt(multi.getParameter("category"));
		int price = Integer.parseInt(multi.getParameter("price"));
		int usepeople = Integer.parseInt(multi.getParameter("usepeople"));
		int totalQty = Integer.parseInt(multi.getParameter("totalQty"));
		String company = multi.getParameter("company");
		String info = multi.getParameter("info");
		RentcarVO vo = new RentcarVO(name, category, price, usepeople, totalQty, company, sFileName, info, sFileName, oFileName);
		int check = RentCarDAO.getInstance().insertCar(vo);
		if(check > 0) {
			Util.alert(response, "차량 등록 성공", "/adminCarList.do");
			return null;
		}else {
			Util.alert(response, "차량 등록 실패");
			return null;
		}
	}

}

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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadCarImgController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		
		Path saveDirPath = Paths.get(saveDirectory);
		if(!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		System.out.println("saveDirectory = " + saveDirectory);

		MultipartRequest multi = new MultipartRequest(request, saveDirPath.toString(), 5 * 1024 * 1024, "UTF-8",new DefaultFileRenamePolicy());
		
		String sFileName = null;
		String oFileName = null;
		if(multi.getFilesystemName("uploadFile") != null) {
			sFileName = multi.getFilesystemName("uploadFile");
			oFileName = multi.getOriginalFileName("uploadFile");
			String fileType = multi.getContentType("uploadFile");
			System.out.println("파일유형="+fileType);
		}
		System.out.println("save = "+sFileName);
		System.out.println("origin = "+oFileName);
		System.out.println("업로드 됨??");
		int no = Integer.parseInt(multi.getParameter("no"));
		
		int cnt = RentCarDAO.getInstance().uploadImg(no,sFileName,oFileName);
		
		if(cnt > 0) {
			response.getWriter().print(sFileName);
		}else {
			response.getWriter().print("fail");
		}
		return null;
	}

}

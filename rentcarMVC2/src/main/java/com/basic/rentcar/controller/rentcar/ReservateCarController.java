package com.basic.rentcar.controller.rentcar;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.rentcar.dao.RentCarDAO;
import com.basic.rentcar.dao.ReservationDAO;
import com.basic.rentcar.frontController.Controller;
import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.RentcarVO;
import com.basic.rentcar.vo.ReservationVO;

public class ReservateCarController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("log")==null) {
			System.out.println("[로그인 후 예약 가능]");
			DBUtil.alert(response, "로그인 후 이용 가능합니다","/rentcarLogin.do");
			return null;
		}
		String rday = request.getParameter("rday");
		Date d1 = new Date();
	 	Date d2 = new Date();
	 	// 
	 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 	try {
			d1 = sdf.parse(rday);
			d2 = sdf.parse(sdf.format(d2));		// format() 메서느는 SimpleDateFormat과 같은 역할(yyyy-MM-dd)
			System.out.println("d1="+d1);
			System.out.println("d2="+d2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	 	// 날짜비교 메서드 사용
	 	int compare = d1.compareTo(d2);
	 	// 예약하려는 날짜가 현재 날짜보다 이전이라면 -1
	 	// 예약하려는 날짜와 현재 날짜가 같다면 0
	 	// 예약하려는 날짜가 현재 날짜보다 이후라면 1을 리턴
	 	// System.out.println(compare);
	 	if(compare <= 0){
	 		// 오늘보다 이전 날짜를 선택했을 시
	 		DBUtil.alert(response, "당일기준 다음날 부터 예약 가능합니다.");
	 		return null;
			/*
			 * <script type="text/javascript"> alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음");
			 * history.go(-1); </script>
			 */
	 		
	 	}
	 	int no = Integer.parseInt(request.getParameter("no"));
	 	String id = (String)session.getAttribute("log");
	 	int qty = Integer.parseInt(request.getParameter("qty"));
	 	int dday = Integer.parseInt(request.getParameter("dday"));
	 	int usein = Integer.parseInt(request.getParameter("usein"));
	 	int usewifi = Integer.parseInt(request.getParameter("usewifi"));
	 	int usenavi = Integer.parseInt(request.getParameter("usenavi"));
	 	int useseat = Integer.parseInt(request.getParameter("useseat"));
	 	ReservationVO rbean = new ReservationVO(no, id, qty, dday, rday, usein, usewifi, usenavi, useseat);
	 	ReservationDAO.getInstance().setReserveCar(rbean);
	 	RentcarVO bean = RentCarDAO.getInstance().getOneCar(no);
	  	// 선택 시(1), 10,000원 추가
	  	if(usein == 1)usein = 10000; 
	  	else usein=0;
	  	if(usewifi == 1)usewifi = 10000;
		else usewifi=0;
	  	if(useseat == 1)useseat = 10000;
		else useseat=0;
	  	// 옵션 금액
	  	int totalOption = (rbean.getQty() * rbean.getDday() * (usein + usewifi + useseat));
	  	// 차량 총 금액
	  	int totalCar = bean.getPrice() * rbean.getQty() * rbean.getDday();
	  	System.out.println("차가격="+bean.getPrice());
	  	System.out.println("빌린개수="+rbean.getQty());
	  	System.out.println("날짜="+rbean.getDday());
	  	request.setAttribute("totalCar", totalCar);
		request.setAttribute("usein", usein);
		request.setAttribute("usewifi", usewifi);
		request.setAttribute("useseat", useseat);
		request.setAttribute("totalOption", totalOption);
		request.setAttribute("bean", bean);
//		request.setAttribute("center", "rentcar/registerCar.jsp");
		return "/rentcar/registerCar";
	}

}

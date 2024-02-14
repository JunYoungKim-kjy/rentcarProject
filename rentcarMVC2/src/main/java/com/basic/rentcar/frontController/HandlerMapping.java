package com.basic.rentcar.frontController;

import java.util.HashMap;

import com.basic.rentcar.controller.user.*;
import com.basic.rentcar.controller.rentcar.*;

public class HandlerMapping {
	HashMap<String, Controller> mapping;
	HandlerMapping(){
		mapping = new HashMap<String, Controller>();
		mapping.put("/main.do", new MainController());
		//유저
		mapping.put("/rentcarLogin.do", new LoginCheckController());
		mapping.put("/rentcarLogout.do", new LogOutController());
		mapping.put("/rentcarJoin.do", new JoinUserController());
		mapping.put("/rentcarDelete.do", new DeleteUserController());
		mapping.put("/rentcarContent.do", new UserInfoController());
		mapping.put("/rentcarValidId.do", new ValidateIdController());
		mapping.put("/userUpdate.do", new UpdateUserController());
		mapping.put("/userDelete.do", new DeleteUserController());
		//렌트
		mapping.put("/carList.do", new CarListController());
		mapping.put("/carInfo.do", new CarInfoController());
		mapping.put("/selectCarOption.do", new SelectCarOptionController());
		mapping.put("/reservateCar.do", new ReservateCarController());
		//admin
		mapping.put("/adminCarList.do", new AdminCarListController());
		mapping.put("/insertCar.do", new InsertCarController());
		mapping.put("/adminInsert.do", new AdminCarInsertController());
		mapping.put("/carContent.do", new AdminCarContentController());
		mapping.put("/carUploadImg.do", new UploadCarImgController());
		mapping.put("/carDeleteImg.do", new DeleteImgController());
		mapping.put("/carUpdate.do", new AdminCarUpdateController());
		//예약
		mapping.put("/reserveList.do", new UserReserveListController());
		mapping.put("/reserveDelete.do", new DeleteResController());
	}
	public Controller getController(String key) {
		return mapping.get(key);
	}
}

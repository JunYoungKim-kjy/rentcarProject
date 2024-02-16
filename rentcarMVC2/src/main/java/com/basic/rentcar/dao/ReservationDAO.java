package com.basic.rentcar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.basic.rentcar.util.Util;
import com.basic.rentcar.vo.JoinCarViewVO;
import com.basic.rentcar.vo.ReservationVO;


public class ReservationDAO {
	private ReservationDAO() {}
	private static ReservationDAO instance = null;
	public static ReservationDAO getInstance() {
		if(instance == null)instance = new ReservationDAO();
		return instance;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<JoinCarViewVO> getAllReserve() {
		ArrayList<JoinCarViewVO> v = new ArrayList<JoinCarViewVO>();
		JoinCarViewVO bean = null;
		conn = Util.getConnection();
		String sql = "select * , m.name as \"username\" ,a2.name as \"carname\"  from rentcar a2 ,carreserve a1 , member m where a1.no = a2.no and a1.id = m.id";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new JoinCarViewVO();
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setUserName(rs.getString("username"));
				bean.setReserveSeq(rs.getInt("reserve_seq"));
				bean.setName(rs.getString("carname"));
				bean.setImg(rs.getString("img"));
				bean.setQty(rs.getInt("qty"));
				bean.setDday(rs.getInt("dday"));
				bean.setRday(rs.getString("rday"));
				bean.setUsein(rs.getInt("usein"));
				bean.setUsewifi(rs.getInt("usewifi"));
				bean.setUsenavi(rs.getInt("usenavi"));
				bean.setUseseat(rs.getInt("useseat"));
				bean.setsFileName(rs.getString("sFileName"));
				bean.setoFileName(rs.getString("oFileName"));
								//옵션 총개수 * 차량 대수 
				int option = (bean.getUsein()+bean.getUsewifi()+bean.getUseseat()) * bean.getQty();
				bean.setPrice(rs.getInt("price") * rs.getInt("dday") * rs.getInt("qty") + ((option*10000)*rs.getInt("dday")));
				v.add(bean);
				System.out.println(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
		return v;
	}
	public ArrayList<JoinCarViewVO> getOneReserveById(String id) {
		ArrayList<JoinCarViewVO> v = new ArrayList<JoinCarViewVO>();
		JoinCarViewVO bean = null;
		String sql = "select * from rentcar a2 ,carreserve a1  where a1.id = ? and a1.no = a2.no";
		conn = Util.getConnection();
		try {
			System.out.println(id);
			pstmt = conn.prepareStatement(sql);
			if(!id.equals("admin"))pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new JoinCarViewVO();
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setId(rs.getString("name"));
				bean.setReserveSeq(rs.getInt("reserve_seq"));
				bean.setName(rs.getString("name"));
				bean.setImg(rs.getString("img"));
				bean.setQty(rs.getInt("qty"));
				bean.setDday(rs.getInt("dday"));
				bean.setRday(rs.getString("rday"));
				bean.setUsein(rs.getInt("usein"));
				bean.setUsewifi(rs.getInt("usewifi"));
				bean.setUsenavi(rs.getInt("usenavi"));
				bean.setUseseat(rs.getInt("useseat"));
				bean.setsFileName(rs.getString("sFileName"));
				bean.setoFileName(rs.getString("oFileName"));
				//옵션 총개수 * 차량 대수 
				int option = (bean.getUsein()+bean.getUsewifi()+bean.getUseseat()) * bean.getQty();
				bean.setPrice(rs.getInt("price") * rs.getInt("dday") * rs.getInt("qty") + ((option*10000)*rs.getInt("dday")));
				v.add(bean);
				System.out.println(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
		return v;
	}
	public void setReserveCar(ReservationVO bean) {
		conn = Util.getConnection();
		int num = 0;
		try {
			String sql = "INSERT INTO carreserve ( no, id, qty, dday, rday, "
				   + "usein, usewifi, usenavi, useseat)" + " VALUES( ?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getDday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getUsein());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUsenavi());
			pstmt.setInt(9, bean.getUseseat());
			if(pstmt.executeUpdate() > 0) {
				updateRentcarQty(bean.getNo() ,bean.getQty());
				System.out.println("차량 예약 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
	}
	public void carRemoveReserve(int reserveSeq ,int qty , int no) {

		conn = Util.getConnection();
		try {
			String sql = "DELETE FROM carreserve where reserve_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveSeq);
			if(pstmt.executeUpdate()> 0 ) {
				backRentcarQty(no, qty);
				System.out.println("삭제 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
	}
	
	// 삭제하면 다시 토탈 car 다시 업데이트 되야함 
	public void backRentcarQty(int no , int rentQty) {
		conn = Util.getConnection();

		try {
			String sql = "update rentcar set total_qty =total_qty + ? where no = ?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, rentQty);
			pstmt.setInt(2, no);
		
			pstmt.executeUpdate();	
			
			System.out.println("rentQty= " + rentQty);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
	}
	private void updateRentcarQty(int no , int rentQty) {
		conn = Util.getConnection();
		try {
			String sql = "update rentcar set total_qty =total_qty - ? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rentQty);
			pstmt.setInt(2, no);
			pstmt.executeUpdate();	
			System.out.println("수량 업데이트 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
	}
}

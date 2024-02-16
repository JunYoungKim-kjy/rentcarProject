package com.basic.rentcar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.basic.rentcar.util.Util;
import com.basic.rentcar.vo.RentcarVO;


public class RentCarDAO {
	private static RentCarDAO instance = new RentCarDAO();
	public static RentCarDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public int uploadImg(int no, String sFileName,String oFileName) {
		int cnt = 0;
		String sql = "UPDATE rentcar set sFileName=?,oFileName=? WHERE no=?";
		conn = Util.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sFileName);
			pstmt.setString(2, oFileName);
			pstmt.setInt(3, no);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn, pstmt, rs);
		}
		return cnt;
	}
	public int updateCar(RentcarVO vo) {
		int cnt=0;
		String sql = "UPDATE rentcar set name=?,category=?,price=?,usepeople=?,total_qty=?,company=?,img=?,info=? WHERE no=?";
		conn = Util.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getCategory());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setInt(4, vo.getUsepeople());
			pstmt.setInt(5, vo.getTotalQty());
			pstmt.setString(6, vo.getCompany());
			pstmt.setString(7, vo.getImg());
			pstmt.setString(8, vo.getInfo());
			pstmt.setInt(9, vo.getNo());
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn, pstmt, rs);
		}
		
		return cnt;
		
	}
	public RentcarVO getOneCar(int no) {
		RentcarVO bean = new RentcarVO();
		String sql = "SELECT * FROM rentcar WHERE no=?";
		conn = Util.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("no=" + no );
				System.out.println("total qty=" + rs.getInt("total_qty"));
				bean.setNo(no);
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				bean.setsFileName(rs.getString("sFileName"));
				bean.setoFileName(rs.getString("oFileName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
		return bean;
	}
	public int insertCar(RentcarVO vo) {
		String sql="INSERT INTO rentcar VALUES (null,?,?,?,?,?,?,?,?,?,?)";
		conn = Util.getConnection();
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getCategory());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setInt(4, vo.getUsepeople());
			pstmt.setInt(5, vo.getTotalQty());
			pstmt.setString(6, vo.getCompany());
			pstmt.setString(7, vo.getImg());
			pstmt.setString(8, vo.getInfo());
			pstmt.setString(9, vo.getsFileName());
			pstmt.setString(10, vo.getoFileName());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
		return cnt;
	}
	public ArrayList<RentcarVO> getCategoryCar(int cate) {
		ArrayList<RentcarVO> v = new ArrayList<>();
		RentcarVO bean = null;
		conn = Util.getConnection();
		try {
			String sql = "SELECT * FROM rentcar WHERE category=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cate);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RentcarVO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				bean.setsFileName(rs.getString("sFileName"));
				bean.setoFileName(rs.getString("oFileName"));
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
		return v;
	}
	public ArrayList<RentcarVO> getAllCar() {
		ArrayList<RentcarVO> v = new ArrayList<>();
		RentcarVO bean = null;
		conn = Util.getConnection();
		try {
			String sql = "SELECT * FROM rentcar";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RentcarVO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				bean.setsFileName(rs.getString("sFileName"));
				bean.setoFileName(rs.getString("oFileName"));
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}
		return v;
	}
	public ArrayList<RentcarVO> getSelectCar() {
		
		ArrayList<RentcarVO> v = new ArrayList<RentcarVO>();

		try {
			
			conn = Util.getConnection();

			String sql = "SELECT * FROM rentcar ORDER BY no DESC";
			// String sql = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 3";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {

				RentcarVO bean = new RentcarVO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getInt("category"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsepeople(rs.getInt("usepeople"));
				bean.setTotalQty(rs.getInt("total_qty"));
				bean.setCompany(rs.getString("company"));
				bean.setImg(rs.getString("img"));
				bean.setInfo(rs.getString("info"));
				bean.setsFileName(rs.getString("sFileName"));
				bean.setoFileName(rs.getString("oFileName"));
				
				
				v.add(bean);
				count++;
				
//				if (count > 2)
//					break; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.dbclose(conn,pstmt,rs);
		}

		return v;
	}

}

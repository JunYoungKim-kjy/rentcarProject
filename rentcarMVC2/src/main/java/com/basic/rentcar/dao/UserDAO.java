package com.basic.rentcar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.basic.rentcar.util.DBUtil;
import com.basic.rentcar.vo.UserVO;


public class UserDAO {
	private static UserDAO instance = null;
	private UserDAO() {}
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public static UserDAO getInstance() {
		if(instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	public int userDelete(String id) {
		String sql = "DELETE FROM member WHERE id =?";
		int cnt = 0;
		conn = DBUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			cnt = pstmt.executeUpdate();
			System.out.println("[삭제 완료]");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[삭제 실패]");
		}  finally {
			DBUtil.dbclose(conn,pstmt,rs);
		}
		return cnt;
	}
	public UserVO getVO(String id) {
		String sql = "SELECT * FROM member where id=?";
		conn = DBUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("no");
				id = rs.getString("id");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String hobby = rs.getString("hobby");
				String job = rs.getString("job");
				String age = rs.getString("age");
				String info = rs.getString("info");
				UserVO vo = new UserVO(num, id, pw, email, tel, hobby, job, age, info);
				return vo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,pstmt,rs);
		}
		return null;
	}
	public String checkId(String id) {
		String sql = "select pw from member where id = ?";
		conn = DBUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("pw");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,pstmt,rs);
		}
		return null;
	}
	public boolean validate(String id) {
		String sql = "select id from member where id=?";
		conn = DBUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,pstmt,rs);
		}
		return false;
	}
	public int userUpdate(UserVO vo) {
		   String SQL="update member set age=?, email=?, tel=?, job=?,hobby=?,info=? where id=?";
		   conn = DBUtil.getConnection();
		   int cnt=0;
		   try {
		   	pstmt=conn.prepareStatement(SQL);
		   	pstmt.setString(1, vo.getAge());
		   	pstmt.setString(2, vo.getEmail());
		   	pstmt.setString(3, vo.getTel());
		   	pstmt.setString(4, vo.getJob());
		   	pstmt.setString(5, vo.getHobby());
		   	pstmt.setString(6, vo.getInfo());
		   	pstmt.setString(7, vo.getId());
		   	cnt=pstmt.executeUpdate();
		   	System.out.println("[회원수정 완료]");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[회원수정 실패]");
		}finally {
			DBUtil.dbclose(conn,pstmt,rs);
		}	   
		   return cnt;
	}
	public int joinUser(UserVO user) {
		String sql = "INSERT INTO member VALUES(null,?,?,?,?,?,?,?,?)";
		conn = DBUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getTel());
			pstmt.setString(5, user.getHobby());
			pstmt.setString(6, user.getJob());
			pstmt.setString(7, user.getAge());
			pstmt.setString(8, user.getInfo());
			System.out.println("[회원가입 성공]");
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[회원가입 실패]");
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,pstmt,rs);
		}
		return 0;
	}
}

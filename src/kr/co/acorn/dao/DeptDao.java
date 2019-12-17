package kr.co.acorn.dao;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.DeptDto;
import kr.co.acorn.hello.ConnLoactor;

public class DeptDao {
	private static String id = null;
	private static String pwd = null;
	private static DeptDao single;

	
	// 1. singleton pattern

	private DeptDao() {
	}

	public static DeptDao getInstance() {
		if (single == null) {
			single = new DeptDao();
		}
		return single;
	}

	public boolean insert(DeptDto dto) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO dept VALUES(?,?,?)");

			pstmt = con.prepareStatement(sql.toString());

			int index = 0;
			pstmt.setInt(++index, dto.getNo());
			pstmt.setString(++index, dto.getName());
			pstmt.setString(++index, dto.getLoc());

			pstmt.executeUpdate();

			isSuccess = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public boolean update(DeptDto dto) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE dept SET dname = ?, loc = ? WHERE deptno = ?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 0;
			pstmt.setString(++index, dto.getName());
			pstmt.setString(++index, dto.getLoc());
			pstmt.setInt(++index, dto.getNo());
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public boolean delete(int deptNo) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnLoactor.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("delete from dept ");
			sql.append("where deptno=?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 0;
			pstmt.setInt(++index, deptNo);
			pstmt.executeUpdate();

			isSuccess = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public ArrayList<DeptDto> select() {
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLoactor.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select * from dept");
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int deptno = rs.getInt(1);
				String dname = rs.getString(2);
				String loc = rs.getString(3);
				list.add(new DeptDto(deptno,dname,loc));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	
	
	public DeptDto select(int deptNo) {
		DeptDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con  =ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * from dept ");
			sql.append("where deptno = ? ");
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setInt(++index, deptNo);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				int deptno = rs.getInt(1);
				String dname = rs.getString(2);
				String loc = rs.getString(3);
				dto = new DeptDto(deptno,dname,loc);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close(con, pstmt);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	private void close(Connection con, PreparedStatement pstmt) throws SQLException {
		if (pstmt != null)
			pstmt.close();

		if (con != null)
			con.close();
	}

}
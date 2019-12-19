package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.DeptDto;
import kr.co.acorn.hello.ConnLoactor;

public class DeptDao {

	private static DeptDao single;

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
		PreparedStatement psmt = null;
		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT into dept(deptno,dname,loc) VALUES(?,?,?);");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setInt(++index,dto.getNo());
			psmt.setString(++index,dto.getName());
			psmt.setString(++index,dto.getLoc());
			psmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (psmt != null)
					psmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return isSuccess;
		
	}
	
	public boolean update(DeptDto dto) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement psmt = null;
		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update dept set dname = ? , loc = ? where deptno = ?");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setString(++index,dto.getName());
			psmt.setString(++index,dto.getLoc());
			psmt.setInt(++index,dto.getNo());
			psmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}

	public boolean delete(int no) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement psmt = null;
		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete from dept where deptno = ?");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setInt(++index,no);
			psmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	public ArrayList<DeptDto> select(int start, int len) {
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT deptno,dname,loc FROM dept ");
			sql.append("ORDER BY deptno ");
			sql.append("LIMIT ?,?;");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setInt(++index, start);
			psmt.setInt(++index, len);
			rs = psmt.executeQuery();
			while (rs.next()) {
				index = 0;
				int no = rs.getInt(++index);
				String name = rs.getString(++index);
				String loc = rs.getString(++index);
				list.add(new DeptDto(no, name, loc));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (psmt != null)
					psmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	
	public DeptDto select(int no) {
		DeptDto dto = null;
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT deptno,dname,loc FROM dept ");
			sql.append("WHERE deptno = ? ");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setInt(++index, no);
			rs = psmt.executeQuery();
			if (rs.next()) {
				index = 0;
				no = rs.getInt(++index);
				String name = rs.getString(++index);
				String loc = rs.getString(++index);
				dto = new DeptDto(no, name, loc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (psmt != null)
					psmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return dto;
	}
	
	
	
	@SuppressWarnings("finally")
	public int getTotalRows() {
		int rows = 0;
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			con = ConnLoactor.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(deptno) FROM dept ");
			psmt = con.prepareStatement(sql.toString());
			rs = psmt.executeQuery();
			if (rs.next()) {
				int index = 0;
				rows = rs.getInt(++index);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (psmt != null)
					psmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return rows;
		}
	}
}

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
		if(single == null) {
			single = new DeptDao();
		}
		return single;
	}
	public ArrayList<DeptDto> select(int start,int len){
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con  = null;
		PreparedStatement psmt = null;
		ResultSet rs =null;
		
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
			while(rs.next()) {
				index = 0;
				int no = rs.getInt(++index);
				String name = rs.getString(++index);
				String loc  = rs.getString(++index);
				list.add(new DeptDto(no,name,loc));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				try {
					if(rs != null)
					rs.close();
					if(psmt != null)
						psmt.close();
					if(con != null)
						con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		

		return list;
	}
}	

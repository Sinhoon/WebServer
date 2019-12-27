package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.acorn.dto.MemberDto;
import kr.co.acorn.hello.ConnLocator;

public class MemberDao {
	private static MemberDao single;

	public static MemberDao getInstance() {
		if (single == null) {
			single = new MemberDao();
		}
		return single;
	}

	public int getTotalRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(m_email) ");
			sql.append("FROM member ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 0;

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 0;
				count = rs.getInt(++index);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return count;
	}

	public boolean isEmail(String email) {
		boolean isSuccess = true;
		Connection con = null;
		PreparedStatement psmt = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_email ");
			sql.append("from member ");
			sql.append("WHERE m_email = ?");

			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setString(++index, email);

			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				isSuccess = true;
			}
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

	public String selectJSON(int start, int len) {
		JSONObject jsonobj = new JSONObject();
		JSONArray jsonarr = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_email, m_name, m_phone , DATE_FORMAT(m_regdate,'%Y/%m/%d') ");
			sql.append("FROM member ");
			sql.append("ORDER BY m_regdate DESC ");
			sql.append("LIMIT ? , ? ");
			pstmt = con.prepareStatement(sql.toString());

			int index = 0;
			pstmt.setInt(++index, start);
			pstmt.setInt(++index, len);

			rs = pstmt.executeQuery();

			JSONObject item = null;
			while (rs.next()) {
				index = 0;
				String m_email = rs.getString(++index);
				String m_name = rs.getString(++index);
				String m_phone = rs.getString(++index);
				String m_regdate = rs.getString(++index);

				item = new JSONObject();
				item.put("email", m_email);
				item.put("name", m_name);
				item.put("phone", m_phone);
				item.put("regdate", m_regdate);
				jsonarr.add(item);
			}
			jsonobj.put("memberlist", jsonarr);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return jsonobj.toString();
	}

	public MemberDto isMember(MemberDto dto) {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT   m_email,m_name, m_phone , Date_Format(m_regdate,'%Y/%m/%d') ");
			sql.append("FROM member ");
			sql.append("WHERE m_email = ? AND m_pwd = PASSWORD(?)");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setString(++index, dto.getEmail());
			psmt.setString(++index, dto.getPassword());
			rs = psmt.executeQuery();
			if (rs.next()) {
				index = 0;
				String email = rs.getString(++index);
				String name = rs.getString(++index);
				String phone = rs.getString(++index);
				String regdate = rs.getString(++index);
				dto = new MemberDto(name, email, phone, null, regdate);
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
}

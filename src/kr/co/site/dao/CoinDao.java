package kr.co.site.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.acorn.hello.ConnLocator;
import kr.co.site.dto.CoinDto;

public class CoinDao {
	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static CoinDao single;

	private CoinDao() {

	}

	public static CoinDao getInstance() {
		if (single == null) {
			single = new CoinDao();
		}
		return single;
	}

	public boolean insert(CoinDto dto) {
		boolean isSuccess = false;
		DataSource ds = null;
		Connection con = null;
		PreparedStatement psmt = null;

		try {
			con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/site?autoReconnect=true" ,"root","123");
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT into coin(cname,cprice,ctime) VALUES(?,?,DATE_FORMAT(?,'%y/%m/%d/%h/%m'));");
			psmt = con.prepareStatement(sql.toString());
			int index = 0;
			psmt.setString(++index, dto.getName());
			psmt.setDouble(++index, dto.getPrice());
			psmt.setString(++index, dto.getTime());
			psmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
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
}

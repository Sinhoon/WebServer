package kr.co.acorn.hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;



@WebServlet("/hey")
public class TomcatConnection extends HttpServlet {
	public void service(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		DataSource ds =null;
		PreparedStatement psmt =null;
		Connection con = null;
		ResultSet rs =null;
		
		try {
			Context context = new InitialContext();
			// java:comp/env => 고정
			// jdbc/acorn => context.xml의 name 속성 값과 일치
			ds = (DataSource)context.lookup("java:comp/env/jdbc/acorn");
			// ds.getConnection()은 connection pool 에서 이미 만들어진 connection 객체를 가져온다.
			// 객체 생성 하는 것이아니라 가져오는 것
			con = ds.getConnection();
			StringBuffer sql = new StringBuffer("select deptno,dname,loc from dept");
			psmt = con.prepareStatement(sql.toString());
			rs =psmt.executeQuery();
			while(rs.next()) {
				int index = 0;
				int detno = rs.getInt(++index);
				String dname = rs.getString(++index);
				String loc = rs.getString(++index);
				out.println(detno+" "+dname+" "+loc+"<br>");
			}
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
				try {
					if(rs != null) {
						rs.close();
					}
					if(con != null) {
					con.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // connection 객체 종료하는것이 아니라 반납
			}
		}

		
	}

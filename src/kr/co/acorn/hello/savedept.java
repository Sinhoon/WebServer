package kr.co.acorn.hello;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.acorn.dao.DeptDao;
import kr.co.acorn.dto.DeptDto;
@WebServlet("/saveservlet")
public class savedept extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 파라미터가 한글일 경우
		int no = Integer.parseInt(req.getParameter("no"));	
		String name = req.getParameter("name");	
		String loc = req.getParameter("loc");	
		DeptDto dto = new DeptDto(no,name,loc);
		DeptDao dao = DeptDao.getInstance();
		/*boolean isSuccess = dao.insert(dto);
		if(isSuccess) {
			resp.sendRedirect("/dept_success.html");
		}
		else {
			resp.sendRedirect("/dept.html");
		}*/
	}
	
	

}
	

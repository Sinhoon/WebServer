package kr.co.acorn.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
// 서블릿 호출에 사용  안쓰면 web.xml파일(DD파일)에 서블릣 정보를 추가해야 한다.
/* url 패턴 지정
	1. extension matching 	=> *.do *.nhn *.acorn
	2. exact matching     	=> /test /test/acorn /*.do
	3. wildcard matching 	=> /test/*
	
	1번  /시작 x 2,3번 /시작 o
*/
@WebServlet("/acorn")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//mime 타입 /  문자인코딩
		response.setContentType("text/html;charset=utf-8");
		// 클라이언트 출력 객체
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pwd =request.getParameter("pwd");	
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<body>");
		out.print(id+pwd);
		out.print("<h1> Hello SinHoon </h1>");
		out.print("</body>");
		out.print("</html>");
		
	}

	

}

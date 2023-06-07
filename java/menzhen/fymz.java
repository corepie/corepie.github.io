package menzhen;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class fymz
 */
@WebServlet("/fymz.do")
public class fymz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fymz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		///String main1 = request.getParameter("key");
		//System.out.println("key:"+main1);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		String main = request.getParameter("key");
		//int main1 = Integer.parseInt(request.getParameter("key"));
		//System.out.println("main «£∫"+main);
		session.setAttribute("main", main);

		 String UTF_8text1 = "guahao";
		    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/administrator/menzhen/menzhen.jsp");	
	}

}

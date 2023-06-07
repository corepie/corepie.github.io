package patient;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class selectbr
 */
@WebServlet("/selectbr.do")
public class selectbr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectbr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		
		String pname = request.getParameter("pname");
		String psex = request.getParameter("psex");
		String page = request.getParameter("page");
		String pmoney = request.getParameter("pmoney");
		
		//String btn = request.getParameter("btn");
		//System.out.println(" 工号= "+empid_top+" 姓名= "+empname+" 性别= "+empsex+" 部门编号= "+sectionid+"");
		
		session.setAttribute("pname", pname);
		//System.out.println("empid:"+session.getAttribute("empid"));
		//session.setAttribute("empid23", "6666666666");
		session.setAttribute("psex", psex);
		session.setAttribute("page", page);
		session.setAttribute("pmoney", pmoney);
		//session.setAttribute("btn", btn);
		
//连接位置
		 String UTF_8text1 = "guahao";
			    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/administrator/patient/patient.jsp?a=1");	
	}

}

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
 * Servlet implementation class selectmz
 */
@WebServlet("/selectmz.do")
public class selectmz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectmz() {
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
		
		String mzname = request.getParameter("mzname");
		String mzwz = request.getParameter("mzwz");
		String mzzr = request.getParameter("mzzr");
		
		//String btn = request.getParameter("btn");
		//System.out.println(" ����= "+empid_top+" ����= "+empname+" �Ա�= "+empsex+" ���ű��= "+sectionid+"");
		
		session.setAttribute("mzname", mzname);
		//System.out.println("empid:"+session.getAttribute("empid"));
		//session.setAttribute("empid23", "6666666666");
		session.setAttribute("mzwz", mzwz);
		session.setAttribute("mzzr", mzzr);
		//session.setAttribute("btn", btn);
		
//����λ��
		 String UTF_8text1 = "guahao";
			    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/administrator/menzhen/menzhen.jsp?b=1");	
	}

}

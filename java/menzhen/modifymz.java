package menzhen;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class modifymz
 */
@WebServlet("/modifymz.do")
public class modifymz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifymz() {
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
		request.setCharacterEncoding("UTF-8");
		String driveName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		try {
			String ksid = request.getParameter("ksid");
			String org_mzid = request.getParameter("org_mzid");
			String mzid = request.getParameter("mzid");
			String mznam = request.getParameter("mznam");
			String mzjs = request.getParameter("mzjs");
			String wz = request.getParameter("wz");
			String mzdh = request.getParameter("mzdh");
			String zr = request.getParameter("zr");
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			//delete from teacher where teacher.教师编号 = CONVERT(nvarchar,313368)
			String sql ="update 科室门诊表 set 科室编号 ='" + ksid + "',门诊编号='" + mzid + "',门诊名称='" 
			+ mznam +"',门诊介绍='" + mzjs + "',位置='" + wz + "',电话='" + mzdh + "',主任='" + zr + "' where 门诊编号=CONVERT(nvarchar,'" + org_mzid +"')";
			Boolean flag = statement.execute(sql);

			
			String UTF_8text1 = "guahao";
			
			response.setContentType("text/html;charset=UTF-8");
			//response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script language='javascript'>" +"alert('cheng gong!');"
			+ "window.location.href='http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp';</script>')");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

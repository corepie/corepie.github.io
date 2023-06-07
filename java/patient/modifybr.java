package patient;

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
 * Servlet implementation class modifybr
 */
@WebServlet("/modifybr.do")
public class modifybr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifybr() {
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
			String pid1 = request.getParameter("pid1");
			String org_pid1 = request.getParameter("org_pid1");
			String pname= request.getParameter("pname");
			String psex = request.getParameter("psex");
			String page1 = request.getParameter("page1");
			String ye = request.getParameter("ye");
			String phone = request.getParameter("phone");
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			//delete from teacher where teacher.教师编号 = CONVERT(nvarchar,313368)
			String sql ="update 用户表2 set 身份证号 ='" + pid1 + "',用户名='" + pname + "',性别='" 
			+ psex +"',年龄='" + page1 + "',账户余额='" + ye + "',联系方式='" + phone + "' where 身份证号=CONVERT(nvarchar,'" + org_pid1 +"')";
			Boolean flag = statement.execute(sql);

			
			String UTF_8text1 = "guahao";
			
			response.setContentType("text/html;charset=UTF-8");
			//response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script language='javascript'>" +"alert('cheng gong!');"
			+ "window.location.href='http://localhost:8080/guahao/administrator/patient/patient.jsp';</script>')");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

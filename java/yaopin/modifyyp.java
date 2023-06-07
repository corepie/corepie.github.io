package yaopin;


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
@WebServlet("/modifyyp.do")
public class modifyyp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyyp() {
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
			String tid = request.getParameter("tid");
			String org_tid = request.getParameter("org_tid");
			String tname= request.getParameter("tname");
			String gname = request.getParameter("gname");
			String number = request.getParameter("number");
			String money = request.getParameter("money");
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			//delete from teacher where teacher.教师编号 = CONVERT(nvarchar,313368)
			String sql ="update 药品表 set 药品号码 ='" + tid + "',产品名称='" + tname + "',公司名称='" 
			+ gname +"',数量='" + number + "',价钱='" + money + "' where 药品号码=CONVERT(nvarchar,'" + org_tid +"')";
			Boolean flag = statement.execute(sql);

			
			String UTF_8text1 = "guahao";
			
			response.setContentType("text/html;charset=UTF-8");
			//response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script language='javascript'>" +"alert('cheng gong!');"
			+ "window.location.href='http://localhost:8080/guahao/administrator/yaopin/yaopin.jsp';</script>')");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}


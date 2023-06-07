package yisheng;

import java.io.IOException;
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
 * Servlet implementation class delmenz
 */
@WebServlet("/delyisheng.do")
public class delyisheng extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delyisheng() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");//设置参数
		String driveName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";// 导入驱动相对路径
		try {
			//获取前端参数
			//String haoma = request.getParameter("haoma");
			String mzId = request.getParameter("yid");		
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			
			String sql ="delete from 医生表 where 工号 = CONVERT(nvarchar,'" + mzId +"');";
			Boolean flag = statement.execute(sql);
			String UTF_8text1 = "guahao";
			response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/administrator/yisheng/yisheng.jsp");
			
			
			
			
		    
		    /*request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=utf-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('Successfully! Deleted');"
			+ "window.location.href='http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp';</script>')");*/
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	   }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

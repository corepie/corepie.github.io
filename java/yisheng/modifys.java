package yisheng;

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
@WebServlet("/modifys.do")
public class modifys extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifys() {
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
			String yid = request.getParameter("yid");
			String org_yid = request.getParameter("org_yid");
			String yname= request.getParameter("yname");
			String ysex = request.getParameter("ysex");
			String yrank = request.getParameter("yrank");
			String ymoney = request.getParameter("ymoney");
			String ydept = request.getParameter("ydept");
			String ynumber = request.getParameter("ynumber");
			String bm = request.getParameter("bm");
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			//delete from teacher where teacher.教师编号 = CONVERT(nvarchar,313368)
			String sql ="update 医生表 set 工号 ='" + yid + "',姓名='" + yname + "',性别='" 
			+ ysex +"',职称='" + yrank + "',出诊费用='" + ymoney + "',所属科室='" + ydept + "',余号='" + ynumber + "',部门分类='" + bm + "' where 工号=CONVERT(nvarchar,'" + org_yid +"')";
			Boolean flag = statement.execute(sql);

			
			String UTF_8text1 = "guahao";
			
			response.setContentType("text/html;charset=UTF-8");
			//response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script language='javascript'>" +"alert('cheng gong!');"
			+ "window.location.href='http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp';</script>')");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

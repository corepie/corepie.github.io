package yaopin;

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
 * Servlet implementation class addyaopin
 */
@WebServlet("/addyaopin.do")
public class addyaopin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addyaopin() {
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
			String tname = request.getParameter("tname");
			String gname = request.getParameter("gname");
			String number = request.getParameter("number");
			String money= request.getParameter("money");
		
			if(tid.equals("")) {
				
			}else {
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			String sql ="insert into 药品表(药品号码,产品名称,公司名称,数量,价钱) values ('" + tid + "',"+ "'" + tname + "','" + gname + "','" + number + "','" + money + "')";
			Boolean flag = statement.execute(sql);
//			执行完成之后返回的网页地址（servlet或jsp网页）
			//网址内中文乱码解决:服务器默认接受方式字符编码与UTF-8编码格式互相转换
		    String UTF_8text1 = "guahao";
		    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/administrator/yaopin/yaopin.jsp");
		  }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
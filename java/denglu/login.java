package denglu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//设置响应的内容，否则会出现乱码
		response.setContentType("text/html;charset=utf-8");
		
		
		//接收前端页面传递的参数
		String 账号1 = request.getParameter("username1");
		String 密码1 = request.getParameter("password1");
		
		//Boolean一个success为false
		Boolean success = false;
		
		//读取数据库用户密码表
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		  String dbURL="jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
		  String userName="sa";
		  String userPwd="202005317";
		 try{
		    Class.forName(driverName);
		    System.out.println("加载驱动成功！");   
		}catch(Exception e){
		    e.printStackTrace();
		    System.out.println("加载驱动失败！");
		}
		try{
		    Connection dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
		        System.out.println("连接数据库成功！");
		        Statement statement = dbConn.createStatement();
		        String sql = "select * from 用户表2";
		        
		        ResultSet rs = statement.executeQuery(sql);
		        //展开结果集
		        while (rs.next()) {
		        	String 用户名 = rs.getString(1);
		        	String 密码 = rs.getString(2);
		        	String 身份证号 = rs.getString(7);
		        	if(账号1.equals(用户名) && 密码1.equals(密码)) {
		        		success = true;
		        		request.getSession().setAttribute("id", 身份证号);
		        		request.getSession().setAttribute("userid", 用户名);
		        	}
		            };
		            rs.close();
		            statement.close();
		            dbConn.close();
		}catch(Exception e){
		    e.printStackTrace();
		    System.out.print("SQL Server连接失败！");
	}
		
		if (success == true) {
			//如果账号密码正确，success值为true,进行网页跳转
			//response.sendRedirect("http://localhost:8080/guahao/homepage/menu.jsp");
			response.setContentType("text/html; charset=UTF-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('登录成功');"
			+ "window.location.href='http://localhost:8080/guahao/homepage/tixing.jsp';</script>')");
			
			/*response.getWriter().write("<script>alert(\"登录成功\");</script>");
			//设置3秒钟跳转
			response.setHeader("refresh", "3;url=http://localhost:8080/guahao/homepage/menu.jsp");*/
			
		}else {
			//如果账号密码错误了
			//response.sendRedirect("http://localhost:8080/guahao/login/login.jsp");
			//request.getSession().setAttribute("login", "no");
			response.setContentType("text/html; charset=UTF-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('登录失败，请重新输入');"
			+ "window.location.href='http://localhost:8080/guahao/login/login.jsp';</script>')");
		}
		//打印前端参数
		System.out.println("用户输入的用户名:"+账号1);
		System.out.println("用户输入的密码:"+密码1);
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package denglu;

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
 * Servlet implementation class register
 */
@WebServlet("/register.do")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
			
			String id = request.getParameter("id2");
			String usrn = request.getParameter("username2");
			String pwd = request.getParameter("password2");
			
			System.out.println(usrn+"||||||"+pwd);
			if(usrn.equals("") || pwd.equals("") || id.equals("")) {  //����˺Ż���������֤��Ϊ��
				response.setContentType("text/html; charset=UTF-8");
				 response.getWriter().print("<script language='javascript'>" +"alert('Account or password cannot be empty');"
				+ "window.location.href='http://localhost:8080/guahao/login/login.jsp';</script>')");
			}
			else{                                  //����˺ź��������Ϊ��
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			Statement statement2 = con.createStatement();
			
			String sql ="insert into �û���2(���֤��,�û���,����) values ('" + id + "','" + usrn + "','" + pwd + "')";
			String sql2 ="update �û���2 set �˻���� = 0 where ���֤�� = '"+id+"'";
			
			
			Boolean flag = statement.execute(sql);
			Boolean flag2 = statement2.execute(sql2);
		   
		    response.setContentType("text/html; charset=UTF-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('login was successful');"
			+ "window.location.href='http://localhost:8080/guahao/login/login.jsp';</script>')");
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
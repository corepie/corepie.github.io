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
		//������Ӧ�����ݣ�������������
		response.setContentType("text/html;charset=utf-8");
		
		
		//����ǰ��ҳ�洫�ݵĲ���
		String �˺�1 = request.getParameter("username1");
		String ����1 = request.getParameter("password1");
		
		//Booleanһ��successΪfalse
		Boolean success = false;
		
		//��ȡ���ݿ��û������
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		  String dbURL="jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
		  String userName="sa";
		  String userPwd="202005317";
		 try{
		    Class.forName(driverName);
		    System.out.println("���������ɹ���");   
		}catch(Exception e){
		    e.printStackTrace();
		    System.out.println("��������ʧ�ܣ�");
		}
		try{
		    Connection dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
		        System.out.println("�������ݿ�ɹ���");
		        Statement statement = dbConn.createStatement();
		        String sql = "select * from �û���2";
		        
		        ResultSet rs = statement.executeQuery(sql);
		        //չ�������
		        while (rs.next()) {
		        	String �û��� = rs.getString(1);
		        	String ���� = rs.getString(2);
		        	String ���֤�� = rs.getString(7);
		        	if(�˺�1.equals(�û���) && ����1.equals(����)) {
		        		success = true;
		        		request.getSession().setAttribute("id", ���֤��);
		        		request.getSession().setAttribute("userid", �û���);
		        	}
		            };
		            rs.close();
		            statement.close();
		            dbConn.close();
		}catch(Exception e){
		    e.printStackTrace();
		    System.out.print("SQL Server����ʧ�ܣ�");
	}
		
		if (success == true) {
			//����˺�������ȷ��successֵΪtrue,������ҳ��ת
			//response.sendRedirect("http://localhost:8080/guahao/homepage/menu.jsp");
			response.setContentType("text/html; charset=UTF-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('��¼�ɹ�');"
			+ "window.location.href='http://localhost:8080/guahao/homepage/tixing.jsp';</script>')");
			
			/*response.getWriter().write("<script>alert(\"��¼�ɹ�\");</script>");
			//����3������ת
			response.setHeader("refresh", "3;url=http://localhost:8080/guahao/homepage/menu.jsp");*/
			
		}else {
			//����˺����������
			//response.sendRedirect("http://localhost:8080/guahao/login/login.jsp");
			//request.getSession().setAttribute("login", "no");
			response.setContentType("text/html; charset=UTF-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('��¼ʧ�ܣ�����������');"
			+ "window.location.href='http://localhost:8080/guahao/login/login.jsp';</script>')");
		}
		//��ӡǰ�˲���
		System.out.println("�û�������û���:"+�˺�1);
		System.out.println("�û����������:"+����1);
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

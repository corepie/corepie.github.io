package charu;

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
 * Servlet implementation class modify
 */
@WebServlet("/modify.do")
public class modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modify() {
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
			String org_usrn = request.getParameter("org_usrn");
			String usrn = request.getParameter("usrn");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String phone = request.getParameter("phone");
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			//delete from teacher where teacher.��ʦ��� = CONVERT(nvarchar,313368)
			String sql ="update �û���2 set �û���='" + usrn + "',�Ա�='" + sex + "',����='" 
			+ age +"',��ϵ��ʽ='" + phone + "' where �û���=CONVERT(nvarchar,'" + org_usrn +"')";
			Boolean flag = statement.execute(sql);
//			ִ�����֮�󷵻ص���ҳ��ַ��servlet��jsp��ҳ��
			//��ַ������������:������Ĭ�Ͻ��ܷ�ʽ�ַ�������UTF-8�����ʽ����ת��
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "����·��2";
	   //   String UTF_8text3 = "����·��3";
		    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/wode/w1.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

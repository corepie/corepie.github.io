package menzhen;

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
 * Servlet implementation class addmenzhen
 */
@WebServlet("/addmenzhen.do")
public class addmenzhen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addmenzhen() {
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
			
			String keid = request.getParameter("keid");
			String mzid = request.getParameter("mzid");
			String mzname = request.getParameter("mzname");
			String mzjs = request.getParameter("mzjs");
			String mzwz = request.getParameter("mzwz");
			String mzdh = request.getParameter("mzdh");
			String mzzr = request.getParameter("mzzr");
			if(mzid.equals("")) {
				
			}else {
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			String sql ="insert into ���������(���ұ��,������,��������,�������,λ��,�绰,����) values ('" + keid + "',"
					+ "'" + mzid + "','" + mzname + "','" + mzjs + "','" + mzwz + "','" + mzdh + "','" + mzzr + "')";
			Boolean flag = statement.execute(sql);
//			ִ�����֮�󷵻ص���ҳ��ַ��servlet��jsp��ҳ��
			//��ַ������������:������Ĭ�Ͻ��ܷ�ʽ�ַ�������UTF-8�����ʽ����ת��
		    String UTF_8text1 = "guahao";
		    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/administrator/menzhen/menzhen.jsp");
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

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
 * Servlet implementation class shanchu
 */
@WebServlet("/shanchu")
public class shanchu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shanchu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//ɾ������
		request.setCharacterEncoding("UTF-8");
		String driveName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		try {
			//��ȡǰ�˲���
			String haoma = request.getParameter("haoma");
			int shuzi = Integer.parseInt(request.getParameter("haoma"));
			String idd = request.getParameter("zilei");
			//char ss[] = idd.toCharArray();
			String[] array;
			String W="";//��ˮ��=W
			array = idd.split(",");
			for(int i=0; i<=array.length-1;i++) {
				System.out.println("array["+i+"]: "+array[i]);
				if(W == "") {
					W+=array[i];
				}else {
					W+=" or ��ˮ��="+array[i];
				}
				
			}
			System.out.println("W:"+W);
			//System.out.println("ss[1]�ǣ�"+idd.split(",")[0]);
			//System.out.println("ss[2]�ǣ�"+idd.split(",")[1]);
			System.out.println("idd��"+idd);
			String id = (String)request.getSession().getAttribute("id");
			
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			Statement statement2 = con.createStatement();
			
			if(shuzi == 1) {
				String sql ="delete from ��ϸ�� where ���֤�� = '"+id+"'";
				Boolean flag = statement.execute(sql);
			}else{
				
			    //String sql2 ="delete from ��ϸ�� where ��ˮ�� = CONVERT(nvarchar,'" + idd +"');";
				String sql2 ="delete from ��ϸ�� where ��ˮ�� ="+W;
			    Boolean flag2 = statement2.execute(sql2);
			}
			
		    String UTF_8text1 = "guahao";
		    request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=utf-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('Successfully! Deleted');"
			+ "window.location.href='http://localhost:8080/guahao/wode/w4.jsp';</script>')");
		    
		    //response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/custdemand.jsp");
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

package charu;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class chongzhi
 */
@WebServlet("/chongzhi")
public class chongzhi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chongzhi() {
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
			
			//�������ڸ�ʽ       
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHH"); 
			// new Date()Ϊ��ȡ��ǰϵͳʱ�䣬Ҳ��ʹ�õ�ǰʱ���
			String newNum = sdf.format(new Date(0));
			 
			//�������ڸ�ʽ
			DateTimeFormatter dtf3 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
			DateTimeFormatter dtf4 = DateTimeFormatter.ofPattern("yyyyMMddHH");
			//���ݹ涨�����ڸ�ʽ������name
			String newName1 = LocalDateTime.now().format(dtf3);
			
			
			String liushuiid = null;  //��ԤԼ���Ϊ��
			String time1 = request.getParameter("time11");
			System.out.println("������:"+time1);
			String aaa = request.getParameter("a");
			int chongzhije = Integer.parseInt(request.getParameter("a"));
			System.out.println("chongzhije:"+aaa);
//			String chongzhije = request.getParameter("a");
			String sfid = request.getParameter("sfid");
			String name = request.getParameter("name");
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			Statement statement2 = con.createStatement();
			Statement statement3 = con.createStatement();
			
			
			String sql1 = "select * from �û���2 where ���֤�� = '"+ sfid +"'";
			ResultSet rs1 = statement.executeQuery(sql1);//���
			while (rs1.next()) {
				
				System.out.println("���:"+rs1.getString(3)); 
				System.out.println("��ֵ��"+chongzhije);
				
				if (rs1.getString(3) == null) {
					String sql ="update  �û���2 set �˻���� =  '" + chongzhije + "'where ���֤�� = '"+sfid+"'";
					Boolean flag = statement2.execute(sql);   //������е��˻����Ϊnull,��ֱ�Ӳ���ǰ�������ֵ
				} else {
					int cz = Integer.parseInt(rs1.getString(3)); //���в������ʾ������
					//System.out.println("������ͣ�"+cz.getClass().getName());
					String sq2 ="update  �û���2 set �˻���� =  " + cz  +"+"+ chongzhije+ " where ���֤�� = '"+sfid+"'";
					//������������ݣ���ԭ���������
					Boolean flag3 = statement2.execute(sq2);
					
					
					ResultSet rs2=statement2.executeQuery("SELECT count(*) FROM ��ϸ�� where ���֤�� = '"+ sfid +"'");
					while (rs2.next()){
						liushuiid=LocalDateTime.now().format(dtf4)+rs2.getString(1);
					}
					System.out.println("liushuiid��" + LocalDateTime.now().format(dtf4));
				
				//����ԤԼ��Ϣ��
				String sql ="insert into ��ϸ��(��ˮ��,ʱ��,���,��Դ,���֤��,����) values ('" + liushuiid + "',"
						+ "'" + time1 + "','" + aaa + "','��ֵ','" + sfid + "','" + name + "')";

				Boolean flag1 = statement3.execute(sql);
				}
	            };
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "����·��2";
	   //   String UTF_8text3 = "����·��3";
		    request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=utf-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('Recharged Successfully!');"
			+ "window.location.href='http://localhost:8080/guahao/wode/w1.jsp';</script>')");
		    //response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/wode/w1.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

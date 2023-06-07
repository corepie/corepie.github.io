package charu;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class outcall
 */
@WebServlet("/outcall3.do")
public class outcall3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public outcall3() {
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
			System.out.println("newNum : " + newNum );
			System.out.println("sdf2: " + sdf2.format(new Date(0, 0, 0)));
			 
			//�������ڸ�ʽ
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
			DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("yyyyMMddHH");
			//���ݹ涨�����ڸ�ʽ������name
			String newName = LocalDateTime.now().format(dtf);
			System.out.println("newName: " + newName);
			System.out.println("dtf2: " + LocalDateTime.now().format(dtf2));
			
			//��ȡǰ�˲���
			String sfid = request.getParameter("sfid");
			System.out.println(sfid);
			String ys = request.getParameter("ys");
			String ks = request.getParameter("ks");
			String fy2 = request.getParameter("huafei");
			int fy = Integer.parseInt(request.getParameter("huafei"));
			System.out.println("fy:"+fy2.getClass().getName());//�����˻�������������
			String qzr = request.getParameter("username2");
			String date = request.getParameter("EntryDate");
			String time = request.getParameter("EntryTime");
			String yuyueid = null;  //��ԤԼ���Ϊ��
			
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			Statement statement2 = con.createStatement();
			Statement statement3 = con.createStatement();
			Statement statement4 = con.createStatement();
			Statement statement5 = con.createStatement();
			Statement statement6 = con.createStatement();
			
			//
			
			String sql1 = "select * from �û���2 where ���֤�� = '"+ sfid +"'";
			ResultSet rs1 = statement.executeQuery(sql1);
			while (rs1.next()) {
				
				System.out.println("rs1:"+rs1.getString(3));//�������
				int yue = Integer.parseInt(rs1.getString(3));  //�ı�Ϊint��
				//System.out.println("yuetype:"+rs1.getString(3).getClass().getName());
				 
				if(yue < fy) {  //����˻�����֧������
				String UTF_8text1 = "guahao";
				
				response.setContentType("text/html;charset=UTF-8");
				//response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script language='javascript'>" +"alert('Insufficient account balance,please reselect!');"
				+ "window.location.href='http://localhost:8080/guahao/fuchanke/fuchanke.jsp';</script>')");
				//request.getSession().setMaxInactiveInterval(2);//��session��ʾ�����ʧЧ
			} else {   //�˻�������֧������

				ResultSet rs2=statement2.executeQuery("SELECT count(*) FROM ԤԼ��");
				while (rs2.next()){
					yuyueid=LocalDateTime.now().format(dtf2)+rs2.getString(1);
				}
				System.out.println("yuyueid��" + LocalDateTime.now().format(dtf2));
			
			//����ԤԼ��Ϣ��
			String sql ="insert into ԤԼ��(ȷ����,ҽ������,ҽ������,����,��������,����ʱ��,ԤԼ���,״̬,����) values ('" + qzr + "',"
					+ "'" + ys + "','" + ks + "','" + fy + "','" + date + "','" + time + "','"+ yuyueid +"','ԤԼ�ɹ�','1')";
			System.out.println("sql:"+sql);

			Boolean flag = statement3.execute(sql);
			
			//ʵʱ�����û����е�������
			String sq2 ="update  �û���2 set �˻���� =  " + yue  +"-"+ fy+ " where ���֤�� = '"+sfid+"'";
			
			Boolean flag2 = statement4.execute(sq2);
			
			//���������ҽ����������-1
			String sql33 = "select * from ҽ���� where ���� = '"+ ys +"'";
			ResultSet rs33 = statement5.executeQuery(sql33);
			while (rs33.next()){
				System.out.println("rs33:"+rs33.getString(7));//�����ŵ�����
				int yuhao = Integer.parseInt(rs33.getString(7));  //�ı�Ϊint��
			
            String sql2 ="update ҽ���� set ��� =  " + yuhao +"-1 where ���� = '"+ys+"'";
			
			Boolean flag3 = statement6.execute(sql2);
			}
//			ִ�����֮�󷵻ص���ҳ��ַ��servlet��jsp��ҳ��
			//��ַ������������:������Ĭ�Ͻ��ܷ�ʽ�ַ�������UTF-8�����ʽ����ת��
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "����·��2";
	   //   String UTF_8text3 = "����·��3";
		    //response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/homepage/menu.jsp");
		    response.setContentType("text/html; charset=UTF-8");
			 response.getWriter().print("<script language='javascript'>" +"alert('Congratulations,the appointment was successful!');"
			+ "window.location.href='http://localhost:8080/guahao/homepage/menu.jsp';</script>')");
		    };
		    //Congratulations,the appointment was successful!
		    
		    
		    
		    
		    
		    
		    
		    
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

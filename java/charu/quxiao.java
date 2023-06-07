package charu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class quxiao
 */
@WebServlet("/quxiao.do")
public class quxiao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quxiao() {
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
			
			
			//���ǰ�˵Ĳ���
			String liushuiid = null;  //����ˮ��Ϊ��
			String time11 = request.getParameter("time1");
			System.out.println("time11�ǣ�"+time11);
			String yuyueid = request.getParameter("yuyueid");
			String feiyong = request.getParameter("zcf");
			System.out.println("���ѵ������ǣ�"+feiyong);
			//String zcf = request.getParameter("zcf");
			int feiyong2 = Integer.parseInt(request.getParameter("zcf"));  //ת��Ϊint��
			//System.out.println("zcf2�����������ǣ�"+zcf.getClass().getName());
			String id = (String)request.getSession().getAttribute("id");
			String name = (String)request.getSession().getAttribute("userid");
			System.out.println("���֤���ǣ�"+id);
			
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			Statement statement2 = con.createStatement();
			Statement statement3 = con.createStatement();
			Statement statement4 = con.createStatement();
			Statement statement5 = con.createStatement();
			Statement statement6 = con.createStatement();

			//��ԤԼ���״̬����Ϣ��Ϊ"��ȡ��"
			System.out.println("ԤԼ���:"+yuyueid);
            String sql2 ="update ԤԼ�� set ״̬ =  '��ȡ��' where ԤԼ��� = '"+ yuyueid +"'";
			Boolean flag3 = statement.execute(sql2);
			
			//ȡ��ԤԼ�󽫻᷵��������
			String sql1 = "select * from �û���2 where ���֤�� = '"+ id +"'";
			ResultSet rs = statement2.executeQuery(sql1);//���
			while (rs.next()) {
				System.out.println("�����:"+rs.getString(3));//�������
				int yue = Integer.parseInt(rs.getString(3));  //�ı�Ϊint��
				String sql4 ="update  �û���2 set �˻���� =  " + yue  +"+"+ feiyong2+ " where ���֤�� = '"+id+"'";
				//������������ݣ���ԭ���������
				Boolean flag = statement3.execute(sql4);
			}
			
			ResultSet rs2=statement5.executeQuery("SELECT count(*) FROM ��ϸ�� where ���֤�� = '"+ id +"'");
			while (rs2.next()){
				liushuiid=LocalDateTime.now().format(dtf4)+rs2.getString(1);
			}
			System.out.println("liushuiid��" + LocalDateTime.now().format(dtf4));
		
		//����ԤԼ��Ϣ��
		String sql8 ="insert into ��ϸ��(��ˮ��,ʱ��,���,��Դ,���֤��,����) values ('" + liushuiid + "',"
				+ "'" + time11 + "','" + feiyong + "','ȡ��ԤԼ','" + id + "','" + name + "')";

		Boolean flag1 = statement6.execute(sql8);
			
			
//			ִ�����֮�󷵻ص���ҳ��ַ��servlet��jsp��ҳ��
			//��ַ������������:������Ĭ�Ͻ��ܷ�ʽ�ַ�������UTF-8�����ʽ����ת��
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "����·��2";
	   //   String UTF_8text3 = "����·��3";
		    response.sendRedirect("/"+new String(UTF_8text1.getBytes("utf-8"),"iso-8859-1")+"/wode/w3.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

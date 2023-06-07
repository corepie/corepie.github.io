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
			
			//设置日期格式       
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHH"); 
			// new Date()为获取当前系统时间，也可使用当前时间戳
			String newNum = sdf.format(new Date(0));
			 
			//设置日期格式
			DateTimeFormatter dtf3 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
			DateTimeFormatter dtf4 = DateTimeFormatter.ofPattern("yyyyMMddHH");
			//根据规定的日期格式，生成name
			String newName1 = LocalDateTime.now().format(dtf3);
			
			
			String liushuiid = null;  //令预约编号为空
			String time1 = request.getParameter("time11");
			System.out.println("数据是:"+time1);
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
			
			
			String sql1 = "select * from 用户表2 where 身份证号 = '"+ sfid +"'";
			ResultSet rs1 = statement.executeQuery(sql1);//余额
			while (rs1.next()) {
				
				System.out.println("余额:"+rs1.getString(3)); 
				System.out.println("充值金额："+chongzhije);
				
				if (rs1.getString(3) == null) {
					String sql ="update  用户表2 set 账户余额 =  '" + chongzhije + "'where 身份证号 = '"+sfid+"'";
					Boolean flag = statement2.execute(sql);   //如果表中的账户余额为null,则直接插入前端输出的值
				} else {
					int cz = Integer.parseInt(rs1.getString(3)); //表中插入后显示的数据
					//System.out.println("余额类型："+cz.getClass().getName());
					String sq2 ="update  用户表2 set 账户余额 =  " + cz  +"+"+ chongzhije+ " where 身份证号 = '"+sfid+"'";
					//表中余额有数据，在原基础上相加
					Boolean flag3 = statement2.execute(sq2);
					
					
					ResultSet rs2=statement2.executeQuery("SELECT count(*) FROM 明细表 where 身份证号 = '"+ sfid +"'");
					while (rs2.next()){
						liushuiid=LocalDateTime.now().format(dtf4)+rs2.getString(1);
					}
					System.out.println("liushuiid：" + LocalDateTime.now().format(dtf4));
				
				//插入预约信息表
				String sql ="insert into 明细表(流水号,时间,金额,来源,身份证号,姓名) values ('" + liushuiid + "',"
						+ "'" + time1 + "','" + aaa + "','充值','" + sfid + "','" + name + "')";

				Boolean flag1 = statement3.execute(sql);
				}
	            };
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "中文路径2";
	   //   String UTF_8text3 = "中文路径3";
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

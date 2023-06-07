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
			//设置日期格式       
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHH"); 
			// new Date()为获取当前系统时间，也可使用当前时间戳
			String newNum = sdf.format(new Date(0));
			System.out.println("newNum : " + newNum );
			System.out.println("sdf2: " + sdf2.format(new Date(0, 0, 0)));
			 
			//设置日期格式
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
			DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("yyyyMMddHH");
			//根据规定的日期格式，生成name
			String newName = LocalDateTime.now().format(dtf);
			System.out.println("newName: " + newName);
			System.out.println("dtf2: " + LocalDateTime.now().format(dtf2));
			
			//获取前端参数
			String sfid = request.getParameter("sfid");
			System.out.println(sfid);
			String ys = request.getParameter("ys");
			String ks = request.getParameter("ks");
			String fy2 = request.getParameter("huafei");
			int fy = Integer.parseInt(request.getParameter("huafei"));
			System.out.println("fy:"+fy2.getClass().getName());//检索账户余额的数据类型
			String qzr = request.getParameter("username2");
			String date = request.getParameter("EntryDate");
			String time = request.getParameter("EntryTime");
			String yuyueid = null;  //令预约编号为空
			
			
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
			
			String sql1 = "select * from 用户表2 where 身份证号 = '"+ sfid +"'";
			ResultSet rs1 = statement.executeQuery(sql1);
			while (rs1.next()) {
				
				System.out.println("rs1:"+rs1.getString(3));//余额数量
				int yue = Integer.parseInt(rs1.getString(3));  //改变为int型
				//System.out.println("yuetype:"+rs1.getString(3).getClass().getName());
				 
				if(yue < fy) {  //如果账户余额不够支付诊查费
				String UTF_8text1 = "guahao";
				
				response.setContentType("text/html;charset=UTF-8");
				//response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script language='javascript'>" +"alert('Insufficient account balance,please reselect!');"
				+ "window.location.href='http://localhost:8080/guahao/fuchanke/fuchanke.jsp';</script>')");
				//request.getSession().setMaxInactiveInterval(2);//让session提示两秒后失效
			} else {   //账户余额可以支付诊查费

				ResultSet rs2=statement2.executeQuery("SELECT count(*) FROM 预约表");
				while (rs2.next()){
					yuyueid=LocalDateTime.now().format(dtf2)+rs2.getString(1);
				}
				System.out.println("yuyueid：" + LocalDateTime.now().format(dtf2));
			
			//插入预约信息表
			String sql ="insert into 预约表(确诊人,医生姓名,医生科室,诊查费,就诊日期,就诊时间,预约编号,状态,区分) values ('" + qzr + "',"
					+ "'" + ys + "','" + ks + "','" + fy + "','" + date + "','" + time + "','"+ yuyueid +"','预约成功','1')";
			System.out.println("sql:"+sql);

			Boolean flag = statement3.execute(sql);
			
			//实时更新用户表中的余额情况
			String sq2 ="update  用户表2 set 账户余额 =  " + yue  +"-"+ fy+ " where 身份证号 = '"+sfid+"'";
			
			Boolean flag2 = statement4.execute(sq2);
			
			//语句三，将医生表里的余号-1
			String sql33 = "select * from 医生表 where 姓名 = '"+ ys +"'";
			ResultSet rs33 = statement5.executeQuery(sql33);
			while (rs33.next()){
				System.out.println("rs33:"+rs33.getString(7));//输出余号的数量
				int yuhao = Integer.parseInt(rs33.getString(7));  //改变为int型
			
            String sql2 ="update 医生表 set 余号 =  " + yuhao +"-1 where 姓名 = '"+ys+"'";
			
			Boolean flag3 = statement6.execute(sql2);
			}
//			执行完成之后返回的网页地址（servlet或jsp网页）
			//网址内中文乱码解决:服务器默认接受方式字符编码与UTF-8编码格式互相转换
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "中文路径2";
	   //   String UTF_8text3 = "中文路径3";
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

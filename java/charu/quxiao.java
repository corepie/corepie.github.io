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
			
			
			//获得前端的参数
			String liushuiid = null;  //令流水号为空
			String time11 = request.getParameter("time1");
			System.out.println("time11是："+time11);
			String yuyueid = request.getParameter("yuyueid");
			String feiyong = request.getParameter("zcf");
			System.out.println("诊查费的数量是："+feiyong);
			//String zcf = request.getParameter("zcf");
			int feiyong2 = Integer.parseInt(request.getParameter("zcf"));  //转换为int型
			//System.out.println("zcf2的数据类型是："+zcf.getClass().getName());
			String id = (String)request.getSession().getAttribute("id");
			String name = (String)request.getSession().getAttribute("userid");
			System.out.println("身份证号是："+id);
			
			
			Class.forName(driveName);
			String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";;
			Connection con = DriverManager.getConnection(url, "sa","202005317");
			Statement statement = con.createStatement();
			Statement statement2 = con.createStatement();
			Statement statement3 = con.createStatement();
			Statement statement4 = con.createStatement();
			Statement statement5 = con.createStatement();
			Statement statement6 = con.createStatement();

			//将预约表的状态栏信息改为"已取消"
			System.out.println("预约编号:"+yuyueid);
            String sql2 ="update 预约表 set 状态 =  '已取消' where 预约编号 = '"+ yuyueid +"'";
			Boolean flag3 = statement.execute(sql2);
			
			//取消预约后将会返回诊查费用
			String sql1 = "select * from 用户表2 where 身份证号 = '"+ id +"'";
			ResultSet rs = statement2.executeQuery(sql1);//余额
			while (rs.next()) {
				System.out.println("余额是:"+rs.getString(3));//余额数量
				int yue = Integer.parseInt(rs.getString(3));  //改变为int型
				String sql4 ="update  用户表2 set 账户余额 =  " + yue  +"+"+ feiyong2+ " where 身份证号 = '"+id+"'";
				//表中余额有数据，在原基础上相加
				Boolean flag = statement3.execute(sql4);
			}
			
			ResultSet rs2=statement5.executeQuery("SELECT count(*) FROM 明细表 where 身份证号 = '"+ id +"'");
			while (rs2.next()){
				liushuiid=LocalDateTime.now().format(dtf4)+rs2.getString(1);
			}
			System.out.println("liushuiid：" + LocalDateTime.now().format(dtf4));
		
		//插入预约信息表
		String sql8 ="insert into 明细表(流水号,时间,金额,来源,身份证号,姓名) values ('" + liushuiid + "',"
				+ "'" + time11 + "','" + feiyong + "','取消预约','" + id + "','" + name + "')";

		Boolean flag1 = statement6.execute(sql8);
			
			
//			执行完成之后返回的网页地址（servlet或jsp网页）
			//网址内中文乱码解决:服务器默认接受方式字符编码与UTF-8编码格式互相转换
		    String UTF_8text1 = "guahao";
	   //   String UTF_8text2 = "中文路径2";
	   //   String UTF_8text3 = "中文路径3";
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

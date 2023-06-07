<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/xiugai.css">

</head>
<body>
    <!-- 左边快捷导航模块 -->
   <div class="left">
        <h2>医院·后台管理系统</h2>
       <ul>
        <img src="">
        <li><a href="http://localhost:8080/guahao/administrator/index.jsp"  style="margin-right:105px;">控制台</a><span>&gt;</span></li>
        <img src="../../images/dingdan.png">
        <li><a href="http://localhost:8080/guahao/administrator/yuyue/yuyue.jsp">订单管理</a><span>&gt;</span></li>
        <img src="../../images/bumen.png">
        <li ><a href="http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp">门诊管理</a><span>&gt;</span></li>
        <img src="../../images/yisheng.png">
        <li><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
        <img src="../../images/yonghu11.png">
        <li class="active"><a href="http://localhost:8080/guahao/administrator/patient/patient.jsp">用户管理</a><span>&gt;</span></li>
        <img src="../../images/jinqian.png">
        <li><a href="http://localhost:8080/guahao/administrator/caiwu/caiwu.jsp">财务管理</a><span>&gt;</span></li>
        <img src="../../images/yaopin.png">
        <li><a href="http://localhost:8080/guahao/administrator/yaopin/yaopin.jsp">药房管理</a><span>&gt;</span></li>
        <img src="../../images/tongji.png">
        <li><a href="http://localhost:8080/guahao/administrator/tongji/tongji.jsp">数据统计</a><span>&gt;</span></li>
       </ul>
   </div>
   
   <!-- 右边快捷导航模块 -->
   <div class="right">
   <!-- 功能栏 -->
      <div class="w">
          <h3>控制台</h3>
          <div class="xinxi"> 
             <ul>
             <li><img src="../../images/notice.gif"></li>
             <li><h4 style="margin-right:30px;">消息</h4></li>
             <li><img src="../../images/xiachen.jpg" class="qq"></li>
             <li><h4>admin</h4></li>
             
             <li><a href="Administrator.jsp">[退出]</a></li>
             </ul>
          </div>
      </div>
        
        <!-- 主要功能 -->
        <div class="box">
<h1>修改信息</h1>
<br/>
	<!-- 显示上一页所选中的数据 -->
    <form action="http://localhost:8080/guahao/modifybr.do" method="post">
      
      身份证号：<input type="text" name="pid1" id="pid1">
      <!-- 门诊编号： -->
      <input type="hidden" name="org_pid1" id="org_pid1">
      <br>
      用&nbsp; 户&nbsp; 名：<input type="text" name="pname" id="pname">
      <br>
      性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
      <select name="psex" id="psex" >  <!-- style="width:200px;height:38px;font-size:24px;" -->
          <option value="男">男</option>
          <option value="女">女</option>
      </select>
      <br>
      年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<input type="text" name="page1" id="page1">
      <br>
      账户余额：<input type="text" name="ye" id="ye">
      <br>
      联系方式：<input type="text" name="phone" id="phone">
      <br>
            
      <input type="submit" value="提交" style="font-size:23px;width:150px;height:36px;position:absolute;top:79%;
	left:20%;border:1px solid #444;text-indent:0;cursor:pointer;">
    </form>    
    <a href="patient.jsp" class="fanhui">返回</a>
<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
String pid = request.getParameter("pid");
try{
	String query="SELECT * FROM 用户表2 where 身份证号 = '"+pid+"'";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs=stmt.executeQuery(query);
	while (rs.next()){
		String pid1 = rs.getString(7);
		String pname = rs.getString(1);
		String psex = rs.getString(4);
		String page1 = rs.getString(5);
		String ye = rs.getString(3);
		String phone = rs.getString(6);
		out.println("<script>");
		out.println("document.querySelector('#pid1').value='" + pid1 + "'");
		out.println("document.querySelector('#org_pid1').value='" + pid1 + "'");
		out.println("document.querySelector('#pname').value='" + pname + "'");
		out.println("document.querySelector('#psex').value='" + psex + "'");
		out.println("document.querySelector('#page1').value='" + page1 + "'");
		out.println("document.querySelector('#ye').value='" + ye + "'");
		out.println("document.querySelector('#phone').value='" + phone + "'");
		out.println("</script>");
	}
}catch (ClassNotFoundException e){
	out.print("类没有找到异常：");
	out.println(e.getMessage());
}catch (SQLException e){
	out.println("SQL异常："+e.getMessage());
}finally{
	if (stmt != null){
		try{
			stmt.close();
		}catch (SQLException e){
		}
		stmt=null;
	}
	if (con != null){
		try{
			con.close();//关闭连接
		}catch (SQLException e){
		}
		con = null;
	}
}
%>  
</div>
</div>

</body>
</html>
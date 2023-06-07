<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改药品信息</title>
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
        <li><a href="http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp">门诊管理</a><span>&gt;</span></li>
        <img src="../../images/yisheng.png">
        <li><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
        <img src="../../images/yonghu11.png">
        <li><a href="http://localhost:8080/guahao/administrator/patient/patient.jsp">用户管理</a><span>&gt;</span></li>
        <img src="../../images/jinqian.png">
        <li><a href="http://localhost:8080/guahao/administrator/caiwu/caiwu.jsp">财务管理</a><span>&gt;</span></li>
        <img src="../../images/yaopin.png">
        <li class="active"><a href="http://localhost:8080/guahao/administrator/yaopin/yaopin.jsp">药房管理</a><span>&gt;</span></li>
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
    <form action="http://localhost:8080/guahao/modifyyp.do" method="post">
      
      药品号码：<input type="text" name="tid" id="tid">
      <!-- 门诊编号： -->
      <input type="hidden" name="org_tid" id="org_tid">
      <br>
      产品名称：<input type="text" name="tname" id="tname">
      <br>
      公司名称：<input type="text" name="gname" id="gname">
      <br>
      数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：<input type="text" name="number" id="number">
      <br>
      价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;钱：<input type="text" name="money" id="money">
      
  
      
      <input type="submit" value="提交" style="font-size:23px;width:150px;height:36px;position:absolute;top:79%;
	left:20%;border:1px solid #444;text-indent:0;cursor:pointer;">
    </form>    
    <a href="yaopin.jsp" class="fanhui" >返回</a>
<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
try{
	String tid = request.getParameter("tid");
	String query="SELECT * FROM 药品表 where 药品号码 = CONVERT(nvarchar,'" + tid +"')";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs=stmt.executeQuery(query);
	while (rs.next()){
		String tid1 = rs.getString(1);
		String tname = rs.getString(2);
		String gname = rs.getString(3);
		String number = rs.getString(4);
		String money = rs.getString(5);
		out.println("<script>");
		out.println("document.querySelector('#tid').value='" + tid1 + "'");
		out.println("document.querySelector('#org_tid').value='" + tid1 + "'");
		out.println("document.querySelector('#tname').value='" + tname + "'");
		out.println("document.querySelector('#gname').value='" + gname + "'");
		out.println("document.querySelector('#number').value='" + number + "'");
		out.println("document.querySelector('#money').value='" + money + "'");
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

</body>
</html>
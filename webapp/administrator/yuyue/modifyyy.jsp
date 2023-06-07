<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改部门信息</title>
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
        <li class="active"><a href="http://localhost:8080/guahao/administrator/yuyue/yuyue.jsp">订单管理</a><span>&gt;</span></li>
        <img src="../../images/bumen.png">
        <li ><a href="http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp">门诊管理</a><span>&gt;</span></li>
        <img src="../../images/yisheng.png">
        <li><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
        <img src="../../images/yonghu11.png">
        <li><a href="http://localhost:8080/guahao/administrator/patient/patient.jsp">用户管理</a><span>&gt;</span></li>
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
   <div class="box" style="height:760px;">
<h1 style="height:63px;">修改信息</h1>
<br/>
	<!-- 显示上一页所选中的数据 -->
    <form action="http://localhost:8080/guahao/modifyyy.do" method="post">
      是否就诊：<select name="idiff" id="idiff" style="width:250px;height:36px;font-size:24px;margin-top:3px;">
           <option value=""></option>
		   <option value="1">1（否）</option>
		   <option value="0">0（是）</option>
      </select><br><br>
       预约编号： <span id="idi3" >id</span>
      <input type="hidden" name="org_iid" id="org_iid">
      <br><br>
      确&nbsp;诊&nbsp; 人：<span id="pname3" >pname</span>
      <!-- 医生姓名： -->
      <br><br>
      医生姓名：<span id="yname3" >yname</span>
      <br><br>
      医生科室：<span id="ydept3" >yname</span>
      <br><br>
      诊&nbsp;查&nbsp; 费：<span id="imoney3" >cost</span>元
      <br><br>
      就诊日期：<span id="idate3" >date</span>
      <br><br>
      就诊时间：<span id="itime3" >time</span>
      <br><br>
      状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：<span id="zt3" >zt</span>
      <br>

          
      <br>
      <input type="submit" value="提交" style="font-size:23px;width:150px;height:36px;position:absolute;top:90%;
	left:20%;border:1px solid #444;text-indent:0;cursor:pointer;">
	<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
String iid3 = request.getParameter("iid");
//System.out.println("用户输入的用户名:"+nkname);检测
String query2="SELECT * FROM 预约表 where 预约编号 = '"+iid3+"'";
try{
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs=stmt.executeQuery(query2);
	while (rs.next()){
		String pname1 = rs.getString(1);
		String yname1 = rs.getString(2);
		String ydept1 = rs.getString(3);
		String imoney1 = rs.getString(4);
		String idate1 = rs.getString(5);
		String itime1 = rs.getString(6);    //时间
		String iid22 = rs.getString(7);    //编号
		String zt1 = rs.getString(8);
		out.println("<script>document.getElementById('idi3').innerHTML='"+iid22+"';document.getElementById('pname3').innerHTML='"+pname1
				+"';document.getElementById('yname3').innerHTML='"+yname1+"';document.getElementById('ydept3').innerHTML='"+ydept1
				+"';document.getElementById('imoney3').innerHTML='"+imoney1+"';document.getElementById('idate3').innerHTML='"+idate1
				+"';document.getElementById('itime3').innerHTML='"+itime1+"';document.getElementById('zt3').innerHTML='"+zt1
				+"';document.getElementById('org_iid').value=document.getElementById('idi3').innerHTML;</script>");
	
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
    </form>    
    <a href="yuyue.jsp" class="fanhui" style="position:absolute;top:92.3%;left:59%;">返回</a>
<%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
try{
	String iid = request.getParameter("iid");
	String query="SELECT * FROM 预约表 where 预约编号 = CONVERT(nvarchar,'" + iid +"')";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con2=DriverManager.getConnection(url2,"sa","202005317");
	//创建Statement语句
	stmt2=con2.createStatement();
	//执行SQL语句
	ResultSet rs2=stmt2.executeQuery(query2);
	while (rs2.next()){
		String pname = rs2.getString(1);
		String yname = rs2.getString(2);
		String ydept = rs2.getString(3);
		String imoney = rs2.getString(4);
		String idate = rs2.getString(5);
		String itime = rs2.getString(6);    //时间
		String iid1 = rs2.getString(7);    //编号
		String zt = rs2.getString(8);
		String idiff = rs2.getString(9);
		out.println("<script>");
		out.println("document.querySelector('#pname').value='" + pname + "'");
		out.println("document.querySelector('#yname').value='" + yname + "'");
		out.println("document.querySelector('#ydept').value='" + ydept + "'");
		out.println("document.querySelector('#imoney').value='" + imoney + "'");
		out.println("document.querySelector('#idate').value='" + idate + "'");
		out.println("document.querySelector('#zt').value='" + zt + "'");
		out.println("document.querySelector('#iid').value='" + iid1 + "'");
		out.println("document.querySelector('#org_iid').value='" + iid1 + "'");
		out.println("document.querySelector('#itime').value='" + itime + "'");
		out.println("document.querySelector('#idiff').value='" + idiff + "'");
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
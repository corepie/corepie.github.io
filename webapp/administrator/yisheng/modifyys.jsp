<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改医生信息</title>
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
        <li class="active"><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
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
        <div class="box">
<h1>修改信息</h1>
<br/>
	<!-- 显示上一页所选中的数据 -->
    <form action="http://localhost:8080/guahao/modifys.do" method="post">
      
      工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" name="yid" id="yid">
      <!-- 门诊编号： -->
      <input type="hidden" name="org_yid" id="org_yid">
      <br>
      姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="yname" id="yname">
      <br>
      性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<select name="ysex" id="ysex">
        <option value="男">男</option>
       <option value="女">女</option>
      </select>
      <br>
      职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<select name="yrank" id="yrank">
        <option value="主任医师">主任医师</option>
       <option value="副主任医师">副主任医师</option>
       <option value="主治医师">主治药师</option>
       <option value="主治医师">主任药师</option>
       <option value="药师">药师</option>
       <option value="教授">教授</option>
      </select>
      <br>
      费&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用：<input type="text" name="ymoney" id="ymoney">
      <br>
      所属科室：<select name="ydept" id="ydept">
      <%
String url1 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con1 = null;
Statement stmt1=null;
String bm = request.getParameter("bm");
try{
	String query="SELECT * FROM 科室门诊表 where 科室编号 = '"+bm+"'";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con1=DriverManager.getConnection(url1,"sa","202005317");
	//创建Statement语句
	stmt1=con1.createStatement();
	//执行SQL语句
	ResultSet rs=stmt1.executeQuery(query);
	while (rs.next()){
		String ksId = rs.getString(1);
		String mzid = rs.getString(2);
		String mzname = rs.getString(3);
		//渲染所有单位信息至下列列表选项中
		out.println("<option value='" + mzname +"'>" + ksId + "&nbsp;&nbsp;&nbsp;&nbsp;"+ mzid + "&nbsp;&nbsp;&nbsp;&nbsp;"+ mzname + "</option>");
	}
}catch (ClassNotFoundException e){
	out.print("类没有找到异常：");
	out.println(e.getMessage());
}catch (SQLException e){
	out.println("SQL异常："+e.getMessage());
}finally{
	if (stmt1 != null){
		try{
			stmt1.close();
		}catch (SQLException e){
		}
		stmt1=null;
	}
	if (con1 != null){
		try{
			con1.close();//关闭连接
		}catch (SQLException e){
		}
		con1 = null;
	}
}
%>
</select>
      <br>
      余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" name="ynumber" id="ynumber">
      <br>部门分类：<select name="bm" id="bm">
      <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String bm2 = request.getParameter("bm");
try{
	String query="SELECT 部门分类 FROM 医生表 group by 部门分类";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con1=DriverManager.getConnection(url1,"sa","202005317");
	//创建Statement语句
	stmt1=con1.createStatement();
	//执行SQL语句
	ResultSet rs=stmt1.executeQuery(query);
	while (rs.next()){
		String ksId1 = rs.getString(1);
		//渲染所有单位信息至下列列表选项中
		out.println("<option value='" + ksId1 +"'>" + ksId1 + "</option>");
	}
}catch (ClassNotFoundException e){
	out.print("类没有找到异常：");
	out.println(e.getMessage());
}catch (SQLException e){
	out.println("SQL异常："+e.getMessage());
}finally{
	if (stmt1 != null){
		try{
			stmt1.close();
		}catch (SQLException e){
		}
		stmt1=null;
	}
	if (con1 != null){
		try{
			con1.close();//关闭连接
		}catch (SQLException e){
		}
		con1 = null;
	}
}
%>
      </select>
      
      
      <input type="submit" value="提交" style="font-size:23px;width:150px;height:36px;position:absolute;top:83%;
	left:20%;border:1px solid #444;text-indent:0; cursor:pointer;">
    </form>    
    <a href="yisheng.jsp" class="fanhui" style="position;top:85.6%;left:58%;">返回</a>
<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
try{
	String yid = request.getParameter("yid");
	String query="SELECT * FROM 医生表 where 工号 = CONVERT(nvarchar,'" + yid +"')";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs=stmt.executeQuery(query);
	while (rs.next()){
		String yid1 = rs.getString(1);
		String yname = rs.getString(2);
		String ysex = rs.getString(3);
		String yrank = rs.getString(4);
		String ydept = rs.getString(6);
		String ymoney = rs.getString(5);
		String ynumber = rs.getString(7);
		String bm1 = rs.getString(8);
		out.println("<script>");
		out.println("document.querySelector('#yid').value='" + yid1 + "'");
		out.println("document.querySelector('#org_yid').value='" + yid1 + "'");
		out.println("document.querySelector('#yname').value='" + yname + "'");
		out.println("document.querySelector('#ysex').value='" + ysex + "'");
		out.println("document.querySelector('#yrank').value='" + yrank + "'");
		out.println("document.querySelector('#ydept').value='" + ydept + "'");
		out.println("document.querySelector('#ymoney').value='" + ymoney + "'");
		out.println("document.querySelector('#ynumber').value='" + ynumber + "'");
		out.println("document.querySelector('#bm').value='" + bm1 + "'");
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
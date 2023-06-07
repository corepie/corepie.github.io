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
        <li><a href="http://localhost:8080/guahao/administrator/yuyue/yuyue.jsp">订单管理</a><span>&gt;</span></li>
        <img src="../../images/bumen.png">
        <li class="active"><a href="http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp">门诊管理</a><span>&gt;</span></li>
        <img src="../../images/yisheng.png">
        <li><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
        <img src="../../images/yonghu11.png">
        <li><a href="http://localhost:8080/guahao/administrator/patient/patient.jsp">用户管理</a><span>&gt;</span></li>
        <img src="../../images/jinqian.png">
        <li><a href="#">财务管理</a><span>&gt;</span></li>
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
    <form action="http://localhost:8080/guahao/modifymz.do" method="post">
      
      科室编号：<input type="text" name="ksid" id="ksid">
      <!-- 门诊编号： -->
      <input type="hidden" name="org_mzid" id="org_mzid">
      <br>
      门诊编号：<input type="text" name="mzid" id="mzid">
      <br>
      门诊名称：<input type="text" name="mznam" id="mznam">
      <br>
      门诊介绍：<input type="text" name="mzjs" id="mzjs">
      <br>
      位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置：<input type="text" name="wz" id="wz">
      <br>
      门诊电话：<input type="text" name="mzdh" id="mzdh">
      <br>
      门诊主任：<select name="zr" id="zr">
            <%
String url1 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con1 = null;
Statement stmt1=null;
String mzname = request.getParameter("mzname");
try{
	String query="SELECT * FROM 医生表 where 所属科室 = '"+mzname+"' and 职称 = '主任医师' ";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con1=DriverManager.getConnection(url1,"sa","202005317");
	//创建Statement语句
	stmt1=con1.createStatement();
	//执行SQL语句
	ResultSet rs=stmt1.executeQuery(query);
	while (rs.next()){
		String ysId = rs.getString(1);
		String ysName = rs.getString(2);
		String yscall = rs.getString(4);
		//渲染所有单位信息至下列列表选项中
		out.println("<option value='" + ysName +"'>" + ysId + "&nbsp;&nbsp;&nbsp;&nbsp;"+ ysName + "&nbsp;&nbsp;&nbsp;&nbsp;"+ yscall + "</option>");
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
      <input type="submit" value="提交" style="font-size:23px;width:150px;height:36px;position:absolute;top:79%;
	left:20%;border:1px solid #444;text-indent:0;cursor:pointer;">
    </form>    
    <a href="menzhen.jsp" class="fanhui">返回</a>
<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
try{
	String mzId = request.getParameter("mzId");
	String query="SELECT * FROM 科室门诊表 where 门诊编号 = CONVERT(nvarchar,'" + mzId +"')";
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs=stmt.executeQuery(query);
	while (rs.next()){
		String ksid = rs.getString(1);
		String mzid = rs.getString(2);
		String mznam = rs.getString(3);
		String mzjs = rs.getString(4);
		String wz = rs.getString(5);
		String mzdh = rs.getString(6);
		String zr = rs.getString(7);
		out.println("<script>");
		out.println("document.querySelector('#ksid').value='" + ksid + "'");
		out.println("document.querySelector('#org_mzid').value='" + mzid + "'");
		out.println("document.querySelector('#mzid').value='" + mzid + "'");
		out.println("document.querySelector('#mznam').value='" + mznam + "'");
		out.println("document.querySelector('#mzjs').value='" + mzjs + "'");
		out.println("document.querySelector('#wz').value='" + wz + "'");
		out.println("document.querySelector('#mzdh').value='" + mzdh + "'");
		out.println("document.querySelector('#zr').value='" + zr + "'");
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
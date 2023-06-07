<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>就诊单信息</title>
<!-- 引用jq文件 -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<style>
*{
	margin:  0;
	padding: 0;
}
html,body{
width: 100vw;

display: flex;////////////////////////////////
justify-content: center;
}
.container1{
}
.table1{
border: 1px solid green;
}
.table1 td{
	width: 105px;
	height: 40%;
	background: #fae9e9;
	text-align: center;
	
}
ul li{
  list-style-type:none;
}
</style>
</head>
<div class="container-fluid" style="height:70px;background-color:#1b6d85;">
<div class="row" >
  <h1>医院挂号预约系统</h1>
</div>

<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="../homepage/menu.jsp">系统首页</a></li>
  <li role="presentation"><a href="#">互联网医院</a></li>
  <li role="presentation"><a href="../wode/w1.jsp">我的</a></li>
</ul>
   <div class="col-md-3" >
   <h2>挂号</h2>
   <ul class="nav nav-pills nav-stacked">
 <li role="presentation class="active"><a href="../homepage/menu.jsp">主页</a></li>
  <li role="presentation"  class="active"><a href="../neike/neike.jsp">内科</a></li>
  <li role="presentation"><a href="../waike/waike.jsp">外科</a></li>
  <li role="presentation"><a href="../fuchanke/fuchanke.jsp">妇产、生殖科</a></li>
  <li role="presentation"><a href="../erneike/erneike.jsp">儿内科</a></li>
  <li role="presentation"><a href="../zhongyike/zhongyike.jsp">中医、康复科</a></li>
   </ul>
   </div>
  <div class="col-md-9" >
   <div class="container1">
  <table border = "1" class="table1">
       <!-- 创建幕布 -->
<div id="winmsg" style="
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background: rgba(0,0,0,0.3);
z-index: 99999;">
    <!-- 创建主窗口 -->
    <div style="position: fixed;
    top: 50%;
    left: 50%;
    width: 60%;
    max-width: 500px;
    background: #FFF;
    font-weight: bold;
    transform: translate(-50%,-50%);
    border-radius: 30px;
    padding: 50px 40px;
    ">
    

        <!-- 标题 -->
        <h4 style="font-weight: bold;text-align:center;font-size: 30px;">就诊信息确定</h4>
        <!-- 内容 -->
        <form>
        <div style="font-size: 16px;margin-top: 26px;line-height: 30px;color: #999;">
   <tr>
      <td><img src="../images/touxiang.jpg" width="100"></td>
      <td>
     <ul>
     <li style="list-style-type:none">医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生：</li>
     <li>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室：</li>
     <li>诊&nbsp;&nbsp;查&nbsp;&nbsp;费:</li>
     <%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
String ygname = request.getParameter("ygname");
//System.out.println("用户输入的用户名:"+nkname);检测
String query="SELECT * FROM 医生表 where 姓名 = '"+ygname+"'";
try{
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs=stmt.executeQuery(query);
	while (rs.next()){
		String ygname4 = rs.getString(2);
		String ygkeshi = rs.getString(6);
		String cost1 = rs.getString(5);
		out.print("<td><ul><li>"+ygname4+"</li><li>"+ygkeshi+"</li><li>"+cost1+"元</li></ul></td>");
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
     <li style="list-style-type:none">就&nbsp;&nbsp;诊&nbsp;&nbsp;人：<%=session.getAttribute("username") %></li>
     
     <li style="list-style-type:none">就诊时间:</li>
     <td><ul><input id="EntryTime" name="EntryTime" type="date"/></ul> </td>
     
   </ul>
  </td>
</tr>S
        </div>
        </form>
        <!-- 按钮 -->
         <a style="display: block;
        background: #008f00;
        color: #FFF;
        text-align: center;
        font-weight: bold;
        font-size: 19px;
        line-height: 60px;
        margin:0 auto;
        margin-top: 45px;
        border-radius: 25px;
        width: 50%;
        " onclick="
        javascript:document.querySelector('#winmsg').remove()" href="http://localhost:8080/guahao/homepage/menu.jsp">确定支付</a>
       <a style="display: block;
        background:#EAEAEA;
        color: #303030;
        text-align: center;
        font-weight: bold;
        font-size: 20px;
        line-height: 60px;
        margin:0 auto;
        margin-top: 40px;
        border-radius: 25px;
        width: 50%;
        " onclick="
        javascript:document.querySelector('#winmsg').remove()">返回</a>
    
   <table border = "1" class="table1">
   <tr>
<td>姓名</td>
<td>性别</td>
<td>职称</td>
<td>出诊费用</td>
<td>余号</td>
<td>操作</td>
</tr>
<%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String ygname1 = request.getParameter("ygname");
//System.out.println("用户输入的用户名:"+nkname);检测
String query1="SELECT * FROM 医生表 where 姓名 = '"+ygname1+"'";
try{
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url2,"sa","202005317");
	//创建Statement语句
	stmt2=con.createStatement();
	//执行SQL语句
	ResultSet rs2=stmt2.executeQuery(query1);
	while (rs2.next()){
		String ygname2 = rs2.getString(2);
		String ygsex = rs2.getString(3);
		String zhicheng = rs2.getString(4);
		String cost = rs2.getString(5);
		String yuhao = rs2.getString(7);
		out.println("<tr><td>"+ygname2+"</td><td>"+ygsex+"</td><td>"+zhicheng+"</td><td>"+cost+"</td><td>"+yuhao
				+"</td><td><a href='"      +      "http://localhost:8080/guahao/neike/seek2.jsp?ygname2="       +      
						ygname2 +   "'>选择</a> </td></tr>");
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
       
     
     </table>   
  </div>
</div>

</body>
</html>
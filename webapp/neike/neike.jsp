<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>内科</title>
<link rel="shortcut icon" href="../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="../administrator/css/jiemian.css">

</head>
<body>
<div class="container-fluid" style="height:70px;background-color:#1b6d85;">
<div>
  <h1 class="biaoti">医院挂号预约系统</h1>
</div>
<div class="daohang">
<ul class="nav">
  <li class="active"><a href="../homepage/menu.jsp">系统首页</a></li>
  <li><a href="#">互联网医院</a></li>
  <li><a href="../wode/w1.jsp">我的</a></li>
</ul>
</div>
   <div class="col-md-3" >
   <h2>挂号</h2>
   <ul class="nav-pills">
 <li><a href="../homepage/menu.jsp">主页</a></li>
  <li class="active"><a href="../neike/neike.jsp">内科</a></li>
  <li><a href="../waike/waike.jsp">外科</a></li>
  <li><a href="../fuchanke/fuchanke.jsp">妇产、生殖科</a></li>
  <li><a href="../erneike/erneike.jsp">儿内科</a></li>
  <li><a href="../zhongyike/zhongyike.jsp">中医、康复科</a></li>
   </ul>
   </div>
  <div class="col-md-9" >
   <div class="container1">
  <table border = "1" class="table1">
  <thead>
   <tr>
<th>门诊编号</th>
<th>门诊名称</th>
<th>门诊主任</th>
<th>门诊位置</th>
<th>介绍</th>
<!--指导书新增操作列-->
<th>操作</th>
</tr>
</thead>
<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
String query="SELECT * FROM 内科";
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
		String nkId = rs.getString(1);
		String nkName = rs.getString(2);
		String nkcommander = rs.getString(3);
		String location = rs.getString(5);
		String introduce = rs.getString(7);
		out.println("<tbody><tr><td>"+nkId+"</td><td>"+nkName+"</td><td>"+nkcommander+"</td><td>"+location+"</td><td>"+introduce
				+"</td>");%>
				<td class="quchu">
				<!--  <a href='"      +      "http://localhost:8080/guahao/neike/seek1.jsp?nkname="       +      
						nkName +   "'>挂号</a> -->
				<a href='../neike/seek1.jsp?nkname=<%=nkName %>'>选择</a>
						</td>
						</tr>
						</tbody>
	<%}
	//out.println("<script>document.querySelector('tbody').querySelector('tr').querySelector('td').querySelector('a').style.textDecoration='none';</script>");
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
</table>
    <script>
    var trs = document.querySelector('.table1').querySelectorAll('tr');  //获得body中所有的tr
    //利用for循环绑定注册事件
     for(var  i = 0;i<trs.length;i++){
   	//鼠标经过事件，变色
   	trs[i].onmouseover = function(){
   		console.log("11");
   		this.style.backgroundColor = "#FFCBA4";
   	}
   	//鼠标离开事件，去色
   	trs[i].onmouseout = function(){
   		this.style.backgroundColor = "#fae9e9";
   	}
   	
   }
    </script>
  </div>
</div>
</body>
</html>
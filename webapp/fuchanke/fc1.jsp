<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>妇产科医生选择</title>
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
  <li ><a href="../neike/neike.jsp">内科</a></li>
  <li><a href="../waike/waike.jsp">外科</a></li>
  <li class="active"><a href="../fuchanke/fuchanke.jsp">妇产、生殖科</a></li>
  <li><a href="../erneike/erneike.jsp">儿内科</a></li>
  <li><a href="../zhongyike/zhongyike.jsp">中医、康复科</a></li>
   </ul>
   </div>
  <div class="col-md-9" >
   <div class="container1">
  <table border = "1" class="table1">
  <thead>
   <tr>
<th>姓名</th>
<th>性别</th>
<th>职称</th>
<th>出诊费用</th>
<th>余号</th>
<!--指导书新增操作列-->
<th>操作</th>
</tr>
<%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
String nkname = request.getParameter("nkname");
//System.out.println("用户输入的用户名:"+nkname);检测
String query="SELECT * FROM 医生表 where 所属科室 = '"+nkname+"'";
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
		String ygname = rs.getString(2);
		String ygsex = rs.getString(3);
		String zhicheng = rs.getString(4);
		String cost = rs.getString(5);
		String yuhao = rs.getString(7);%>
		
		 <!--out.println("<tr><td>"+ygname+"</td><td>"+ygsex+"</td><td>"+zhicheng+"</td><td>"+cost+"</td><td>"+yuhao
				+"</td><td><a href='"      +      "http://localhost:8080/guahao/neike/seek3.jsp?ygname="       +      
						ygname +   "'>选择</a> </td></tr>");-->
			  <tr>
			<td id="mingzi"><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(7)%></td>
			<td class="quchu"><a href='../fuchanke/fc2.jsp?ygname=<%=ygname %>'>选择</a></td>
			</tr>
	<%}	
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
   
			
			
			
			
			
			

	<!-- 读取预约表的信息 -->
		  <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
//System.out.println("用户输入的用户名:"+nkname);检测
//String query2="SELECT * FROM 预约表";
String useridsss = (String)request.getSession().getAttribute("userid");
String nkname2 = request.getParameter("nkname");
String query2="SELECT * FROM 预约表 where 确诊人 = '"+useridsss+"' and 医生科室 = '"+nkname2+"'";
//out.println("query2: "+query2);
try{
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con=DriverManager.getConnection(url,"sa","202005317");
	//创建Statement语句
	stmt=con.createStatement();
	//执行SQL语句
	ResultSet rs3=stmt.executeQuery(query2);
	String rs_ysname="111";
	String zhuangtai="222";
	while (rs3.next()){
		
		
		//rs_ysname=rs_ysname +"&"+ rs3.getString(2);
		//out.println("rs_ysname： "+rs3.getString(2));
		rs_ysname = rs_ysname+"&"+rs3.getString(2);
		zhuangtai = zhuangtai+"&"+rs3.getString(8);
		//out.print("<ul><li>"+ygname4+"</li><li>"+ygkeshi+"</li><li>"+cost1+"元</li></ul>");
		//out.println("<script>document.getElementById('ysname').innerHTML='"+ygname4+"';document.getElementById('keshi').innerHTML='"+ygkeshi+"';document.getElementById('cost').innerHTML='"+cost1+"';document.getElementById('ysname2').value=document.getElementById('ysname').innerHTML;document.getElementById('keshi2').value=document.getElementById('keshi').innerHTML;document.getElementById('cost2').value=document.getElementById('cost').innerHTML;</script>");
	
	}
	out.println("<script> rs_ysname='"+rs_ysname+"'</script>");
	out.println("<script> zhuangtai='"+zhuangtai+"'</script>");
	
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
			
			
						
			
						
			
			
			
			
			
			
			
			
			
	<!--将已经预约过的医生变为不可选的状态-->		
	<script type="text/javascript">
	console.log("rs_ysname= "+rs_ysname);
	console.log("zhuangtai= "+zhuangtai);
	x = rs_ysname;
	y = zhuangtai;
	var x1 = x.split('&');//111,x,x,x
	var y1 = y.split('&');//222,x,x,x
	console.log("x的数组是： "+x1);
	console.log("y的数组是： "+y1);
	var tabletr =document.getElementsByTagName("tr");  //获取body中所有的tr
	
	
	
		//console.log("第"+i+"个医生： "+x1[i1])
		for(var i=1;i<=tabletr.length-1;i++){
			
			
			var s = "tr:nth-child("+(i+1)+")>td:nth-child(1)";  //获得页面中从第二tr的第一行td的医生姓名
			var td = document.querySelector(s);
			console.log("第"+i+"行："+td.innerText);
			
			   //遍历预约表中的医生数量
			for (var j=1; j<=x1.length-1;j++){
			if(td.innerText == x1[j] && y1[j] =='预约成功'){   //如果body中存在的医生与预约表有相同的医生，就改变格式span,并且变成红色字体
					var s2 = "tr:nth-child("+(j+1)+")>td:nth-child(6)";   //获得操作行
					console.log("s2: "+s2);
					var td2 = document.querySelector(s2);
					td2.innerHTML='<span>已预约</span>';
					td2.style.color='red';
			}
			
			}
		}
	
	</script>		
</body>
</html>
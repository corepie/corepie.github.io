<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>门诊科室数据</title>
<link rel="shortcut icon" href="../../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/biaoge.css">
<script src = "../jss/fenye.js"></script>
<script src = "../jss/jquery_mini.js"></script>     <!-- 引入jq文件 -->
<script src = "../jss/quanxuan.js"></script>
<script src = "../jss/pading.js"></script>
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
             
             <li><a href="../Administrator.jsp">[退出]</a></li>
             </ul>
          </div>
      </div>
        
        <!-- 主要功能 -->
        
           <div class="tiaojian">
           <h3>添加信息</h3>
          <form action="" method="post" id="form1">
			<br>科室编号：
			<input id="keid" name="keid" type="text" />
			门诊编号：
			<input id="mzid" name="mzid" type="text"/>	
			<br>门诊名称：
			<input id="mzname" name="mzname" type="text" placeholder="查询条件"/>
			门诊介绍：
			<input id="mzjs" name="mzjs" type="text"/>
			<br>位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置：
			<input id="mzwz" name="mzwz" type="text" placeholder="查询条件"/>
			门诊电话：
			<input id="mzdh" name="mzdh" type="text"/>
			<br>门诊主任：
			<input id="mzzr" name="mzzr" type="text" placeholder="查询条件"/>	   
			<input id="btnInsert" type="submit" value="插入" class="anniu"/>
			<input id="select" type="submit" value="查询" class="anniu2"/>
			
		     </form>
		     
		     <a class="chongzhi">重置</a>
		     
		     <script>
		         var mzid = document.querySelector("#mzid");
		         var anniu = document.querySelector(".anniu");
		         anniu.addEventListener('click',function(){
		        	 if(mzid.value == ''){
			        	 alert("请您输入数据");
			         }else{
			        	 //http://localhost:8080/guahao/addmenzhen.do
			        	 document.querySelector("#form1").action="http://localhost:8080/guahao/addmenzhen.do";
			         }
		         })
		         
		     </script>
		   </div>
    <table border = "1" class="table">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th>科室编号</th>
                <th style="width:180px;height:38px;font-size:22px;">门诊编号</th>
                <th>门诊名称</th>
                <th>门诊介绍</th>
                <th style="width:180px;height:38px;font-size:22px;">位置</th>
                <th>门诊电话</th>
                <th>门诊主任</th>
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
int n = 10;
int num = 0;
String main1 = "";
main1 = (String)session.getAttribute("main");
if(main1 == null){
	main1 ="0";
}else{
	num=Integer.parseInt(main1.trim());
}
String query="";
if(main1.equals("0")){
	query="SELECT top " + n + "* FROM 科室门诊表 order by 门诊编号";
}else{
	int x = n*num;
	query= "select top " + n + " * from 科室门诊表 where 门诊编号 not in (select top "+x+" 门诊编号 from 科室门诊表 order by 门诊编号)";
}

//select top 10 * from 科室门诊表 where 门诊编号 not in (select top n*main 门诊编号 from 科室门诊表 order by 门诊编号)
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
		String ksId = rs.getString(1);
		String mzId = rs.getString(2);
		String mzname = rs.getString(3);
		String mzjs = rs.getString(4);
		String wz = rs.getString(5);
		String mzdh = rs.getString(6);
		String mzzr = rs.getString(7);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox1"></td>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		<td><a href='modifymz.jsp?mzId=<%=mzId %>
		&mzname=<%=mzname %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delmenz.do?mzId=<%=mzId %>' style="color:green;">删除</a></td>
		
		  </tr>
		</tbody>
		
<%}	
	out.println("<script> n='"+n+"'</script>");
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
   <br>
   <!-- 分页功能 -->
   <div class="paging">
     <form action="" method="post" id="form2" name="form2">
       <ul>
         
       </ul>
     </form>
   </div>    
   
   
   <!-- 打印参数 -->
<script type="text/javascript">
var mzname = "<%=(String)session.getAttribute("mzname")%>"
var mzwz = "<%=(String)session.getAttribute("mzwz")%>"
var mzzr = "<%=(String)session.getAttribute("mzzr")%>"
console.log("参数1"+mzname)
console.log("参数2"+mzwz)
console.log("参数3"+mzzr)
</script>
   
   
   <!-- 表二是查询结果显示出来的表 -->
   <table border = "1" class="table2">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th>科室编号</th>
                <th style="width:180px;height:38px;font-size:22px;">门诊编号</th>
                <th>门诊名称</th>
                <th>门诊介绍</th>
                <th style="width:180px;height:38px;font-size:22px;">位置</th>
                <th>门诊电话</th>
                <th>门诊主任</th>
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String mzname = (String)session.getAttribute("mzname");
String mzwz = (String)session.getAttribute("mzwz");
String mzzr = (String)session.getAttribute("mzzr");
//String query2="SELECT top 10 * FROM 用户表2 order by 身份证号";
String sql2  = "SELECT top 10 * FROM 科室门诊表 where 1=1";

if(mzname != "" && mzwz == ""&& mzzr == "") {
	sql2 = sql2 + "and 门诊名称 like concat('%','"+ mzname +"','%')";}  
else if(mzname == ""&& mzwz != ""&& mzzr == ""){
	sql2 = sql2 + "and 位置 like concat('%','" + mzwz +"','%')";}
else if(mzname == ""&& mzwz == ""&&mzzr != ""){
	sql2 = sql2 + "and 主任 = CONVERT(nvarchar,'" + mzzr +"')";}
else if(mzname !="" && mzwz !="" && mzzr == ""){
	sql2 = sql2 + "and 门诊名称 like concat('%','" + mzname +"','%') and 位置 like concat('%','" + mzwz +"','%')";}
else if(mzname !="" && mzwz == "" && mzzr != ""){
	sql2 = sql2 + "and 门诊名称 like concat('%','" + mzname +"','%') and 主任 = CONVERT(nvarchar,'" + mzzr +"')";}
else if(mzname == "" && mzwz !="" && mzzr != ""){
	sql2 = sql2 + "and 主任 = CONVERT(nvarchar,'" + mzzr +"') and 位置 like concat('%','" + mzwz +"','%')";}
else if(mzname != "" && mzwz != "" && mzzr != ""){
	sql2 = sql2 + "and 门诊名称 like concat('%','" + mzname +"','%') and 位置 like concat('%','" + mzwz +"','%') and 主任 = CONVERT(nvarchar,'" + mzzr +"')";}

String query2=sql2;
try{
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con2=DriverManager.getConnection(url2,"sa","202005317");
	//创建Statement语句
	stmt2=con2.createStatement();
	//执行SQL语句
	ResultSet rs2=stmt2.executeQuery(query2);
	while (rs2.next()){
		String ksId2 = rs2.getString(1);
		String mzId2 = rs2.getString(2);
		String mzname2 = rs2.getString(3);
		String mzjs2 = rs2.getString(4);
		String wz2 = rs2.getString(5);
		String mzdh2 = rs2.getString(6);
		String mzzr2 = rs2.getString(7);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox2"></td>
		<td><%=rs2.getString(1)%></td>
		<td><%=rs2.getString(2)%></td>
		<td><%=rs2.getString(3)%></td>
		<td><%=rs2.getString(4)%></td>
		<td><%=rs2.getString(5)%></td>
		<td><%=rs2.getString(6)%></td>
		<td><%=rs2.getString(7)%></td>
		<td><a href='modifymz.jsp?mzId=<%=mzId2 %>
		&mzname=<%=mzname2 %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delmenz.do?mzId=<%=mzId2 %>' style="color:green;">删除</a></td>
		
		  </tr>
		</tbody>
		
<%}	
}catch (ClassNotFoundException e){
out.print("类没有找到异常：");
out.println(e.getMessage());
}catch (SQLException e){
out.println("SQL异常2："+e.getMessage());
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
   
   
   
   <%
String url3 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con3 = null;
Statement stmt3=null;
String query3="SELECT * FROM 科室门诊表 ";
int rowCount2 = 0;
//select top 10 * from 科室门诊表 where 门诊编号 not in (select top 10 门诊编号 from 科室门诊表 order by 门诊编号)
try{
	//加载jdbc驱动程序
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//建立连接
	con3=DriverManager.getConnection(url3,"sa","202005317");
	//创建Statement语句
	stmt3=con3.createStatement();
	//执行SQL语句
	ResultSet rs3=stmt3.executeQuery(query3);
	while (rs3.next()){
		rowCount2++;
	}	
	out.println("<script> rowCount2='"+rowCount2+"'</script>");      //定义全局变量-科室门诊表中数据行数
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
   
   <script>
        window.addEventListener('load',function(){
        	var anniu2 = document.querySelector(".anniu2");
        	var table = document.querySelector(".table");
        	var table2 = document.querySelector(".table2");
        	var mzname = document.querySelector("#mzname");
        	var mzwz = document.querySelector("#mzwz");
        	var mzzr = document.querySelector("#mzzr");
        	//var pmoney = document.querySelector("#pmoney");
        	var chongzhi = document.querySelector(".chongzhi");
        	var paging = document.querySelector(".paging");
        	 
        	 var zhi = window.location.search;
        	 console.log(zhi);
        	 
        	 
        	anniu2.addEventListener('click',function(){
        		if(mzname.value =="" && mzwz.value =="" && mzzr.value ==""){
            		alert("请输入要查询的条件！");
            	}else{
            		
            		document.querySelector("#form1").action="http://localhost:8080/guahao/selectmz.do";
            	}
        	})
        	
        	
        	chongzhi.onclick=function(){
        		table2.style.display="none";
         		table.style.display="block";
         		paging.style.display="block";
       	}
        	
        	
        	
        	if(zhi ==""){
       		 //table2.style.display="none";
       		 table.style.display="block";
       		 paging.style.display="block";
       	 }else{
       		 table2.style.display="block";
       		 table.style.display="none";
       		 paging.style.display="none";
       	 }
        	
        })
   </script>
   
   
</div>
   
</body>
</html>
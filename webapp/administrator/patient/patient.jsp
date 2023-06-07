<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>病人数据</title>
<link rel="shortcut icon" href="../../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/biaoge.css">
<script src = "../jss/fenye.js"></script>
<script src = "../jss/jquery_mini.js"></script>     <!-- 引入jq文件 -->
<script src = "../jss/quanxuan.js"></script>
<style>
 select option{
    font-size:24px;
    
 }
</style>
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
        <li ><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
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
             
             <li><a href="../Administrator.jsp">[退出]</a></li>
             </ul>
          </div>
      </div>
        
        <!-- 主要功能 -->
        
           <div class="tiaojian">
           <h3>查询信息</h3>
          <form action="" method="post" id="form1">
			<br>用&nbsp; 户&nbsp;  名：
			<input id="pname" name="pname" type="text"/>	
			<br>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
			<select id="psex" name="psex" style="width:200px;height:38px;font-size:24px;margin-top:3px">
			   <option value=""></option>
			   <option value="null">null</option>
			   <option value="男">男</option>
               <option value="女">女</option>
			</select>
			<br>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：
			<input id="page" name="page" type="text"/>
			<br>账户余额：
			<input id="pmoney" name="pmoney" type="text"/>
			<br>
			
			<input id="select" type="submit" value="查询" class="anniu2" style="position:absolute;top:87%;left:102%"/>
			
		     </form>
		     
		     <a class="chongzhi" style="position:absolute;top:87%;left:137%;cursor:pointer;">重置</a>
		     <!--  
		     <script>   
		     var pid = document.querySelector("#pid");
		         var anniu = document.querySelector(".anniu");
		         anniu.addEventListener('click',function(){
		        	 if(pid.value == ''){
			        	 alert("请您输入数据");
			         }else{
			        	 //http://localhost:8080/guahao/addmenzhen.do
			        	 document.querySelector("#form1").action="http://localhost:8080/guahao/addpatient.do";
			         }
		         })
		         
		     </script>  -->
		   </div>
    <table border = "1" class="table" style="margin-left:200px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th style="width:180px;height:38px;font-size:22px;">身份证号</th>
                <th>用户名</th>
                <th>性别</th>
                <th>年龄</th>
                <th >账户余额</th>
                <th style="width:180px;height:38px;font-size:22px;">联系方式</th>
               
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
String query="SELECT top 10 * FROM 用户表2 order by 身份证号";
int rowCount = 0;
//select top 10 * from 科室门诊表 where 门诊编号 not in (select top 10 门诊编号 from 科室门诊表 order by 门诊编号)
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
		String pname = rs.getString(1);
		String pid = rs.getString(7);
		String psex = rs.getString(4);
		String page1 = rs.getString(5);
		String pmoney = rs.getString(3);
		String pnumber = rs.getString(6);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox1"></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(6)%></td>
				<td><a href='modifybr.jsp?pid=<%=pid %>' style="color:#0000EE;">修改</a></td>
		
		  </tr>
		</tbody>
		
<%}	
	out.println("<script> rowCount='"+rowCount+"'</script>");      //定义全局变量-科室门诊表中数据行数
}catch (ClassNotFoundException e){
out.print("类没有找到异常：");
out.println(e.getMessage());
}catch (SQLException e){
out.println("SQL异常1："+e.getMessage());
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
   
   <!-- 打印参数 -->
<script type="text/javascript">
var empid = "<%=(String)session.getAttribute("pname")%>"
var psex = "<%=(String)session.getAttribute("psex")%>"
var page = "<%=(String)session.getAttribute("page")%>"
var pmoney = "<%=(String)session.getAttribute("pmoney")%>"
console.log("参数1"+empid)
console.log("参数2"+psex)
console.log("参数3"+page)
console.log("参数4"+pmoney)
</script>
   
   
   <!-- 表二是查询结果显示出来的表 -->
   <table border = "1" class="table2" style="margin-left:200px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" id="all"></th>
                <th style="width:180px;height:38px;font-size:22px;">身份证号</th>
                <th>用户名</th>
                <th>性别</th>
                <th>年龄</th>
                <th >账户余额</th>
                <th style="width:180px;height:38px;font-size:22px;">联系方式</th>
               
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String pname = (String)session.getAttribute("pname");
String psex = (String)session.getAttribute("psex");
String page3 = (String)session.getAttribute("page");
String pmoney = (String)session.getAttribute("pmoney");
//String query2="SELECT top 10 * FROM 用户表2 order by 身份证号";
String sql2  = "SELECT top 10 * FROM 用户表2 where 1=1";
//pname ==""
if(pname !="" && psex=="" && page3=="" && pmoney==""){
	sql2 = sql2 + "and 用户名 like concat('%','"+pname+"','%')";//模糊查询 姓名1
} else if(pname=="" && psex!="" && page3=="" && pmoney==""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+psex+"')";//只有性别 2
} else if(pname=="" && psex=="" && page3!="" && pmoney==""){
	sql2 = sql2 + "and 年龄=CONVERT(nvarchar,'"+page3+"')";//只有年龄 3
}
else if(pname=="" && psex=="" && page3=="" && pmoney!=""){
	sql2 = sql2 + "and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//只有余额 4
} else if(pname!="" && psex!="" && page3=="" && pmoney==""){
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 性别=CONVERT(nvarchar,'"+psex+"')";//有姓名和性别 5
} else if(pname!="" && psex=="" && page3!="" && pmoney==""){
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 年龄=CONVERT(nvarchar,'"+page3+"')";//有姓名和年龄 6
}  else if(pname!="" && psex=="" && page3=="" && pmoney!=""){
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//有姓名和余额 7
}  else if(pname=="" && psex!="" && page3!="" && pmoney==""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+psex+"') and 年龄=CONVERT(nvarchar,'"+page3+"')";//有性别和年龄 8
}else if(pname=="" && psex!="" && page3=="" && pmoney!=""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+psex+"') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//有性别和余额 9
}else if(pname=="" && psex=="" && page3!="" && pmoney!=""){
	sql2 = sql2 + "and 年龄=CONVERT(nvarchar,'"+page3+"') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//有年龄和余额 10
}else if(pname!="" && psex!="" && page3!="" && pmoney==""){
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 性别=CONVERT(nvarchar,'"+psex+"') and 年龄=CONVERT(nvarchar,'"+page3+"')";//没有余额 11
} else if(pname=="" && psex!="" && page3!="" && pmoney!=""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+psex+"') and 年龄=CONVERT(nvarchar,'"+page3+"') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//没有姓名 12
} else if(pname!="" && psex=="" && page3!="" && pmoney!=""){
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 年龄=CONVERT(nvarchar,'"+page3+"') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//没有性别 13
} else if(pname!="" && psex!="" && page3=="" && pmoney!=""){
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 性别=CONVERT(nvarchar,'"+psex+"') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";//没有年龄 14
} 
else if(pname!="" && psex!="" && page3!="" && pmoney!=""){//全有
	sql2 = sql2 + "and 用户名  like concat('%','"+pname+"','%') and 性别=CONVERT(nvarchar,'"+psex+"') and 年龄=CONVERT(nvarchar,'"+page3+"') and 账户余额=CONVERT(nvarchar,'"+pmoney+"')";
	//sql1 = sql1;
} 

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
		String pname2 = rs2.getString(1);
		String pid2 = rs2.getString(7);
		String psex2 = rs2.getString(4);
		String page2 = rs2.getString(5);
		String pmoney2 = rs2.getString(3);
		String pnumber2 = rs2.getString(6);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox"></td>
		<td><%=rs2.getString(7)%></td>
		<td><%=rs2.getString(1)%></td>
		<td><%=rs2.getString(4)%></td>
		<td><%=rs2.getString(5)%></td>
		<td><%=rs2.getString(3)%></td>
		<td><%=rs2.getString(6)%></td>
				<td><a href='modifybr.jsp?pid=<%=pid2 %>' style="color:#0000EE;">修改</a></td>
		
		  </tr>
		</tbody>
		
<%}	
}catch (ClassNotFoundException e){
out.print("类没有找到异常：");
out.println(e.getMessage());
}catch (SQLException e){
//out.println("SQL异常2："+e.getMessage());
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
        window.addEventListener('load',function(){
        	var anniu2 = document.querySelector(".anniu2");
        	var table = document.querySelector(".table");
        	var table2 = document.querySelector(".table2");
        	var pname = document.querySelector("#pname");
        	var psex = document.querySelector("#psex");
        	var page = document.querySelector("#page");
        	var pmoney = document.querySelector("#pmoney");
        	var chongzhi = document.querySelector(".chongzhi");
        	 
        	 var zhi = window.location.search;
        	 console.log(zhi);
        	 
        	 
        	anniu2.addEventListener('click',function(){
        		if(pname.value =="" && psex.value =="" && page.value =="" && pmoney.value ==""){
            		alert("请输入要查询的条件！");
            	}else{
            		
            		document.querySelector("#form1").action="http://localhost:8080/guahao/selectbr.do";
            	}
        	})
        	
        	
        	chongzhi.onclick=function(){
        		table2.style.display="none";
         		table.style.display="block";
       	}
        	
        	
        	
        	if(zhi ==""){
       		 //table2.style.display="none";
       		 table.style.display="block";
       	 }else{
       		 table2.style.display="block";
       		 table.style.display="none";
       	 }
        	
        })
   </script>
   
   
</div>
   
</body>
</html>
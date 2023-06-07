<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>医生数据</title>
<link rel="shortcut icon" href="../../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/biaoge.css">
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
             
             <li><a href="../Administrator.jsp">[退出]</a></li>
             </ul>
          </div>
      </div>
        
        <!-- 主要功能 -->
        
           <div class="tiaojian">
           <h3>添加信息</h3>
          <form action="" method="post" id="form1">
			<br>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：
			<input id="yid" name="yid" type="text" />
			姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
			<input id="yname" name="yname" type="text" placeholder="查询条件"/>	
			<br>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
			<select id="ysex" name="ysex" style="width:254px;height:38px;font-size:24px;margin-top:3px;">   <!-- 查询条件 -->
			   <option value=""></option>
			   <option value="男">男</option>
               <option value="女">女</option>
			</select>
			职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：
			<input id="yrank" name="yrank" type="text" placeholder="查询条件"/>
			<br>出诊费用：
			<input id="majorName" name="ymoney" type="text"/>
			所属科室：
			<input id="ydept" name="ydept" type="text" placeholder="查询条件"/>
			<br>余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：
			<input id="ynumber" name="ynumber" type="text"/>
	         <br>部门分类：
			<input id="bm" name="bm" type="text" placeholder="查询条件"/>      
			<input id="btnInsert" type="submit" value="插入" class="anniu"/>
			<input id="select" type="submit" value="查询" class="anniu2"/>
			
		     </form>
		     
		     <a class="chongzhi">重置</a>
		     
		     <script>
		         var yid = document.querySelector("#yid");
		         var anniu = document.querySelector(".anniu");
		         anniu.addEventListener('click',function(){
		        	 if(yid.value == ''){
			        	 alert("请您输入数据");
			         }else{
			        	 //http://localhost:8080/guahao/addmenzhen.do
			        	 document.querySelector("#form1").action="http://localhost:8080/guahao/addyisheng.do";
			         }
		         })
		         
		     </script>
		   </div>
    <table border = "1" class="table" style="margin-left:70px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th>工号</th>
                <th>姓名</th>
                <th>性别</th>
                <th  style="width:180px;height:38px;font-size:22px;">职称</th>
                <th>出诊费用</th>
                <th style="width:180px;height:38px;font-size:22px;">所属科室</th>
                <th>余号</th>
                <th>部门分类</th>
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
	query="SELECT top " + n + "* FROM 医生表 order by 工号";
}else{
	int x = n*num;
	query= "select top " + n + " * from 医生表 where 工号 not in (select top "+x+" 工号 from 医生表 order by 工号)";
}
//String query="SELECT top 10 * FROM 医生表 order by 工号";
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
		String yid = rs.getString(1);
		String yname = rs.getString(2);
		String ysex= rs.getString(3);
		String yrank = rs.getString(4);
		String ymoney = rs.getString(5);
		String ydept = rs.getString(6);
		String ynumber = rs.getString(7);
		String bm = rs.getString(8);
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
		<td><%=rs.getString(8)%></td>
		<td><a href='modifyys.jsp?yid=<%=yid %>&bm=<%=bm %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delyisheng.do?yid=<%=yid %>' style="color:green;">删除</a></td>
		
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
   <div class="paging" style="position:absolute;top:90%;left:23%;display:block;">
     <form action="" method="post" id="form2" name="form2">
       <ul>
         
       </ul>
     </form>
   </div>    
   
   
   
   <!-- 第二部分 -->
   <script type="text/javascript">
var yname = "<%=(String)session.getAttribute("yname")%>";
var ysex = "<%=(String)session.getAttribute("ysex")%>";
var yrank = "<%=(String)session.getAttribute("yrank")%>";
var ydept = "<%=(String)session.getAttribute("ydept")%>";
var bm = "<%=(String)session.getAttribute("bm")%>";
console.log("参数1"+yname);
console.log("参数2"+ysex);
console.log("参数3"+yrank);
console.log("参数4"+ydept);
console.log("参数5"+bm);
</script>
   
   
   <!-- 表二是查询结果显示出来的表 -->
    <table border = "1" class="table2" style="margin-left:70px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="checkall" id="checkall"></th>
                <th>工号</th>
                <th>姓名</th>
                <th>性别</th>
                <th  style="width:180px;height:38px;font-size:22px;">职称</th>
                <th>出诊费用</th>
                <th style="width:180px;height:38px;font-size:22px;">所属科室</th>
                <th>余号</th>
                <th>部门分类</th>
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String yname = (String)session.getAttribute("yname");
String ysex = (String)session.getAttribute("ysex");
String yrank3 = (String)session.getAttribute("yrank");
String ydept = (String)session.getAttribute("ydept");
String bm = (String)session.getAttribute("bm");
//String query2="SELECT top 10 * FROM 用户表2 order by 身份证号";
String sql2  = "SELECT top 10 * FROM 医生表 where 1=1";
//pname ==""
if(yname !="" && ysex=="" && yrank3=="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 姓名 like concat('%','"+yname+"','%') and 部门分类 like concat('%','"+bm+"','%')";//模糊查询 姓名1
}else if(yname =="" && ysex=="" && yrank3=="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 部门分类 like concat('%','"+bm+"','%')";
}
else if(yname=="" && ysex!="" && yrank3=="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 部门分类 like concat('%','"+bm+"','%')";//只有性别 2
} else if(yname=="" && ysex=="" && yrank3!="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 职称=CONVERT(nvarchar,'"+yrank3+"') and 部门分类 like concat('%','"+bm+"','%')";//只有职称 3
}
else if(yname=="" && ysex=="" && yrank3=="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//只有所属科室 4
} else if(yname!="" && ysex!="" && yrank3=="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 部门分类 like concat('%','"+bm+"','%')";//有姓名和性别 5
} else if(yname!="" && ysex=="" && yrank3!="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 部门分类 like concat('%','"+bm+"','%')";//有姓名和职称 6
}  else if(yname!="" && ysex=="" && yrank3=="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//有姓名和所属科室 7
}  else if(yname=="" && ysex!="" && yrank3!="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 部门分类 like concat('%','"+bm+"','%')";//有性别和职称 8
}else if(yname=="" && ysex!="" && yrank3=="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//有性别和所属科室 9
}else if(yname=="" && ysex=="" && yrank3!="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//有职称和所属科室 10
}else if(yname!="" && ysex!="" && yrank3!="" && ydept==""&& bm!=""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 部门分类 like concat('%','"+bm+"','%')";//没有所属科室 11
} else if(yname=="" && ysex!="" && yrank3!="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//没有姓名 12
} else if(yname!="" && ysex=="" && yrank3!="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//没有性别 13
} else if(yname!="" && ysex!="" && yrank3=="" && ydept!=""&& bm!=""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";//没有职称 14
} 
else if(yname!="" && ysex!="" && yrank3!="" && ydept!=""&& bm!=""){//全有
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%') and 部门分类 like concat('%','"+bm+"','%')";
} else if(yname !="" && ysex=="" && yrank3=="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 姓名 like concat('%','"+yname+"','%')";//模糊查询 姓名1
} else if(yname=="" && ysex!="" && yrank3=="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"')";//只有性别 2
} else if(yname=="" && ysex=="" && yrank3!="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 职称=CONVERT(nvarchar,'"+yrank3+"')";//只有职称 3
}
else if(yname=="" && ysex=="" && yrank3=="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 所属科室 like concat('%','"+ydept+"','%')";//只有所属科室 4
} else if(yname!="" && ysex!="" && yrank3=="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"')";//有姓名和性别 5
} else if(yname!="" && ysex=="" && yrank3!="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 职称=CONVERT(nvarchar,'"+yrank3+"')";//有姓名和职称 6
}  else if(yname!="" && ysex=="" && yrank3=="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 所属科室 like concat('%','"+ydept+"','%')";//有姓名和所属科室 7
}  else if(yname=="" && ysex!="" && yrank3!="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"')";//有性别和职称 8
}else if(yname=="" && ysex!="" && yrank3=="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 所属科室 like concat('%','"+ydept+"','%')";//有性别和所属科室 9
}else if(yname=="" && ysex=="" && yrank3!="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%')";//有职称和所属科室 10
}else if(yname!="" && ysex!="" && yrank3!="" && ydept==""&& bm==""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"')";//没有所属科室 11
} else if(yname=="" && ysex!="" && yrank3!="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%')";//没有姓名 12
} else if(yname!="" && ysex=="" && yrank3!="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%')";//没有性别 13
} else if(yname!="" && ysex!="" && yrank3=="" && ydept!=""&& bm==""){
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 所属科室 like concat('%','"+ydept+"','%')";//没有职称 14
} 
else if(yname!="" && ysex!="" && yrank3!="" && ydept!=""&& bm==""){//全有
	sql2 = sql2 + "and 姓名  like concat('%','"+yname+"','%') and 性别=CONVERT(nvarchar,'"+ysex+"') and 职称=CONVERT(nvarchar,'"+yrank3+"') and 所属科室 like concat('%','"+ydept+"','%')";
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
		String yid2 = rs2.getString(1);
		String yname2 = rs2.getString(2);
		String ysex2 = rs2.getString(3);
		String yrank2 = rs2.getString(4);
		String ymoney2 = rs2.getString(5);
		String ydept2 = rs2.getString(6);
		String ynumber2 = rs2.getString(7);
		String bm2 = rs2.getString(8);
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
		<td><%=rs2.getString(8)%></td>
		<td><a href='modifyys.jsp?yid=<%=yid2 %>&bm=<%=bm2 %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delyisheng.do?yid=<%=yid2 %>' style="color:green;">删除</a></td>
		
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
String query3="SELECT * FROM 医生表 ";
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
        	var yname = document.querySelector("#yname");
        	var ysex = document.querySelector("#ysex");
        	var yrank = document.querySelector("#yrank");
        	var ydept = document.querySelector("#ydept");
        	var bm = document.querySelector("#bm");
        	var chongzhi = document.querySelector(".chongzhi");
        	var paging = document.querySelector(".paging");
        	 
        	 var zhi = window.location.search;
        	 console.log(zhi);
        	 
        	 anniu2.addEventListener('click',function(){
         		if(yname.value =="" && ysex.value =="" && yrank.value =="" && ydept.value =="" && bm.value ==""){
             		alert("请输入要查询的条件！");
             	}else{
             		
             		document.querySelector("#form1").action="http://localhost:8080/guahao/selectys.do";
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
   
   <script>
   $(function(){
		x = rowCount2;
		y = n;
		//console.log("行数是："+x);
		//console.log("展示:"+y);
		var num = Math.ceil(x/y);
		console.log("页数是:"+num);
		
		for(var i = 0;i<num;i++){
			var li = $("<li></li>");   //动态新建li
			li.html((i+1)+"<input type='hidden' name='fenye' value='"+i+"'>");  //将input放入li中
			$(".paging form ul").append(li);
			
		}
		
		//把新建的li绑定未来事件
		$(".paging form ul").on("click","li",function(){
			var key = $(this).find("input").val();
			$(this).css("backgroundColor","pink");
			//console.log(key);
			//$("#form2").attr("action", "http://localhost:8080/guahao/selectmz.do?key"+key+"");
			var  newUrl =  'http://localhost:8080/guahao/fyys.do?key='+key;     //设置新提交地址
	         $( "#form2" ).attr( 'action' ,newUrl);     //通过jquery为action属性赋值
	         $( "#form2" ).submit();     //提交ID为myform的表单
		})
		 
	})
   
   </script>
</body>
</html>
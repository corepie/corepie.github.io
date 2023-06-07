<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约表数据</title>
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
             
             <li><a href="../Administrator.jsp">[退出]</a></li>
             </ul>
          </div>
      </div>
        
        <!-- 主要功能 -->
        
         <div class="tiaojian">
           <h3>查询信息</h3>
          <form action="" method="post" id="form1">
			<br>确&nbsp;诊&nbsp; 人：
			<input id="pname" name="pname" type="text" />
			医生姓名：
			<input id="yname" name="yname" type="text"/>	
			<br>
		    开始日期：
			<input id="idate" name="idate" type="date" style="color:#ccc;">
			结束日期：
			<input id="edate" name="eidate" type="date" style="color:#ccc;">
			<br>是否就诊：
			<select id="idiff" name="idiff" style="width:200px;height:36px;font-size:24px;margin-top:3px;">
			   <option value=""></option>
			   <option value="是">1</option>
			   <option value="否">0</option>
			   
			
			</select>   
			<input id="select" type="submit" value="查询" class="anniu2"/>
			
		     </form>
		     
		     <a class="chongzhi">重置</a>
		     
		   </div>
    <table border = "1" class="table" style="margin-left:20px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th style="width:180px;height:38px;font-size:22px;">预约编号</th>
                <th>确诊人</th>
                <th style="width:180px;height:38px;font-size:22px;">医生姓名</th>
                <th>医生科室</th>
                <th>诊查费</th>
                <th>就诊日期</th>
                <th>就诊时间</th>
                <th>状态</th>
                <th>是否就诊</th>
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con = null;
Statement stmt=null;
int n = 5;
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
	query="SELECT top " + n + "* FROM 预约表 order by 预约编号";
}else{
	int x = n*num;
	query= "select top " + n + " * from 预约表 where 预约编号 not in (select top "+x+" 预约编号 from 预约表 order by 预约编号)";
}
//String query="SELECT top 5 * FROM 预约表 order by 预约编号";
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
		String yname = rs.getString(2);
		String ydept = rs.getString(3);
		String imoney = rs.getString(4);
		String idate = rs.getString(5);
		String itime = rs.getString(6);
		String iid = rs.getString(7);
		String ist = rs.getString(8);
		String idiffer = rs.getString(9);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox1"></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(8)%></td>
		<td><%=rs.getString(9)%></td>
		<td><a href='modifyyy.jsp?iid=<%=iid %>
		&ydept=<%=ydept %>&pname=<%=pname %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delyy.do?iid=<%=iid %>' style="color:green;">删除</a></td>
		
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
   <div class="paging" style="position:absolute;top:75%;left:22%;display:block;">
     <form action="" method="post" id="form2" name="form2">
       <ul>
         
       </ul>
     </form>
   </div>    
   
   <!-- 打印参数 -->
<script type="text/javascript">
var pname = "<%=(String)session.getAttribute("pname")%>"
var yname = "<%=(String)session.getAttribute("yname")%>"
var idate = "<%=(String)session.getAttribute("idate")%>"
var ddate = "<%=(String)session.getAttribute("ddate")%>"
var idiff = "<%=(String)session.getAttribute("idiff")%>"
console.log("参数1"+pname)
console.log("参数2"+yname)
console.log("参数3"+idate)
console.log("参数4"+ddate)
console.log("参数5"+idiff)
</script>
   
   
   <!-- 表二是查询结果显示出来的表 -->
   <table border = "1" class="table2" style="margin-left:20px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="checkall" id="checkall"></th>
                <th style="width:180px;height:38px;font-size:22px;">预约编号</th>
                <th>确诊人</th>
                <th style="width:180px;height:38px;font-size:22px;">医生姓名</th>
                <th>医生科室</th>
                <th>诊查费</th>
                <th>就诊日期</th>
                <th>就诊时间</th>
                <th>状态</th>
                <th>是否就诊</th>
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String pname = (String)session.getAttribute("pname");
String yname = (String)session.getAttribute("yname");
String idate = (String)session.getAttribute("idate");
String ddate = (String)session.getAttribute("ddate");
String idiff = (String)session.getAttribute("idiff");
//String query2="SELECT top 10 * FROM 用户表2 order by 身份证号";
String sql2  = "SELECT top 5 * FROM 预约表 where 1=1";
//pname ==""

if(pname !="" && idate=="" && ddate=="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 确诊人 like concat('%','"+pname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//模糊查询 确诊人1
} else if(pname=="" && idate!="" && ddate=="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"' and 区分 = CONVERT(nvarchar,'"+idiff+"')";//只有就诊日期 2
} else if(pname=="" && idate=="" && ddate!="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"' and 区分 = CONVERT(nvarchar,'"+idiff+"')";//只有就诊日期 3
}
else if(pname=="" && idate=="" && ddate=="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//只有医生姓名 4
} else if(pname!="" && idate!="" && ddate=="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"' and 区分 = CONVERT(nvarchar,'"+idiff+"')";//有确诊人和就诊日期 5
} else if(pname!="" && idate=="" && ddate!="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"' and 区分 = CONVERT(nvarchar,'"+idiff+"')";//有确诊人和就诊日期 6
}  else if(pname!="" && idate=="" && ddate=="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//有确诊人和医生姓名 7
}  else if(pname=="" && idate!="" && ddate!="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 区分 = CONVERT(nvarchar,'"+idiff+"') and 就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";//有就诊日期和就诊日期 8
}else if(pname=="" && idate!="" && ddate=="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//有就诊日期和医生姓名 9
}else if(pname=="" && idate=="" && ddate!="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//有就诊日期和医生姓名 10
}else if(pname!="" && idate!="" && ddate!="" && yname==""&& idiff!=""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"') and 就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";//没有医生姓名 11
} else if(pname=="" && idate!="" && ddate!="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"') and  就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";//没有确诊人 12
} else if(pname!="" && idate=="" && ddate!="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//没有就诊日期 13
} else if(pname!="" && idate!="" && ddate=="" && yname!=""&& idiff!=""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"')";//没有就诊日期 14
} 
else if(pname!="" && idate!="" && ddate!="" && yname!=""&& idiff!=""){//全有
sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 医生姓名 like concat('%','"+yname+"','%') and 区分 = CONVERT(nvarchar,'"+idiff+"') and  就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";} 

else if(pname !="" && idate=="" && ddate=="" && yname==""&& idiff==""){
	sql2 = sql2 + "and 确诊人 like concat('%','"+pname+"','%')";//模糊查询 确诊人1
} else if(pname=="" && idate!="" && ddate=="" && yname==""&& idiff==""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"'";//只有就诊日期 2
} else if(pname=="" && idate=="" && ddate!="" && yname==""&& idiff==""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"'";//只有就诊日期 3
}
else if(pname=="" && idate=="" && ddate=="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 医生姓名 like concat('%','"+yname+"','%')";//只有医生姓名 4
} else if(pname!="" && idate!="" && ddate=="" && yname==""&& idiff==""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"'";//有确诊人和就诊日期 5
} else if(pname!="" && idate=="" && ddate!="" && yname==""&& idiff==""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"'";//有确诊人和就诊日期 6
}  else if(pname!="" && idate=="" && ddate=="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 医生姓名 like concat('%','"+yname+"','%')";//有确诊人和医生姓名 7
}  else if(pname=="" && idate!="" && ddate!="" && yname==""&& idiff==""){
	sql2 = sql2 + "and  就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";//有就诊日期和就诊日期 8
}else if(pname=="" && idate!="" && ddate=="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%')";//有就诊日期和医生姓名 9
}else if(pname=="" && idate=="" && ddate!="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%')";//有就诊日期和医生姓名 10
}else if(pname!="" && idate!="" && ddate!="" && yname==""&& idiff==""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and  就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";//没有医生姓名 11
} else if(pname=="" && idate!="" && ddate!="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 医生姓名 like concat('%','"+yname+"','%') and  就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";//没有确诊人 12
} else if(pname!="" && idate=="" && ddate!="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%')";//没有就诊日期 13
} else if(pname!="" && idate!="" && ddate=="" && yname!=""&& idiff==""){
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 就诊日期 ='"+idate+"' and 医生姓名 like concat('%','"+yname+"','%')";//没有就诊日期 14
} 
else if(pname!="" && idate!="" && ddate!="" && yname!=""&& idiff==""){//全有
	sql2 = sql2 + "and 确诊人  like concat('%','"+pname+"','%') and 医生姓名 like concat('%','"+yname+"','%') and  就诊日期  BETWEEN ('"+idate+"' and '"+ddate+"')";
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
		String yname2 = rs2.getString(2);
		String ydept2 = rs2.getString(3);
		String imoney2 = rs2.getString(4);
		String idate2 = rs2.getString(5);
		String itime2 = rs2.getString(6);
		String iid2 = rs2.getString(7);
		String ist2 = rs2.getString(8);
		String idiffer2 = rs2.getString(9);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox2"></td>
		<td><%=rs2.getString(7)%></td>
		<td><%=rs2.getString(1)%></td>
		<td><%=rs2.getString(2)%></td>
		<td><%=rs2.getString(3)%></td>
		<td><%=rs2.getString(4)%></td>
		<td><%=rs2.getString(5)%></td>
		<td><%=rs2.getString(6)%></td>
		<td><%=rs2.getString(8)%></td>
		<td><%=rs2.getString(9)%></td>
		<td><a href='modifyyy.jsp?iid=<%=iid2 %>
		&ydept=<%=ydept2 %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delyy.do?iid=<%=iid2 %>' style="color:green;">删除</a></td>
		
		
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
 
 <%
String url3 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con3 = null;
Statement stmt3=null;
String query3="SELECT * FROM 预约表 ";
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
        	var pname = document.querySelector("#pname");
        	var yname = document.querySelector("#yname");
        	var idate = document.querySelector("#idate");
        	var ddate = document.querySelector("#ddate");
        	var idiff = document.querySelector("#idiff");
        	var chongzhi = document.querySelector(".chongzhi");
        	var paging = document.querySelector(".paging");
        	 
        	 var zhi = window.location.search;
        	 console.log(zhi);
        	 
        	 
        	anniu2.addEventListener('click',function(){
        		if(pname.value =="" && yname.value =="" && idate.value =="" && ddate.value =="" && idiff.value ==""){
            		alert("请输入要查询的条件！");
            	}else{
            		
            		document.querySelector("#form1").action="http://localhost:8080/guahao/selectyy.do";
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
			var  newUrl =  'http://localhost:8080/guahao/fyyy.do?key='+key;     //设置新提交地址
	         $( "#form2" ).attr( 'action' ,newUrl);     //通过jquery为action属性赋值
	         $( "#form2" ).submit();     //提交ID为myform的表单
		})
		 
	})
   
   </script>
</body>
</html>
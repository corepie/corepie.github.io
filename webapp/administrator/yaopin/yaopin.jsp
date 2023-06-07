<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>药品信息</title>
<link rel="shortcut icon" href="../../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/biaoge.css">
<script src = "../jss/jquery_mini.js"></script>     <!-- 引入jq文件 -->
<script src = "../jss/quanxuan.js"></script>
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
        <li><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
        <img src="../../images/yonghu11.png">
        <li><a href="http://localhost:8080/guahao/administrator/patient/patient.jsp">用户管理</a><span>&gt;</span></li>
        <img src="../../images/jinqian.png">
        <li><a href="http://localhost:8080/guahao/administrator/caiwu/caiwu.jsp">财务管理</a><span>&gt;</span></li>
        <img src="../../images/yaopin.png">
        <li class="active"><a href="http://localhost:8080/guahao/administrator/yaopin/yaopin.jsp">药房管理</a><span>&gt;</span></li>
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
			<br>药品号码：
			<input id="tid" name="tid" type="text" />
			<br>产品名称：
			<input id="tname" name="tname" type="text" placeholder="查询条件"/>	
		    <br>公司名称：
			<input id="gname" name="gname" type="text"/>
			<br>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：
			<input id="number" name="number" type="text" placeholder="查询条件"/>
	        <br>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;钱：
			<input id="money" name="money" type="text" placeholder="查询条件"/>     
			<input id="btnInsert" type="submit" value="插入" class="anniu" style="position:absolute;top:87%;left:103%">
			<input id="select" type="submit" value="查询" class="anniu2" style="position:absolute;top:87%;left:137%">
			
		     </form>
		     
		     <a class="chongzhi" style="position:absolute;top:87%;left:170%">重置</a>
		     
		     <script>
		         var tid = document.querySelector("#tid");
		         var anniu = document.querySelector(".anniu");
		         anniu.addEventListener('click',function(){
		        	 if(tid.value == ''){
			        	 alert("请您输入数据");
			         }else{
			        	 //http://localhost:8080/guahao/addmenzhen.do
			        	 document.querySelector("#form1").action="http://localhost:8080/guahao/addyaopin.do";
			         }
		         })
		         
		     </script>
		   </div>
    <table border = "1" class="table" style="margin-left:220px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th style="width:200px;height:38px;font-size:22px;">药品号码</th>
                <th style="width:200px;height:38px;font-size:22px;">药品名称</th>
                <th style="width:200px;height:38px;font-size:22px;">公司名称</th>
                <th>数量</th>      
                <th>价钱</th>
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
	query="SELECT top " + n + "* FROM 药品表 order by 药品号码";
}else{
	int x = n*num;
	query= "select top " + n + " * from 药品表 where 药品号码 not in (select top "+x+" 药品号码 from 药品表 order by 药品号码)";
}
//String query="SELECT top 5 * FROM 药品表 order by 药品号码";

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
		String tid = rs.getString(1);
		String tname = rs.getString(2);
		String gname = rs.getString(3);
		String number = rs.getString(4);
		String money = rs.getString(5);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox1"></td>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><a href='modifyyp.jsp?tid=<%=tid %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delyaopin.do?tid=<%=tid %>' style="color:green;">删除</a></td>
		
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
   <div class="paging" style="position:absolute;top:95%;left:28%;display:block;">
     <form action="" method="post" id="form2" name="form2">
       <ul>
         
       </ul>
     </form>
   </div>    
   
   
   <!-- 打印参数 -->
<script type="text/javascript">
var emtname = "<%=(String)session.getAttribute("tname")%>"
var number = "<%=(String)session.getAttribute("number")%>"
var money = "<%=(String)session.getAttribute("money")%>"
console.log("参数1"+emtname)
console.log("参数2"+number)
console.log("参数3"+money)
</script>
   
   
   <!-- 表二是查询结果显示出来的表 -->
   <table border = "1" class="table2" style="margin-left:220px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="checkall" id="checkall"></th>
                <th style="width:200px;height:38px;font-size:22px;">药品号码</th>
                <th style="width:200px;height:38px;font-size:22px;">产品名称</th>
                <th style="width:200px;height:38px;font-size:22px;">公司名称</th>
                <th>数量</th>
                <th >价钱</th>
     
                <th style="width:180px;height:38px;font-size:22px;">操作</th>
             </tr>
        </thead>
        <%
String url2 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con2 = null;
Statement stmt2=null;
String tname = (String)session.getAttribute("tname");
String number = (String)session.getAttribute("number");
String money = (String)session.getAttribute("money");
//String query2="SELECT top 10 * FROM 用户表2 order by 身份证号";
String sql1  = "SELECT top 5 * FROM 药品表 where 1=1";

if(tname!=""&&number==""&&money=="") {
	 sql1=sql1 + "and 产品名称  like concat('%','"+tname+"','%')";}  
else if(tname==""&&number!=""&&money==""){
	sql1=sql1 + "and 数量=CONVERT(nvarchar,'"+number+"')";}
else if(tname==""&&number==""&&money!=""){
	sql1=sql1 + "and 价钱=CONVERT(nvarchar,'"+money+"')";}
else if(tname!=""&& number!=""&&money==""){
	sql1=sql1 + "and 产品名称  like concat('%','"+tname+"','%') and 数量=CONVERT(nvarchar,'"+number+"')";}
else if(tname!=""&&number==""&& money!=""){
	sql1=sql1 + "and 产品名称  like concat('%','"+tname+"','%') and 价钱=CONVERT(nvarchar,'"+money+"')";}
else if(tname==""&& number!=""&& money!=""){
	sql1=sql1 + "and 数量=CONVERT(nvarchar,'"+number+"') and 价钱=CONVERT(nvarchar,'"+money+"')";}
else if( tname!=""&&number!=""&& money!=""){
	sql1=sql1 + "and 产品名称  like concat('%','"+tname+"','%') and 数量=CONVERT(nvarchar,'"+number+"') and 价钱=CONVERT(nvarchar,'"+money+"')";
	}

String query2=sql1;
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
		String tid1= rs2.getString(1);
		String tname1 = rs2.getString(2);
		String gname1 = rs2.getString(3);
		String number1 = rs2.getString(4);
		String money1 = rs2.getString(5);
		%>
		<tbody>
		  <tr>
		<td><input type="checkbox" class="checkbox2"></td>
		<td><%=rs2.getString(1)%></td>
		<td><%=rs2.getString(2)%></td>
		<td><%=rs2.getString(3)%></td>
		<td><%=rs2.getString(4)%></td>
		<td><%=rs2.getString(5)%></td>
				<td><a href='modifyyp.jsp?tid=<%=tid1 %>' style="color:#0000EE;">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='' style="color:green;">删除</a></td>
		
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
String query3="SELECT * FROM 药品表 ";
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
        	var tname = document.querySelector("#tname");
        	var number = document.querySelector("#number");
        	var money = document.querySelector("#money");
        	//var pmoney = document.querySelector("#pmoney");
        	var chongzhi = document.querySelector(".chongzhi");
        	var paging = document.querySelector(".paging");
        	 
        	 var zhi = window.location.search;
        	 console.log(zhi);
        	 
        	 
        	anniu2.addEventListener('click',function(){
        		if(tname.value =="" && number.value =="" && money.value ==""){
            		alert("请输入要查询的条件！");
            	}else{
            		
            		document.querySelector("#form1").action="http://localhost:8080/guahao/selectyp.do";
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
			var  newUrl =  'http://localhost:8080/guahao/fyyp.do?key='+key;     //设置新提交地址
	         $( "#form2" ).attr( 'action' ,newUrl);     //通过jquery为action属性赋值
	         $( "#form2" ).submit();     //提交ID为myform的表单
		})
		 
	})
   
   </script>
</body>
</html>
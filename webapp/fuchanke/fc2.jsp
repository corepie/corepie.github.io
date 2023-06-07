<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>就诊单信息</title>
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
        <form  action="/guahao/outcall3.do" method="post">
        <div style="positon:relative;font-size: 16px;margin-top: 26px;line-height: 30px;color: #999;">
   
   
   
   
     <ul id="ul1">
     <li >医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生：<span id="ysname" >name</span></li>
     <li >科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室：<span id="keshi" >keshi</span></li>
     <li >诊&nbsp;&nbsp;查&nbsp;&nbsp;费：<span id="cost" >cost</span>元</li>
     <input id="ysname2" name="ys" type="hidden"/>
     <input id="keshi2" name="ks" type="hidden"/>
     <input id="cost2" name="huafei" type="hidden"/>
     <input id="username22" name="username2" type="hidden"/>
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
		//out.print("<ul><li>"+ygname4+"</li><li>"+ygkeshi+"</li><li>"+cost1+"元</li></ul>");
		out.println("<script>document.getElementById('ysname').innerHTML='"+ygname4+"';document.getElementById('keshi').innerHTML='"+ygkeshi+"';document.getElementById('cost').innerHTML='"+cost1+"';document.getElementById('ysname2').value=document.getElementById('ysname').innerHTML;document.getElementById('keshi2').value=document.getElementById('keshi').innerHTML;document.getElementById('cost2').value=document.getElementById('cost').innerHTML;</script>");
	
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
     <li style="list-style-type:none">就&nbsp;&nbsp;诊&nbsp;&nbsp;人：<span id="username2" >username2</span></li>
     <input id="sfid" name="sfid" type="hidden"/>
     <%
     String url3 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
     Connection con3 = null;
     Statement stmt3=null;
     String id = (String)request.getSession().getAttribute("id");
     //System.out.println("用户输入的用户名:"+nkname);检测
String query3="SELECT * FROM 用户表2 where 身份证号 = '"+id+"'";
try{
	//加载jdbc驱动程序
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//建立连接
		con=DriverManager.getConnection(url3,"sa","202005317");
		//创建Statement语句
		stmt3=con.createStatement();
		//执行SQL语句
		ResultSet rs3=stmt3.executeQuery(query3);
		while (rs3.next()){
			String username1 = rs3.getString(1);
			//out.println("<script>console.log('id:'"+id+"';name:'"+rs3.getString(1)+"')</script>");
		//out.print("<ul><li>"+ygname4+"</li><li>"+ygkeshi+"</li><li>"+cost1+"元</li></ul>");
		out.println("<script>document.getElementById('sfid').value='"+id+"';document.getElementById('username2').innerHTML='"+username1+"';document.getElementById('username22').value=document.getElementById('username2').innerHTML;</script>");
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


     
     <li style="list-style-type:none">就诊日期：
     	<input id="EntryDate" name="EntryDate" type="date" max="" min=""/>
     </li>
     
      <li style="margin-top: 5px;list-style-type:none">就诊时间：
     	<input id="EntryTime" name="EntryTime" type="time" max="16:30" min="08:30"/>
     </li>
     <script>
     	function ft1(){
     		var time = new Date()
            var year = time.getFullYear()
            var month = time.getMonth()+1
            if(month < 10) month = '0' + month
            var day = time.getDate()
            if(day < 10) day = '0' + day
            var week = time.getDay()
            switch(week){
            case 0:  week = '日'
            break
            case 1:  week = '一'
            break
            case 2:  week = '二'
            break
            case 3:  week = '三'
            break
            case 4:  week = '四'
            break
            case 5:  week = '五'
            break
            case 6:  week = '六'
            break
            }

			var hours = time.getHours()
			if(hours < 10) hours = '0' + hours
			var minutes = time.getMinutes()
			if(minutes < 10) minutes = '0' + minutes
			var seconds = time.getSeconds()
			if(seconds < 10) seconds = '0' + seconds
			var haomiao = time.getMilliseconds()
			if(haomiao < 10) {
				haomiao = '00' + haomiao
			}else if(haomiao >= 10 && haomiao < 100){
				haomiao = '0' + haomiao
			}
			var date1 = document.querySelector("#EntryDate")
			var time1 = document.querySelector("#EntryTime")
			date1.value=year+"-"+month+"-"+day
			time1.value=hours+":"+minutes
     	}
     	ft1()
     	
     	
     	//限制选择的时间
     	var dateRange = document.querySelector("#EntryDate");
       var date_now = new Date().getTime();
       var date_end = new Date(date_now + 604800000); //end时间戳加一周毫秒数,并转化为日期格式
       var date_now = new Date(date_now + 25200000);//now时间戳设为12小时之后
 
    //输入date日期格式，转化为现在日期型格式的时间函数
    function to_YY_MM_DD(date) {
        let year = date.getFullYear();
        let month = date.getMonth() + 1;
        let day = date.getDate();
        //补0
        month = (month < 10) ? '0' + month : month;
        day = (day < 10) ? '0' + day : day;
        return year + '-' + month + '-' + day;
 
    }
 
    var max = to_YY_MM_DD(date_end);
    var min = to_YY_MM_DD(date_now);
 
    dateRange.setAttribute("max", max);
    dateRange.setAttribute("min", min);
     </script>
   
     
   </ul>

<div class="img1"></div>
<style>
.img1{
/*
	border: 1px solid red;*/
	width: 150px;
	height: 170px;
	position:absolute;
	top: 119px;
	right:41px;
	background:url(../images/touxiang.jpg);
	background-size: 100% 100%;
}
</style>

        </div>
        
        <!-- 按钮 -->
        <input style="display: block;
        background: #008f00;
        color: #FFF;
        text-align: center;
        font-weight: bold;
        font-size: 19px;
        line-height: 60px;
        margin:0 auto;
        border:1px solid white;
        margin-top: 45px;
        border-radius: 25px;
        width: 50%;"
        type="submit"; value="确定支付">
        
        <!-- 点击支付是判断是否金额是否足够，然后作出相应的提示 -->
       <!--  <script>
             window.onload = function(){
            	 var aa1 = document.getElementById("cost");   //获取诊查费的元素 
            	 var aa2 = document.getElementsByName("a");   //获取用户的账户金额元素 
            	 
             }
             console.log(aa1);
        </script> -->
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
        cursor:default;
        " onclick="
        javascript:document.querySelector('#winmsg').remove()">返回</a></form>
    
    
    
    <!-- 这里显示的是弹窗下面的背景 -->
   <table border = "1" class="table1">
  <thead>
   <tr>
<th>姓名</th>
<th>性别</th>
<th>职称</th>
<th>出诊费用</th>
<th>余号</th>
<th>操作</th>
</tr>
</thead>
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
				+"</td>");%>
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
        
    </div>
</div>
       
     
     </table>   
  </div>
</div>
<style>
#ul1{
/*
	border: 1px solid red;*/
	width: 250px;
}
</style>
</body>
</html>
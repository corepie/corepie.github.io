<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>财务数据</title>
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
        <li><a href="http://localhost:8080/guahao/administrator/menzhen/menzhen.jsp">门诊管理</a><span>&gt;</span></li>
        <img src="../../images/yisheng.png">
        <li><a href="http://localhost:8080/guahao/administrator/yisheng/yisheng.jsp">医生管理</a><span>&gt;</span></li>
        <img src="../../images/yonghu11.png">
        <li><a href="http://localhost:8080/guahao/administrator/patient/patient.jsp">用户管理</a><span>&gt;</span></li>
        <img src="../../images/jinqian.png">
        <li class="active"><a href="http://localhost:8080/guahao/administrator/caiwu/caiwu.jsp">财务管理</a><span>&gt;</span></li>
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

			<br>时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间：
			<input id="ctime" name="ctime" type="date" style="color:#ccc;">
			<br>来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源：
			<select id="cw" name="cw" style="width:200px;height:36px;font-size:24px;margin-top:3px;">
			    <option value=""></option>
			    <option value="chong">充值</option>
			    <option value="cannel">取消预约</option>
			</select>
			<br>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
			<input id="pname" name="pname" type="text"/>
			<br>
			
			<input id="select" type="submit" value="查询" class="anniu2" style="position:absolute;top:85%;left:102%"/>
			
		     </form>
		     
		     <a href="" class="chongzhi" style="position:absolute;top:85%;left:137%">重置</a>
		     
		  
		   </div>
    <table border = "1" class="table" style="margin-left:160px;">
		 <thead>
             <tr>
                <th style="width:60px;height:38px;"><input type="checkbox" name="all" class="checkall"></th>
                <th style="width:180px;height:38px;font-size:22px;">流水号</th>
                <th style="width:200px;height:38px;font-size:22px;">时间</th>
                <th>金额</th>
                <th>来源</th>
                <th style="width:180px;height:38px;font-size:22px;">身份证号</th>
                <th>姓名</th>
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
	query="SELECT top " + n + "* FROM 明细表 order by 流水号";
}else{
	int x = n*num;
	query= "select top " + n + " * from 明细表 where 流水号 not in (select top "+x+" 流水号 from 明细表 order by 流水号)";
}
//String query="SELECT top 10 * FROM 明细表 order by 身份证号";
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
		String cid = rs.getString(1);
		String datetime = rs.getString(2);
		String money = rs.getString(3);
		String laiyuan = rs.getString(4);
		String userid = rs.getString(5);
		String username = rs.getString(6);
		
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
		
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://localhost:8080/guahao/delcaiwu.do?cid=<%=cid %>' style="color:green;">删除</a></td>
		
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
   <div class="paging" style="position:absolute;top:90%;left:28%;display:block;">
     <form action="" method="post" id="form2" name="form2">
       <ul>
         
       </ul>
     </form>
   </div>    
   
   <%
String url3 = "jdbc:sqlserver://LAPTOP-JKM27058:10086;DatabaseName=yiyuan";
Connection con3 = null;
Statement stmt3=null;
String query3="SELECT * FROM 明细表";
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
			var  newUrl =  'http://localhost:8080/guahao/yfcw.do?key='+key;     //设置新提交地址
	         $( "#form2" ).attr( 'action' ,newUrl);     //通过jquery为action属性赋值
	         $( "#form2" ).submit();     //提交ID为myform的表单
		})
		 
	})
   
   </script>
</body>
</html>
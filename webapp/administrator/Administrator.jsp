<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="shortcut icon" href="../yiyuan.ico" />   <!-- 页面图标 -->
<style>
* {
    margin:0;
    padding:0;
}
.msg {
    display:none;
    height: 68px;
    text-align: center;
    line-height: 68px;
    color:red;
    font-size:20px;
}
a {
    text-decoration: none;
    position:absolute;
    bottom:30px;
    right:49px;
    font-size:19px;
}
.login{
    position:relative;
    left:0;
    top:0;
    width:466px;
    height:591px;
    margin:160px auto;
    background-color:pink;
    border-radius: 15px;
}
.header{
    font-size: 38px;
    font-weight: bold;
    text-align: center;
    line-height: 200px;
}
.login input{
    display: block;
    width: 316px;
    margin-left:84px;
    margin-bottom: 35px;
    border: 0;
    padding: 10px;
    border-bottom: 1px solid rgb(128, 125, 125);
    font-size: 15px;
    outline: none;
    font-size:20px;
}
.btn{
    text-align: center;
    margin-left:38px;
    border: none;
    height: 60px;
    width: 391px;
    background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size:22px;
}
.login img{
    position:relative;
    left:15px;
    top:40px;;
}
    </style>

</head>
<body>
         <!-- 创建幕布 -->
<div id="winmsg" style="
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background: rgba(35,109,201,0.3);
z-index: 99999;">
          <div class="login">
            <div class="header">管理员登录</div>
            <img src="../images/8c58651eb526de61952b6cc96b30c1f2.png">
                <input type="text" name="账号" id="username" style="margin-bottom: -12px;">
            <img src="../images/c9748ad1d79f1ac7bbed2c1d0ed83215.png">
                <input type="password" name="密码" id="pdw">
                <button class="btn" onclick="login()">登录</button>
                <!-- 错误信息提示区 -->
            <div class="msg" style="" id="msg"></div>
            <a href="../login/login.jsp">返回</a>
                </div>

            </div>
               

        <script>
        
       
     	 function login(){
     		var msg = document.querySelector("#msg");
            var username = document.querySelector("#username");
            var password = document.querySelector("#pdw");
            
            if(username.value == ""){
            	msg.style.display = 'block';
            	msg.innerHTML = '用户名不能为空';
            	return;
            }
            
            if(password.value == ""){
            	msg.style.display = 'block';
            	msg.innerHTML = '密码不能为空';
            	return;
            	
            }
            //administrator
            if(username.value=="11" && password.value=="123456"){
        		msg.style.display = "block";
        		msg.innerText = "登录成功";
        		msg.style.color = "green";
        		setTimeout(function(){
        			//延迟1秒跳转
        			//用js跳转
            		window.location.href="index.jsp";
            		//window.open("yemian.jsp","_blank");  //在另外新建窗口中打开窗口
        		},3000)
        		
        	}else{//否则
        		msg.innerHTML = "用户名或密码错误";
        	}
            
     	 }
    
     	
	 	
   

       
    </script>
</body>
</html>
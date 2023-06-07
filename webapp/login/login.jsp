<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>

<style>
    .form1 #eye{
     position:absolute;
     top:47%;
     left:0;
    }
</style>
     <link rel="stylesheet" type="text/css" href="change.css">
      <script src="change.js"></script>
</head>
<body>
      <div class="control">
      <div class="item">
      <div>登录</div>
      <div>注册</div>
      
      </div>
      <div class="content">
         <div class="hehe">
         <form action="/guahao/login" method="post" class="form1">
           <p>账号</p>
           <input type="text" name="username1" placeholder="username"/>
            <p>密码</p>
            <label>
           <input type="password" name="password1" placeholder="password" id="password"/>
           
               <img src ="../images/biyan.jpg" id="eye"></label>
               
           <br/>
           <input type="submit" value="登录"/>
           
           </form>
           <a href="../administrator/Administrator.jsp" class="pp">管理员登录</a>
         </div>
         <script>
            var eye = document.getElementById('eye');
            var pwd = document.getElementById('password');
            //绑定事件,点了一次后flag要变换
            var flag = 0;
            eye.onclick = function(){
            	if(flag ==0){
            	pwd.type = 'text';
            	eye.src ='../images/zy.jpg'; 
            	flag = 1;
            	}else{
            		pwd.type = 'password';
            		eye.src ='../images/biyan.jpg'; 
            		flag = 0;
            	}
            }
         </script>
         
         <div>
         <form action="/guahao/register.do" method="post">
           <p>身份证号</p>
           <input type="text" id="id" name="id2" placeholder=" id"/>
           <br/>
           <p>用户名</p>
           <input type="text" id="userid" name="username2" placeholder="username"/>
            <p>密码</p>
           <input type="password" id="password" name="password2" placeholder="password" class="ipt"/>
           <p class="message">请输入6~16位数密码</p>
           
           
           <script>
               var ipt = document.querySelector('.ipt');
               var mes = document.querySelector('.message');
               //失去焦点
               ipt.onblur = function(){
            	      //根据表单里面值的长度
            	      if(this.value.length < 6 || this.value.length > 16){
            	    	  mes.className = 'message wrong';    //保留message类名
            	    	  mes.innerHTML = '您输入的位数不符合6~16位！';
            	      }else{
            	    	  mes.className = 'message right';    //保留message类名
            	    	  mes.innerHTML = '您输入正确！';
            	      }
               }
           </script>
           <input type="submit" value="注册"/>
           <style>
           	.Btn{
           	margin-top: 40px;
            width: 100%;
            height: 40px;
            border-radius: 5px;
            color: white;
            border: 1px solid #adadad;
            background: #00dd60;
            cursor: pointer;
            letter-spacing: 4px;
            margin-bottom: 40px;
            }
           	
           </style>
           
           </form>
          
         </div>
      </div>
    </div>
</body>
</html>
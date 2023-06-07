<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>页面</title>
<link rel="shortcut icon" href="../yiyuan.ico" />   <!-- 页面图标 -->
<link rel="stylesheet" type="text/css" href="css/frame.css">
</head>
<body>
  <!-- logo区 -->
    <div class="logo">
        <img src="../img/logo.png" />
        <a href="#">[退出]</a>
    </div>
    <!-- 菜单区 -->
    <div class="menu">
        <ul>
            <li class="index"></li>
            <li class="role"></li>
            <li class="admin"></li>
            <li class="fee"></li>
            <li class="account"></li>
            <li class="service"></li>
            <li class="bill"></li>
            <li class="report"></li>
            <li class="information"></li>
            <li class="password"></li>
        </ul>
    </div>
    <!-- 核心区 -->
    <div class="core">
        <!-- 渐变条：只需要预留空间即可，不需要单独分区 -->
        <!-- 内容区 -->
        <div class="content">
            <!-- 命令区 -->
            <div class="btn"></div>
            <!-- 数据区 -->
            <div class="data">
                <table>
                    <thead>
                        <tr>
                            <td><input type="checkbox" />全选</td>
                            <td>管理员ID</td>
                            <td>姓名</td>
                            <td>拥有角色</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>1</td>
                            <td>唐僧</td>
                            <td>和尚，师父，术士</td>
                            <td>
                                <input type="button" value="修改" class="update" />
                                <input type="button" value="删除" class="delete" />
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>2</td>
                            <td>悟空</td>
                            <td>猴王，大师兄，德鲁伊</td>
                            <td>
                                <input type="button" value="修改" class="update" />
                                <input type="button" value="删除" class="delete" />
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>3</td>
                            <td>八戒</td>
                            <td>元帅，二师兄，武器战</td>
                            <td>
                                <input type="button" value="修改" class="update" />
                                <input type="button" value="删除" class="delete" />
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>4</td>
                            <td>沙僧</td>
                            <td>大将，三师弟，小鸡</td>
                            <td>
                                <input type="button" value="修改" class="update" />
                                <input type="button" value="删除" class="delete" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 分页区 -->
            <div class="page"></div>
            <!-- 消息区 -->
            <div class="msg">
                <img src="../img/close.png" />
                <p>操作成功！</p>
            </div>
        </div>
    </div>
   
</body>
</html>
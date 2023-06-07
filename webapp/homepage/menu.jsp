<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>挂号系统</title>
<link rel="shortcut icon" href="../yiyuan.ico" />   <!-- 页面图标 -->
<style>
      *{
      margin:0;
      padding:0;
      }
   table{
   font:16px/28px 'Microsoft yahei';
   border: 1px solid green;
   }
   .h1{
   font-weight:400;
   text-align:center;
}
  #mz {

  border: solid #E56717; /*设置边框样式跟颜色*/
  margin: 5px auto; /*设置div居中*/
  width: 38px; /*设置div宽度*/
  height: 22px; /*设置div高度*/
  border-width: 2px; /*设置边框宽度*/
  color: #E56717; 
  padding:0 3px;
}
  .gray{
  color:#888888;
  font-size:12px;
  text-align:center;
  }
  p{
  text-indent:2em;
  }
  body{
    margin:auto 150px;
  }
  .container-fluid .biaoti{
     float:left;
     line-height:70px;
  }
   .container-fluid .wenzi{
     float:right;
     line-height:70px;
     margin-right:20px;
  }
  .container-fluid .wenzi a{
     text-decoration: none;
     color:#ccc;
  }
  .daohang{
     margin-top:2px;
     height:52px;
     
  }
     .nav li{
     float:left;
     display:block;
     height:30px;
     list-style:none;
     padding-top:12px;
     margin-right:3px;
  }
   .nav li a{
    display:block;
    text-decoration: none;
    font-size:15px;
    padding:0 30px;
    
  }
  .active{
       background-color:#337ab7 !important;
       border-radius:5px;
  }
  .active a{
       color:white;
  }
  .col-md-3{
    float:left;
     width:28%;
     margin-right:20px;
     height:450px;
     background-color:#FCFCFC;
  }
  .col-md-9{
     float:right;
    width:70%;
  }
  .nav-pills li{
     display:block;
     height:50px;
     list-style:none;
     padding-top:2px;
     margin-left:20px;
    }
    .nav-pills li a{
    display:block;
    text-decoration: none;
    font-size:16px;
    padding-left:10px;
    line-height:52px;
    
  }
   li:hover{
    background:#e0e0e0bd;
  }
  .active li:hover{
    display:none;
  }
</style>

</head>
<body>
<div class="container-fluid" style="height:70px;background-color:#1b6d85;">
  <h1 class="biaoti">医院挂号预约系统</h1>
  <h4 class="wenzi"><a href="../wode/tuichu.jsp">退出登录</a></h4>
</div>
<div class="daohang">
<ul class="nav">
  <li class="active"><a href="../homepage/menu.jsp">系统首页</a></li>
  <li ><a href="#">互联网医院</a></li>
  <li ><a href="../wode/w1.jsp">我的</a></li>
</ul>
</div>
   <div class="col-md-3" >
   <h2>挂号</h2><br>
   <ul class="nav-pills">
 <li class="active"><a href="../homepage/menu.jsp">主页</a></li>
  <li ><a href="../neike/neike.jsp">内科</a></li>
  <li ><a href="../waike/waike.jsp">外科</a></li>
  <li ><a href="../fuchanke/fuchanke.jsp">妇产、生殖科</a></li>
  <li ><a href="../erneike/erneike.jsp">儿内科</a></li>
  <li ><a href="../zhongyike/zhongyike.jsp">中医、康复科</a></li>
   </ul>
   </div>
  <div class="col-md-9" >
   <div class="container1">
   <table>
   <img src="../images/yiyuan.jpg" width="100%"><br>
   <h1 class="h1">桂林医学院附属医院</h1>
<div id="mz">三甲</div>  <br>
<div class="gray">桂林市秀峰区乐群路15号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
 <input type="text" placeholder="请输入查询条件"> <button>搜索</button>
</div><br>
<hr>
<h4>医院介绍</h4>
<p>桂林医学院附属医院创建于1958年5月，是一
所集医疗、教学、科研、预防、康复、急救为一体的
综合性三级甲等医院。医院是国家药物临床试验基
地、卫生部指定的国际紧急救援中心网络医院和国际
SOS急救中心、全国县级医院血液净化培训基地、首
批住院医师规范化培训基地、中国卒中中心联盟单
位、中国胸痛中心认证医院、广西临床病理质量控制
中心及桂林诊断中心、广西地中海贫血产前诊断分中
心等。目前，医院实际开放床位1600多张，在职职
工近2600人。2017年，年门急诊量175.8万余人次，
出院6.7万余人次，手术2.7万余台次。</p>

<p>近几年来，通过“科技兴院，人才强院”战略的实
施，医院凝聚了大批优秀的高精尖人才，拥有正高职
称140余人、副高级职称362人，二级教授2人，医学
博士80余人，广西新世纪十百千人才工程第二层次人
选1人，广西高校引进海外高层次人才“百人计划”1
人，广西“卓越学者”1人,广西优秀专家1人，桂林市
漓江学者1人，广西高校人才小高地创新团队1个。
90余人次担任自治区级以上各个专业学会的副主任及
以上委员，1人获国家特殊津贴专家荣誉。</p>
<p>2006年医院获硕士学位授予权，现有硕士生导
师100多人，19个硕士培养点。2014年获准增列为
“博士学位授予立项建设单位”，目前有10位教授当选
中南大学临床医学博士研究生指导教师，具有独立招
收和指导博士研究生的资格。2015年获批设立博士后科研工作站，将进一步提高我院科技开发和创新能
力，为吸引、培育、留住一批高层次的医学人才提供
了一个更高层次、更大空间的平台。近三年来，医院
获各类科研项目467项，其中国家级课题立项50项
(国自然重点项目1项)、省级科研项目76项、厅局
级科研项目334项。获省级科技进步奖6项，其中二
等奖2项、三等奖4项，获厅局级科技奖27项，医院
在科学研究和技术创新领域有了更深厚的基础和沉
淀。</p>
<p>医院设有44个临床专业科室，9个医技科室，58个专科、专病门诊，18个临床教研室，1个康复系；
拥有国家中医药科研二级实验室1个，省级重点实验
室2个，广西高校重点实验室1个，广西高校重点实验
室培养基地1个，广西高校协同创新中心1个，广西卫
生计生委重点学科1个、重点建设学科2个，广西教育
厅重点学科2个、优势特色重点学科2个，省级临床重
点专科12个（肾内科、儿内科、重症医学科、急诊
科、神经内科、神经外科、麻醉科、临床护理、消化
内科、产科、内分泌科、妇科)；是广西住院医师/
专科医师培训基地。医院以高起点、高标准、高要求
建立的核医学科被树立为广西核医学科建设的标杆示
范单位。</p>
<p>医院设备先进，拥有美国GE256排CT、血管造
影机、西门子30T核磁共振、瓦里安直线加速器、西
门子Symbia T16型SPECT/CT等大型监测、诊断、治
疗仪器。目前医院已建立以HIS为中心的电子病历系
统、无线查房系统、手术麻醉及重症监护系统、
PACS系统和LIS系统，为早诊断、早治疗提供强有力的支持。
近年来，无痛人流、无痛分娩等)、产前诊断技术、辅助生殖技
术、人工耳蜗植入技术、自体造血干细胞移植技术、
皮肤疾病的激光治疗技术等几十项新技术。目前，我
院已成功进行肝、肾移植几十余例，在广西位于前
列，得到国家及自治区卫计委和市红十字会的充分肯
定和高度评价。</p>
<p>医院共有护理人员1100余人，拥有高级职称71
人。各科室在夯实基础护理的同时，努力加大护理人
才建设，提升专科护理水平，使护理向专业化、个性
化、精细化、人性化发展。医院先后成为广西ICU专
业护士临床培训基地、急诊急救专科护士临床培训基
地、广西糖尿病专科护士临床培训基地、消毒供应中
心消毒员上岗资质培训基地（广西唯一一家），曾荣
获全国“优质护理服务表现突出的病房”、自治区“优
质护理服务先进单位”等称号。
依托医院的学术优势和教学资源，通过实施早
期接触临床、强化实践教学环节、强化临床技能培训
等多项有效举措，临床医学院在人才培养、专业建设
和教学改革方面取得了丰硕的成果。2011至2017
年，临床医学院连续六次次组队参加了全国高等医学
院校大学生临床技能竞赛，分别取得了全国总决赛二
等奖2次、三等奖3次和华南赛区特等奖2次、一等奖
2次的好成绩。</p>
<p>弘德善医，拯护苍生。医院将始终坚持“以人为
本、爱心济世、以客为尊、百姓放心”的服务理念，
以一流的技术促进发展，以科学的管理开拓创新，以
优质的服务赢得信誉，为创建一流的现代化医院而奋
斗。</p>

  </table>
  </div>
</div>
</body>
</html>
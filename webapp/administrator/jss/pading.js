$(function(){
	x = rowCount2;
	y = n;
	//console.log("行数是："+x);
	//console.log("展示:"+y);
	var num = Math.ceil(x/y);
	console.log("页数是:"+num);
	
	for(var i = 0;i<num;i++){
		var zhi = $("<input type='submit' name='fenye' value='"+i+"'>");
		console.log(zhi);
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
		var  newUrl =  'http://localhost:8080/guahao/fymz.do?key='+key;     //设置新提交地址
         $( "#form2" ).attr( 'action' ,newUrl);     //通过jquery为action属性赋值
         $( "#form2" ).submit();     //提交ID为myform的表单
	})
	 
})
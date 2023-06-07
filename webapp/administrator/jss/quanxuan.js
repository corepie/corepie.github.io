$(function(){
	//全选与全不选
	console.log($(".table tbody").length);
	$(".checkall").change(function(){
		//$(this).prop("checked");
		//console.log($(".table tbody tr td:first"));
		for(var i = 0;i<$(".table tbody").length;i++){
			$(".table tbody tr td input").prop("checked",$(this).prop("checked"));
		}
		
	})
	
	//下面的复选框选中则上面的会勾选
	for(var i = 0;i<$(".table tbody").length;i++){
			$(".table tbody tr td input").change(function(){
				//$(".table tbody tr td input:checked").length 是所有小复选框的个数
				if($(".table tbody tr td input:checked").length ==$(".table tbody").length){
					$(".checkall").prop("checked",true);
				}else{
					$(".checkall").prop("checked",false);
				}
			})
		}
})
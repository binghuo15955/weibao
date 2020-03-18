<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.2</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<link rel="stylesheet" href="css/address.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script type="text/javascript" src="./js/xcity.js"></script>
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<style>
#myhistory .layui-col-md2{
font-size: 18px;
}

.secondrow{
   margin-top: 15px;
}

#go{
    width: 155px;
    height: 51px;
    font-size: 18px;
    }
    
#divbtn{
    line-height: 108px;
    padding-left: 39px;
    padding-top: 7px;
    }
</style>

<body style="background: white;">
	<div id="header">我的足迹</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="row comment-container"
					style="overflow: auto; width: 993px;; overflow-x: hidden;">
					<ul class="flow-default" style="height: 500px;" id="myhistory"></ul>
				</div>
		</div>
	</div>
</body>
<script>
layui.use('flow',function() {
			var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
			var flow = layui.flow,layer=layui.layer;
			flow.load({elem : '#myhistory', //指定列表容器
						done : function(page, next) { //到达临界点（默认滚动触发），触发下一页
							var lis = [];
							$.ajax({
										url : "/weibao/history/getByUid",
										type : "post",
										async : false,
										data : {
											"page" : page,
											"limit" : "5"
										},
										success : function(res) {
											var jsonObj = JSON.parse(res);
											console.log("返回的history数据:",jsonObj)
											var histories = jsonObj.histories;
											console.log("histories:",histories)

											//假设你的列表返回在data集合中
											layui.each(histories,function(index,item) {
																var time_arr = item.time.split('T');
																var src="images/no-picture.png"
																if(item.picurl!=null&&item.picurl!=''){
																	src=item.picurl.split("webapp\\")[1];
																}
																lis.push('<div class="layui-col-md12" style="border: 1px solid lightgray; padding: 10px;margin-bottom:10px">				<div class="layui-col-md3">					<img src="'+src+'" alt="image" style="width: 200px;    height: 200px;">				</div>				<div class="layui-col-md2">					<label>商品名称</label><br> 					<div class="secondrow">'+item.name+'</div> 					</div>				<div class="layui-col-md2">					<label>商品价格</label> <br> 					<div class="secondrow">￥'+item.price+'.00</div>				</div>				<div class="layui-col-md2">					<label>上次浏览时间</label> <br> 					<div class="secondrow">'+time_arr[0]+' '+time_arr[1]+'</div>				</div>				<div class="layui-col-md1">				</div>				<div class="layui-col-md2" id="divbtn">					<button class="layui-btn layui-btn-radius layui-btn-danger" id="go" onclick="goto_product('+item.pid+','+item.seller_id+')">立即前往GO!</button>				</div>			</div>');
															});

											//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
											//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
											next(lis.join(''),page < jsonObj.pages);

											console.log("再次获取全部histories成功！")
										},
										error : function(res) {
											$('#histories').html('你还没有记录')
											console.log("再次获取全部histories失败！")
										}
									})

						}
					});
			
		});
function goto_product(pid,seller_id){
	parent.location.href="shop-single.jsp?id="+pid+"&uid="+seller_id
}
		
</script>
</html>

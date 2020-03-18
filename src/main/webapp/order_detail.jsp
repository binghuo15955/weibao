<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.2</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<link rel="stylesheet" href="css/record_detail.css">
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<style>
.x-admin-sm .layui-inline {
	margin-bottom: 10px;
}
.x-admin-sm input{
    font-size: 15px;
    width: 282px;
    border: 0;
    border-bottom: 2px solid lightgrey;
}
.x-admin-sm label
{
font-size: 15px;
}
</style>
<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<form class="layui-form layui-form-pane" lay-filter="record" id="detail_form">
				<div class="layui-inline layui-show-xs-block" style="text-align: center">
					<div class="layui-input-inline">
						<img alt="image" src="" name="p_pictrue" id="p_pictrue"
							style="width: 200px; height: 200px;" />
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="employeeNum" class="layui-form-label label-define">
						<span class="x-red">*</span>订单号
					</label>
					<div class="layui-input-inline">
						<input type="text" id="oid" name="oid" lay-verify=""
							placeholder="" autocomplete="off" class="layui-input"
							disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="employeeNum" class="layui-form-label label-define">
						<span class="x-red">*</span>订单时间
					</label>
					<div class="layui-input-inline">
						<input type="text" id="time" name="time" lay-verify=""
							placeholder="" autocomplete="off" class="layui-input"
							disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="employeeNum" class="layui-form-label label-define">
						<span class="x-red">*</span>收货地址
					</label>
					<div class="layui-input-inline">
						<input type="text" id="address" name="address" lay-verify=""
							placeholder="" autocomplete="off" class="layui-input"
							disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>订单状态
					</label>
					<div class="layui-input-inline">
						<input type="text" id="status" name="status" autocomplete="off"
							class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>电话号码
					</label>
					<div class="layui-input-inline">
						<input type="text" id="telephone" name="telephone"
							autocomplete="off" class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>订单类型
					</label>
					<div class="layui-input-inline">
						<input type="text" id="category" name="category"
							autocomplete="off" class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>商品名称
					</label>
					<div class="layui-input-inline">
						<input type="text" id="p_name" name="p_name" autocomplete="off"
							class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>单价
					</label>
					<div class="layui-input-inline">
						<input type="text" id="price" name="price" autocomplete="off"
							class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>数量
					</label>
					<div class="layui-input-inline">
						<input type="text" id="quantity" name="quantity"
							autocomplete="off" class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>运费
					</label>
					<div class="layui-input-inline">
						<input type="text" id="delivery" name="delivery"
							autocomplete="off" class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>总价
					</label>
					<div class="layui-input-inline">
						<input type="text" id="total" name="total" autocomplete="off"
							class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define">
						<span class="x-red">*</span>卖家名称
					</label>
					<div class="layui-input-inline">
						<input type="text" id="seller_name" name="seller_name"
							autocomplete="off" class="layui-input" disabled="true">
					</div>
				</div>
				<div class="layui-inline layui-show-xs-block">
					<label for="account" class="layui-form-label label-define"
						style="width: 120px"> <span class="x-red">*</span>收货人名称
					</label>
					<div class="layui-input-inline">
						<input type="text" id="buyer_name" name="buyer_name"
							autocomplete="off" class="layui-input" disabled="true">
					</div>
				</div>
				<hr>
				<div class="layui-form-item" id="btn">
					<button class="layui-btn layui-btn-danger layui-btn-radius"
						lay-filter="add" lay-submit id="close-btn"
						style="height: 45px; width: 134px; font-size: 16px;">点击关闭</button>
				</div>
			</form>
		</div>
	</div>
	</div>

	<script>
		function getRequest() {
			var url = location.search; //获取url中"?"符后的字串
			var theRequest = new Object();
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				for (var i = 0; i < strs.length; i++) {
					theRequest[strs[i].split("=")[0]] = unescape(strs[i]
							.split("=")[1]);
				}
			}
			return theRequest;
		}

		layui.use([ 'form', 'layer', 'jquery', 'laydate' ], function() {
			var $ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			var request = getRequest();

			console.log(request)
			$(function() {
				$.ajax({
					url : "/weibao/order/getbyoid",
					type : 'post',//method请求方式，get或者post
					data : request,
					async : false,
					success : function(res) {//res为相应体,function为回调函数
						console.log("getbyid返回体" + res)
						var json = JSON.parse(res).data;
						$('#p_pictrue').attr('src', json.p_pictrue);
						form.val("record", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
							"oid" : json.oid,
							"time" : json.time.split("T")[0]+" "+json.time.split("T")[1],
							"p_name" : json.p_name,
							"category" : json.category,
							"status" : json.status,
							"price" : json.price,
							"quantity" : json.quantity,
							"address" : json.address,
							"total" : json.total,
							"delivery" : json.delivery,
							"telephone" : json.telephone,
							"buyer_name" : json.buyer_name,
							"seller_name" : json.seller_name
						});
					},
					error : function(error) {
						console.log(error)
						layer.alert('操作失败！！！', {
							icon : 5
						});
					}
				})

			})

			form.on('submit()', function(data) {
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);//关闭当前页
			})

		});
	</script>
</body>

</html>

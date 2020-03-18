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

<body style="background: white;">
	<div id="header">收货地址</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card-body ">
					<form class="layui-form layui-col-md12  layui-form-pane"
						lay-filter="edit">
						<input type="hidden" name="aid"
							value="<%=request.getParameter("aid")%>">
						<div class="layui-form-item x-city" id="start">
							<label class="layui-form-label"><span class="x-red">*</span>地址信息：</label>
							<div class="layui-input-inline">
								<select name="province" lay-filter="province" id="province" lay-search
									lay-verify="required">
									<option value="">请选择省</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<select name="city" lay-filter="city" lay-verify="required" id="city" lay-search>
									<option value="">请选择市</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<select name="area" lay-filter="area" lay-verify="required" id="area" lay-search>
									<option value="">请选择县/区</option>
								</select>
							</div>
						</div>
						<div>
							<label class="layui-form-label"><span class="x-red">*</span>详细地址：</label>
							<div class="layui-input-inline">
								<input type="text" id="detail" name="detail"
									lay-verify="required" class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label">邮政编码：</label>
							<div class="layui-input-inline">
								<input type="text" id="postcode" name="postcode"
									class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label"><span
								class="x-red">*</span>收货人姓名：</label>
							<div class="layui-input-inline">
								<input type="text" id="receive_name" name="receive_name"
									lay-verify="required" required=""
									class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label"><span
								class="x-red">*</span>手机号码：</label>
							<div class="layui-input-inline">
								<input type="text" id="telephone" name="telephone" required=""
									lay-verify="required" class="layui-input wider-input">
							</div>
							<br>
							<div class="layui-input-inline">
								<button lay-filter="upt" lay-submit
									class="layui-btn layui-btn-normal layui-btn-lg">保存修改</button>
							</div>
						</div>
					</form>
				</div>
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

		layui.use([ 'laydate', 'form', 'table', 'jquery', 'laypage', 'layer' ],
				function() {
					var laydate = layui.laydate;
					var form = layui.form;
					var table = layui.table;
					var $ = layui.jquery;
					var laypage = layui.laypage, layer = layui.layer;
					var request = getRequest();

					console.log("接收到的aid:", request)
					$(function() {
						$.ajax({
							url : "/weibao/address/getbyid",
							type : "post",
							async : false,
							data : request,
							dataType : "json",
							success : function(res) {
								var data = res.data;
								console.log(res.data)
								var list = res.data.address.split("-");
								form.val("edit", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
									"detail" : data.detail,
									"postcode" : data.postcode,
									"receive_name" : data.receive_name,
									"telephone" : data.telephone
								});
								var province_select='dd[lay-value=' + list[0] + ']';
								var city_select='dd[lay-value=' +  list[1] + ']';
								var area_select='dd[lay-value=' +  list[2] + ']';
								$('#province').siblings("div.layui-form-select").find('dl').find(province_select).click();
								$('#city').siblings("div.layui-form-select").find('dl').find(city_select).click();
								$('#area').siblings("div.layui-form-select").find('dl').find(area_select).click();
								form.render();
							}
						});
						//给表单赋值
					})

					//layui表格重载：点击查询的时候触发、条件搜索
					//form.render();
					form.on('submit(upt)', function(data) {
						layer.confirm("确定保存修改吗?", {
							icon : 3,
							title : '确定保存修改吗?'
						}, function(index) {
							var param = data.field;
							console.log("发送到server端的数据:", JSON.stringify(param))
							$.ajax({
								url : "/weibao/address/update",
								type : "post",
								async : false,
								data : param,
								success : function(res) {
									console.log("修改address成功")
									layer.msg("修改成功",{icon:1,time:700},function(){
										 var index = parent.layer.getFrameIndex(window.name);  
										    parent.layer.close(index);//关闭当前页
									})
								},
								error : function() {
									console.log("修改失败")
									parent.layer.msg("添加失败,请重试！", {
										icon : 5
									})
								}
							})
						})
						return false;
					})

					form.verify({
						required : function(value, item) { //value：表单的值、item：表单的DOM对象
							console.log(value)
							if (value == null || "" == value) {
								parent.layer.msg("必填项不能为空", {
									icon : 5
								})
								return "必填项不能为空";
							}
						},
					})

				});
	</script>
	<script>
		layui.use([ 'form', 'code' ], function() {
			form = layui.form;
			layui.code();

			$('#start').xcity();

		});
	</script>
</body>
</html>

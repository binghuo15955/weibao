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
					<form class="layui-form layui-col-md12  layui-form-pane">
						<div class="layui-form-item x-city" id="start">
							<label class="layui-form-label"><span class="x-red">*</span>地址信息：</label>
							<div class="layui-input-inline">
								<select name="province" lay-filter="province" lay-verify="required">
									<option value="">请选择省</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<select name="city" lay-filter="city" lay-verify="required">
									<option value="">请选择市</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<select name="area" lay-filter="area" lay-verify="required">
									<option value="">请选择县/区</option>
								</select>
							</div>
						</div>
						<div>
							<label class="layui-form-label"><span class="x-red">*</span>详细地址：</label>
							<div class="layui-input-inline">
								<input type="text" id="detail" name="detail" lay-verify="required"
									class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label">邮政编码：</label>
							<div class="layui-input-inline">
								<input type="text" id="postcode" name="postcode" lay-verify="postcode"
									class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label"><span
								class="x-red">*</span>收货人姓名：</label>
							<div class="layui-input-inline">
								<input type="text" id="receive_name" name="receive_name" lay-verify="required"
									required="" class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label"><span
								class="x-red">*</span>手机号码：</label>
							<div class="layui-input-inline">
								<input type="text" id="telephone" name="telephone" required="" lay-verify="required|phone"
									class="layui-input wider-input">
							</div>
							<br>
							<div class="layui-input-inline">
								<button lay-filter="add" lay-submit=""
									class="layui-btn layui-btn-normal layui-btn-lg">保存</button>&emsp;(最多添加20个)
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="layui-card-body layui-table-body layui-table-main">
			<table class="layui-table layui-form" id="showAddress" lay-filter="address"></table>
		</div>
	</div>
	<script>
		layui.use([ 'laydate', 'form', 'table', 'jquery', 'laypage', 'layer' ],
				function() {
					var laydate = layui.laydate;
					var form = layui.form;
					var table = layui.table;
					var $ = layui.jquery;
					var laypage = layui.laypage, layer = layui.layer
					
					
					
					table.on('tool', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
						var data = obj.data; //获得当前行数据
						var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
						var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
						console.log("选择的行id:",data.aid)
						if (layEvent === 'del') { //删除
							parent.layer.confirm('确认删除吗？', function(index) {
								obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
								layer.close(index);
								//向服务端发送删除指令
								$.ajax({
									url : "/weibao/address/del",
									type : 'post',//method请求方式，get或者post
									data : data,
									dataType : "text",
									async : false,
									success : function(data) {//res为相应体,function为回调函数
										if (data == "success") {
											parent.layer.msg('已删除!', {
												icon : 1,
												time : 1000
											});
										} else {
											parent.layer.alert(data.msg, {
												icon : 5
											});
											console.log("failed")
										}
									},
									error : function(error) {
										console.log(error)
										parent.layer.alert('操作失败！！！', {
											icon : 5
										});
									}
								});
							});
						} else if (layEvent === 'edit') { //编辑
							parent.xadmin.open('修改地址信息',
									'./address-edit.jsp?aid='
											+ data.aid, '', '',false)
						}else if(layEvent==='set_default'){//设置默认值
							console.log(tr)
							$.ajax({
								url:"/weibao/address/set_default",
								async:false,
								type:"post",
								data:{"aid":data.aid},
								success : function(data) {//res为相应体,function为回调函数
									if (data == "success") {
										parent.layer.msg('设置成功!', {
											icon : 1,
											time : 700
										});
										$('#default_btn').attr('class','layui-btn layui-btn-danger')
										$('#default_btn').html('设为默认地址')
										$('#default_btn').removeAttr('id')
										btnObj=tr[0].lastChild.childNodes[0].childNodes[1].childNodes[0]
										btnObj.className="layui-btn layui-btn-disabled"
										btnObj.id="default_btn"
										btnObj.innerHTML="已为默认地址"
									} else {
										parent.layer.alert(data.msg, {
											icon : 5
										});
										console.log("failed")
									}
								},
								error : function(error) {
									console.log(error)
									parent.layer.alert('操作失败！！！', {
										icon : 5
									});
								}
							})
						}
					});
					
					//监听单元格编辑
					  table.on('edit', function(obj){
					    var value = obj.value //得到修改后的值
					    ,data = obj.data //得到所在行所有键值
					    ,field = obj.field; //得到字段
					    $.ajax({
					    	url:"/weibao/address/update",
					    	data:{
					    		"id":data.aid,
					    		"key":field,
					    		"value":value
					    	},
					    	type:"post",
					    	async:false,
					    	success:function(res){
					    		if(res=="success"){
					    			parent.layer.msg("修改成功",{icon:1})
					    		}else{
					    			parent.layer.msg("修改失败,请重试",{icon:5})
					    		}
					    	},
					    	error:function(res){
					    		parent.layer.msg("修改失败,请重试",{icon:5})
					    	}
					    })
					   // layer.msg('[ID: '+ data.aid +'] ' + field + ' 字段更改为：'+ value);
					  });

					table.render({
						elem : "#showAddress",
						url : '/weibao/address/getall',
						cellMinWidth:90,
						id : "address",
						cols : [ [ {
							field : 'receive_name',
							title : '收货人',
							edit:"text",
							width:117,
					   		height:36
						}, {
							field : 'aid',
							hide:true
						}, {
							field : 'address',
							title : '所在地区',
							width : 150
						}, {
							field : 'detail',
							title : '详细地址',
							edit:"text",
							width : 250
						}, {
							field : 'postcode',
							title : '邮编',	
							edit:"text"
						}, {
							field : 'telephone',
							title : '电话/手机',
							edit:"text",
							width : 120
						}, {
							title : '操作',
							toolbar : '#barDemo',
							width:68
						}, {
							field : 'set_origin',
							templet:'#get_default-btn',
							title : '设置默认值',
							width:140
						} ] ],
						parseData : function(res) { //res 即为原始返回的数据
							return {
								"code" : res.status, //解析接口状态
								"msg" : res.message, //解析提示文本
								//"count" : res.total, //解析数据长度
								"data" : res.data, //解析数据列表
							};
						},
						done : function(res, curr, count) {
							console.log(res);
							//得到当前页码
							console.log(curr);
							//得到数据总量
							//console.log(count);
						}
					})

					//layui表格重载：点击查询的时候触发、条件搜索
					form.on('submit(add)', function(data) {
						var param = data.field;
						console.log("发送到server端的数据:", JSON.stringify(param))
						$.ajax({
							url : "/weibao/address/add",
							type : "post",
							async : false,
							data : param,
							success : function(res) {
								console.log("添加一条address")
								if (res == "success") {
									parent.layer.msg("添加成功", {
										icon : 1,
										time : 1000
									})
									 table.reload('address',
											{
												method : 'post',
												contentType : "application/x-www-form-urlencoded;charset=utf-8",
												url : '/weibao/address/getall'
											}); 
								} else {
									parent.layer.msg("添加失败,请重试！", {
										icon : 5
									})
								}
							},
							error : function() {
								parent.layer.msg("添加失败,请重试！", {
									icon : 5
								})
							}
						})
					})
					
					form.verify({
						required : function(value, item) { //value：表单的值、item：表单的DOM对象
							console.log(value)
							if (value==null||""==value) {
								parent.layer.msg("必填项不能为空",{icon:5})			
								return "必填项不能为空";
							}
						},
						phone:function(value, item) { //value：表单的值、item：表单的DOM对象
							console.log(value)
							if(!(/^1[3456789]\d{9}$/.test(value))){ 
								parent.layer.msg("请填写正确的手机号",{icon:5})		
						        return "请填写正确的手机号"; 
						    }
						}
					})

				});
		
		
		function change(obj){
			console.log("-->onclick")
			console.log(obj)
			$('.layui-btn layui-btn-disabled').attr("layui-btn layui-btn-danger")
			obj.attr("class","layui-btn layui-btn-disabled")
		}
	</script>
	<script>
		layui.use([ 'form', 'code' ], function() {
			form = layui.form;
			layui.code();

			$('#start').xcity();

		});
		
	</script>
	<script type="text/html" id="barDemo">
		  <a href="javascript:(0)" title="编辑" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>
		  <a href="javascript:(0)" title="删除" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
	</script>
	<script type="text/html" id="get_default-btn">
 	 {{#  if(d.is_default == "1"){ }}
 	   <a href="javascript:(0)" title="设置默认" lay-event="set_default"><button class="layui-btn layui-btn-disabled" id="default_btn">已为默认地址</button></a>
 	 {{#  } else { }}
 	   <a href="javascript:(0)" title="设置默认" lay-event="set_default"><button class="layui-btn layui-btn-danger">设为默认地址</button></a>
 	 {{#  } }}
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>WEIBAO后台管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<form class="layui-form layui-col-space5">
							<fieldset
								class="layui-elem-field layui-field-title site-demo-button">
								<legend>用户总览</legend>
							</fieldset>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="name" name="name"
									placeholder="通过用户昵称进行搜索" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="username" name="username"
									placeholder="通过用户名进行搜索" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="start_time" name="start_time"
									placeholder="查询注册时间的开始日期" autocomplete="off" class="layui-input">
							</div>
							—
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="end_time" name="end_time"
									placeholder="查询注册时间的结束日期" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="email" name="email"
									placeholder="通过email进行搜索" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="telephone" name="telephone"
									placeholder="通过注册手机号进行搜索" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block" style="width: 189px;">
								<select id="status" name="status"
									placeholder="选择身份权限">  
									<option value="">选择身份权限</option>
									<option value="0">普通用户</option>
									<option value="1">信用不佳用户</option>
									<option value="2">黑名单用户</option>
									<option value="3">系统管理员用户</option>
								</select>
							</div>
							<div class="layui-inline layui-show-xs-block">
								<button class="layui-btn" lay-filter="search" lay-submit="">
									<i class="layui-icon">&#xe615;</i>
								</button>
								<button class="layui-btn" onclick="clear()">
									<i class="layui-icon">&#xe640;清空</i>
								</button>
							</div>
						</form>
					</div>
					<!-- <div class="layui-btn-group demoTable">
					  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
					</div> -->
					<div class="layui-card-body layui-table-body layui-table-main">
						<table class="layui-table layui-form" id="showUser"></table>
					</div>
					<div class="layui-card-body "></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
	
</script>
<script>
	layui
			.use(
					[ 'laydate', 'form', 'table', 'jquery', 'laypage', 'layer' ],
					function() {
						var laydate = layui.laydate;
						var form = layui.form;
						var table = layui.table;
						var $ = layui.jquery;
						var laypage = layui.laypage, layer = layui.layer

						laydate.render({
							elem : '#start_time'
						});

						laydate.render({
							elem : '#end_time'
						});
						//工具栏事件
						table.on('tool', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
							var data = obj.data; //获得当前行数据
							var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
							var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

							if (layEvent === 'del') { //删除
								parent.layer.confirm('确认删除吗？', function(index) {
									obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
									layer.close(index);
									//向服务端发送删除指令
									$.ajax({
										url : "/weibao/account/del",
										type : 'post',//method请求方式，get或者post
										data : {
											"id" : data.uid
										},
										dataType : "text",
										async : false,
										success : function(data) {//res为相应体,function为回调函数
											console.log("server:", data)
											if (data == "success") {
												parent.layer.msg('已删除!', {
													icon : 1,
													time : 1000
												}, function() {
													window.location.reload();
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
								//do something
								parent.xadmin.open('修改商品信息',
										'./myuser-edit.jsp?id=' + data.id, '',
										'', false)
							}
							return false;
						});

						//监听单元格编辑
						table.on('edit', function(obj) {
							var value = obj.value //得到修改后的值
							, data = obj.data //得到所在行所有键值
							, field = obj.field; //得到字段
							$.ajax({
								url : "/weibao/account/edit",
								data : {
									"id" : data.uid,
									"key" : field,
									"value" : value
								},
								type : "post",
								async : false,
								success : function(res) {
									if (res == "success") {
										parent.layer.msg("修改成功", {
											icon : 1
										})
									} else {
										parent.layer.msg("修改失败,请重试", {
											icon : 5
										})
									}
								},
								error : function(res) {
									parent.layer.msg("修改失败,请重试", {
										icon : 5
									})
								}
							})
						});
						//监听复选框
						table.on('checkbox()', function(obj) {
							console.log(obj.checked); //当前是否选中状态
							console.log(obj.data); //选中行的相关数据
							console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
						});
						
						 var $ = layui.$, 
						 active = {
								    getCheckData: function(){ //获取选中数据
								      var checkStatus = table.checkStatus('myuser')
								      ,data = checkStatus.data;
								      layer.alert(JSON.stringify(data));
								    }
								  };
						//表格初始化
						table.render({
							elem : "#showUser",
							url : '/weibao/account/getAll',
							page : true,
							limit : 10,
							limits : [ 10, 15, 20, 50, 100 ],
							cellMinWidth : 70,
							id : "myuser",
							cols : [ [ {
								type : 'checkbox'
							}, {
								field : 'uid',
								title : '用户编号',
								width : 100,
								hide : true
							}, {
								field : 'name',
								title : '用户昵称'
							}, {
								field : 'username',
								title : '用户名'
							}, {
								field : 'password',
								title : '密码',
								edit : "text"
							}, {
								field : 'sex',
								title : '性别'
							}, {
								field : 'email',
								title : '电子邮箱',
								width : 180
							}, {
								field : 'telephone',
								title : '电话号码'
							}, {
								field : 'address‘',
								title : '注册地址'
							}, {
								field : 'register_time',
								title : '注册时间',
								sort : true,
								templet : function(d) {
									var date = new Date(d.register_time);
									return formatTime(date);
								}
							}, {
								field : 'credit',
								title : '信用分',
								sort : true,
							}, {
								field : 'status',
								title : '状态',
								edit : "text",
								templet : function(d) {
									switch (d.status) {
									case "0":
										return "普通用户";
										break;
									case "1":
										return "信用不佳用户";
										break;
									case "2":
										return "黑名单用户";
										break;
									case "3":
										return "系统管理员";
										break;
									default:
										return "未知身份";
										break;
									}
								}
							}, {
								title : '操作',
								width : 200,
								toolbar : '#barDemo'
							} ] ],
							parseData : function(res) { //res 即为原始返回的数据
								return {
									"code" : res.status, //解析接口状态
									"msg" : res.msg, //解析提示文本
									"count" : res.count, //解析数据长度
									"data" : res.data, //解析数据列表
								};
							},
							done : function(res, curr, count) {
								console.log(res);
								//得到当前页码
								console.log(curr);
								//得到数据总量
								console.log(count);
							}
						})

						//条件搜索
						form.render();
						form
								.on(
										'submit(search)',
										function(data) {
											var formData = data.field;
											console.log("搜索条件：", formData);
											var name_search = formData.name,username_search = formData.username, 
											start_time_search = formData.start_time, end_time_search = formData.end_time,
											email_search = formData.email,telephone_search = formData.telephone,
											status_search = formData.status;
											table
													.reload(
															'myuser',
															{
																page : true,
																limit : 10,
																limits : [ 10,
																		15, 20,
																		50, 100 ],
																where : {
																	name : name_search,
																	username:username_search,
																	start_time : start_time_search,
																	end_time : end_time_search,
																	email:email_search,
																	telephone:telephone_search,
																	status:status_search																	
																},
																method : 'post',
																contentType : "application/x-www-form-urlencoded;charset=utf-8",
																url : '/weibao/account/getbymany'
															});
											return false;
										});

						function clear() {
							$("input").clear();
						}
					});

	function formatTime(date) {
		/* 从Date对象（标准时间格式）返回对应数据 */
		var date = new Date(date);
		let year = date.getFullYear();
		let month = date.getMonth()+1;
		let day = date.getDate();
		let hour = date.getHours();
		let minute = date.getMinutes();
		let second = date.getSeconds();
		return year + '年' + month + '月' + day + '日';
	}
</script>

<script type="text/html" id="barDemo">
	  <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" style="width: 100px; font-size: 16px;" lay-event="del">删除</a>
	</script>
</html>

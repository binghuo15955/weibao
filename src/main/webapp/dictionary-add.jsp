<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>登录</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<style>
span {
	font-size: 14px;
}
</style>
</head>
<body class="login-bg" style="background: gray;">

	<div class="login layui-anim layui-anim-up">
		<div class="message">WEIBAO搜-->添加数据字典条目</div>
		<div id="darkbannerwrap"></div>

		<form method="post" class="layui-form">
			<span class="x-red">*</span><span>分类</span>&emsp;<input name="classification" id="classification" placeholder="输入分类" lay-verify="required"
				type="text" class="layui-input" style="display: unset; width: 76%;">			
			<hr class="hr15">
			<span class="x-red">*</span><span>条目</span>&emsp;<input name="item" placeholder="输入条目" id="item"
				 class="layui-input" lay-verify="required"
				style="display: unset; width: 76%;">
			<hr class="hr15">
			<span class="x-red">*</span><span>对应值</span>&emsp;<input name="value" placeholder="输入对应的值" lay-verify="required" id="value"
				type="text" class="layui-input" style="display: unset; width: 76%;">
			<hr class="hr15">
			<span class="x-red">*</span><span>是否可编辑</span>&emsp; <input type="checkbox" checked="" name="editable" lay-skin="switch" lay-text="是|否">
			<hr class="hr15">
			<input value="添加" lay-submit lay-filter="add"
				style="width: 100%;" type="submit">
			<hr class="hr20">
			<input value="提交并继续添加" lay-submit lay-filter="continue_add"
				style="width: 100%;background: orange;" type="submit">
			<hr class="hr20">
		</form>
	</div>

	<script>		
		layui.use([ 'form', 'jquery' ], function() {
			var form = layui.form, $ = layui.jquery;
			//监听提交
			form.on('submit(add)', function(data) {
				var param = data.field;
				console.log(JSON.stringify(param))
				$.ajax({
					url : "/weibao/dictionary/add",
					type : "post",
					data : param,
					async : false,
					success : function(obj) {
						if(obj=="success"){
							console.log("server-->" + obj)
							console.log("添加成功")
							layer.msg('添加成功', {
								icon : 1,
								time : 700
							},
									function() {
								parent.location.reload();
										//关闭当前frame
										var index = parent.layer
												.getFrameIndex(window.name);
										//关闭当前frame
										parent.layer.close(index)
										return false;
									});
						}else{
							console.log("server-->" + obj)
							console.log("添加失败！")
							layer.msg('添加失败', {
								icon : 3,
								time : 1000
							})
						}
						
					},
					error : function() {
						layer.alert('系统错误！！！', {
							icon : 5
						});
					}
				})
				return false;
			});  
			form.on('submit(continue_add)', function(data) {
				var param = data.field;
				console.log(JSON.stringify(param))
				$.ajax({
					url : "/weibao/dictionary/add",
					type : "post",
					data : param,
					async : false,
					success : function(obj) {
						if(obj=="success"){
							console.log("server-->" + obj)
							console.log("添加成功")
							layer.msg('添加成功', {
								icon : 1,
								time : 700
							},
							function() {
								//window.location.reload();//param.classification
								$('#classification').val(param.classification);
								$('#value').val('');
								$('#item').val('');
							});
						}else{
							console.log("server-->" + obj)
							console.log("添加失败！")
							layer.msg('添加失败', {
								icon : 3,
								time : 1000
							})
						}
						
					},
					error : function() {
						layer.alert('系统错误！！！', {
							icon : 5
						});
					}
				})
				return false;
			});  
		});
	</script>
</body>
</html>

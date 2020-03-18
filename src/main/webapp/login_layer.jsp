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
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

	<div class="login layui-anim layui-anim-up">
		<div class="message">WEIBAO搜</div>
		<div id="darkbannerwrap"></div>

		<form method="post" class="layui-form">
			<input name="username" placeholder="用户名" type="text"
				lay-verify="required" class="layui-input">
			<hr class="hr15">
			<input name="password" lay-verify="required" placeholder="密码"
				type="password" class="layui-input">
			<hr class="hr15">
			<input value="登录" lay-submit lay-filter="login" style="width: 100%;"
				type="submit">
			<hr class="hr20">
			<a href="register.html" style="float: right">还没有账号?立即注册</a> 
			<hr class="hr20">
		</form>
	</div>

	<script>	
		$(function() {
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(login)', function(data) {
					var param = data.field;
					console.log("发送到server的信息:"+JSON.stringify(param))
					$.ajax({
						url : "/weibao/account/login",
						type : "post",
						data : param,
						async : false,
						success : function(obj) {
							console.log("server返回值：" + obj)
							if (obj == "success") {
								layer.msg('登录成功', {
									icon : 1,
									time : 1500
								}, function() {
									//关闭当前frame
									//parent.location.href = "index.jsp";
									var index = parent.layer
											.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index)
									parent.location.reload();
								});
							} else {
								layer.alert('登录失败！请再次检查您的用户名密码！', {
									icon : 5
								});
							}
						},
						error : function() {
							layer.alert('登录失败！！！', {
								icon : 5
							});
						}
					})
					return false;
				});

			});
		})
	</script>
	<!-- 底部结束 -->
</body>
</html>
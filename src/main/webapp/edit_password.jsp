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
	<div id="header">修改密码</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card-body ">
					<form class="layui-form layui-col-md12  layui-form-pane" id="layform">
						<div>
							<label class="layui-form-label"><span class="x-red">*</span>原密码：</label>
							<div class="layui-input-inline">
								<input type="password" id="old_password" name="old_password"
									placeholder="请输入原密码" lay-verify="required" required="required" 
									class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label"><span
								class="x-red">*</span>新密码：</label>
							<div class="layui-input-inline">
								<input type="password" id="new_password" name="new_password" 
									placeholder="请输入新密码" lay-verify="required|pass"
									class="layui-input wider-input">
							</div>
							<br> <label class="layui-form-label"><span
								class="x-red">*</span>新密码：</label>
							<div class="layui-input-inline">
								<input type="password" id="newpass2"
									lay-verify="required|check_same" placeholder="再次输入新密码"
									class="layui-input wider-input">
							</div>
							<br>
							<div class="layui-input-inline">
								<button lay-submit=""
									class="layui-btn layui-btn-normal layui-btn-lg">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>


	</div>

</body>
<script>
	layui.use([ 'form', 'layer' ], function() {
		var form = layui.form, layer = layui.layer;

		form.on('submit()', function(data) {
			var param = data.field; //定义临时变量获取表单提交过来的数据，非json格式
			console.log(JSON.stringify(param)); //测试是否获取到表单数据，调试模式下在页面控制台查看
			$.ajax({
				url : "/weibao/account/edit_password",
				type : 'post', //method请求方式，get或者post
				data : param, //表格数据序列化
				async : false,
				success : function(res) { //res为相应体,function为回调函数
					console.log("服务器返回值：", res)
					if (res == "success") {
						parent.layer.msg('修改成功', {
							icon : 1,
							time : 1700
						})
					} else {
						parent.layer.alert("请认真核对密码是否输入正确！", {
							icon : 5
						},function(index){
							$("#layform")[0].reset();
							parent.layer.close(index);
						});
					}
				},
				error : function() {
					parent.layer.alert('操作失败！！！', {
						icon : 5
					});
				}
			});
			return false;
		})
		form.verify({	
			check_same : function(value, item) { //value：表单的值、item：表单的DOM对象
				console.log(value)
				console.log($("#new_password").val())
				if (value != $("#new_password").val()) {
					parent.layer.msg("两次输入密码不一致")
					return "两次输入密码不一致";
				}
			},
			pass:function(value,item){
				if(!(/^[\S]{6,12}$/).test(value)){
					parent.layer.msg("密码必须6到12位，且不能出现空格");
					return "密码必须6到12位，且不能出现空格";
				}
			},
			required:function(value,item){
				console.log("required-value:",value)
				if(value<=0){
					parent.layer.msg("这是必填项");
					return "必填项不能为空";
				}
			}
		  });
		
  
  
	})
</script>
</html>

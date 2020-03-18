<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>留言驿站</title>
<link rel="stylesheet" href="css/comment.css">
<link rel="stylesheet" href="./lib/layui/css/layui.css">
</head>
<body>
	<div class="middle">
		<form class="layui-form">
			<input type="hidden" name="pid" id="pid" /> <input type="hidden"
				name="post_uid" id="post_uid" />
			<textarea cols="135" rows="10" placeholder="留下你最宝贵的意见" id="comment"
				name="comment"></textarea>
			<p>
				<button class="layui-btn layui-btn-warm layui-btn-radius" lay-submit style="margin-right: 16px;
    margin-top: 7px;"
					lay-filter="post">发送</button>
			</p>
		</form>
	</div>
</body>

<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./lib/layui/layui.js"
	charset="utf-8"></script>
<script>
	var pid, post_uid;
	function post(pid, post_uid) {
		pid = pid;
		post_uid = post_uid;
		$('#pid').val(pid);
		$('#post_uid').val(post_uid);
		console.log(pid, post_uid)
	}

	layui.use([ 'layer', 'form' ], function() {
		var layer = layui.layer, form = layui.form;
		form.on('submit(post)', function(data) {
			var param = data.field;
			console.log(param)
			console.log(JSON.stringify(param));
			var jsonStr = {
				"pid" : pid,
				"post_uid" : post_uid,
				"comment" : param.comment
			}
			$.ajax({
				url : "/weibao/comment/add",
				type : 'post', //method请求方式，get或者post
				data : param, //表格数据序列化
				async : false,
				success : function(res) { //res为相应体,function为回调函数
					console.log("服务器返回值：" + res)
					if (res == "success") {
						layer.msg('评论成功', {
							icon : 1,
							time : 300
						},
								function() {
									parent.location.reload();
									var index = parent.layer
											.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index)

								});
						//$("#res").click();//调用重置按钮将表单数据清空
					} else {
						layer.alert("评论失败", {
							icon : 5
						});
						console.log("failed")
					}
				},
				error : function() {
					layer.alert('操作失败！请检查您的登陆情况！！', {
						icon : 5
					},function(){
						var index = parent.layer.getFrameIndex(window.name);
						//关闭当前frame
						parent.layer.close(index)
					});
				}
			});

			return false;
		})
	})
</script>
</html>

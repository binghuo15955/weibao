function add_tab(url) {
	console.log($('.x-iframe')[0].src=url)
}

function exit() {
	$.ajax({
		url : "/weibao/account/exit",
		async : false,
		type : "post",
		success : function(res) {
			layer.msg('账户已登出', {
				icon : 1,
				time : 1500
			}, function() {
				//window.location.href = "index.jsp";
				parent.location.reload();
			});
		},
		error : function() {
			layer.alert('退出失败！！！', {
				icon : 5
			});
		}
	})
}

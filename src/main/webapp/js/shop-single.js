/*layui.use(['layer'], function() {
	var layer = layui.layer;
	var $ = layui.jquery;

	$(function() {
		$(".layui-icon-star").click(function() {
			console.log($(this)[0].className)
			if ($(this).attr('class') == 'layui-icon layui-icon-star') {
				layer.msg("收藏成功")
			} else {
				layer.msg("取消收藏")
			}
			$(this).toggleClass(function() {
				return 'layui-icon-star-fill'
			})
			console.log("hou=" + $(this)[0].className)
		})
		
		
		$(".layui-icon-praise").click(function() { //点赞
			$(this).toggleClass('cs');
			console.log("change!!")
		})

		$("#comment").click(
			function() {
				layer.open({type: 2, 
					title: '留言驿站',
					content: 'comment.jsp',
					area: ['1000px', '300px']
				});
			})
	})

	

})
function add2cart(id){
		layer.open({type: 2,
			title: '付款',
			content: 'checkout.html?id='+id,
			area: ['500px', '700px']
		});
	}*/
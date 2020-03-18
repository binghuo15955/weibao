<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" style="overflow-x: hidden;">
<head>
<title>变废为宝-WEIBAO！</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/shop-single.css">
<link rel="stylesheet" href="./lib/layui/css/layui.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/top.css">
<style>
#p_pics .owl-item {
	width: 120px !important; 
	margin-right: 0px !important;
}
</style>
</head>
<body>

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">

						<div
							class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">

						</div>

						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="index.jsp" class="js-logo-clone">weibao搜</a>
							</div>
						</div>

						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<c:choose>
								<c:when
									test="${sessionScope.name!=null && sessionScope.name!=''}">
									<div class="site-top-icons">
										<ul>
											<span>欢迎你！<%=session.getAttribute("name")%></span>
											<li class="dropdown"><a href="#" class="dropdown-toggle"
												data-toggle="dropdown"><span class="icon icon-person"
													title="个人中心"></span></a>
												<ul class="dropdown-menu bottom-up pull-right"
													style="min-width: 106px; padding: 10px;">
													<li><a href="user.jsp">用户中心</a></li>
													<li><a href="javascript:(0)"
														onclick="xadmin.open('我要发布','post.jsp','','')">我要发布</a></li>
													<li><a href="javascript:(0)"
														onclick="xadmin.open('我的发布','mypost.jsp','','')">我的发布</a></li>
													<li><a href="javascript:(0)"
														onclick="xadmin.open('我的订单','record.jsp','','')">我的订单</a></li>
													<li><a href="javascript:(0)" onclick="exit()">退出</a></li>
												</ul></li>&emsp;
											<li><a href="javascript:(0)"
												onclick="xadmin.open('我的收藏','favorite.jsp?name=<%=session.getAttribute("name")%>','1000','',false)"><span
													class="icon icon-heart-o" title="我的收藏"></span></a></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<div class="site-top-icons">
										<ul>
											<li><a href="javascript:(0)"
												onclick="xadmin.open('登录','login_layer.jsp','','',true)">登录</a></li>
											&emsp;
											<li><a href="javascript:(0)"
												onclick="xadmin.open('注册','register.html','','',true)">注册</a></li>
										</ul>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
				</div>
			</div>
			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block">
						<a href="index.jsp">首页</a>
						<li class="has-children"><a href="javascript:(0)">分类</a>
							<ul class="dropdown">
								<li><a href="shop.jsp?kw=phone">手机数码</a></li>
								<li><a href="shop.jsp?kw=daily">生活百货</a></li>
								<li><a href="shop.jsp?kw=womanshirt">女装</a></li>
								<li><a href="shop.jsp?kw=womanshoes">女鞋</a></li>
								<li><a href="shop.jsp?kw=makeup">美妆</a></li>
								<li><a href="shop.jsp?kw=manshirt">男装</a></li>
								<li><a href="shop.jsp?kw=manshoes">男鞋</a></li>
								<li><a href="shop.jsp?kw=electrical">家用电器</a></li>
								<li><a href="shop.jsp?kw=outdoor">运动户外</a></li>
								<li><a href="shop.jsp?kw=furniture">家具/饰品</a></li>
								<li><a href="shop.jsp?kw=car">整车/车品</a></li>
								<li><a href="shop.jsp?kw=game">游戏装备</a></li>
								<li><a href="shop.jsp?kw=pet">宠物用品</a></li>
								<li><a href="shop.jsp?kw=instrument">乐器</a></li>
								<li><a href="shop.jsp?kw=card">卡券交易</a></li>
								<li><a href="shop.jsp?kw=book">书籍交易</a></li>
							</ul></li>
						<li><a href="shop.jsp">附近</a></li>
						<li class="has-children"><a href="javascript:(0)">技能服务/跑腿</a>
							<ul class="dropdown">
								<li><a href="shop.jsp?kw=free">闲置出租</a></li>
								<li><a href="shop.jsp?kw=delivery">快递代拿</a></li>
								<li><a href="shop.jsp?kw=computer">PPT/PS/PR等</a></li>
								<li><a href="shop.jsp?kw=job">兼职</a></li>
								<li><a href="shop.jsp?kw=carsharing">校园拼车</a></li>
								<li><a href="shop.jsp?kw=others">其他</a></li>
							</ul></li>
						<li><a href="contact.html">联系我们</a></li>
						<li><a href="about.html">关于我们</a></li>
					</ul>
				</div>
			</nav>
		</header>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">首页</a> <span class="mx-2 mb-0">/</span> <a
							href="shop.jsp">所有商品</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">商品页面</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row" id="content"></div>
			</div>
		</div>

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>
							<a href="javascript:(0)" id="all_comments"
								onclick="all_comments()"> 全 部 留 言 </a> / <a
								href="javascript:(0)" style="color: gainsboro;" id="my_comments"
								onclick="my_comments()">我 的 留 言</a>
						</h2>
					</div>
				</div>
				<div class="row comment-container"
					style="overflow: auto; width: 1176px; overflow-x: hidden;">
					<ul class="flow-default" style="height: 500px;" id="comments"></ul>
				</div>
			</div>
		</div>
		<hr>
		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>他/她 还 在 卖</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel" id="alsoSells"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="row pt-5 mt-5 text-center">
		<div class="col-md-12">
			<p>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | This template is made with <i
					class="icon-heart" aria-hidden="true"></i> by <a
					href="https://colorlib.com" target="_blank" class="text-primary">YETAO</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
			<p>
				<a href="#">回到顶部</a>
			</p>
		</div>

	</div>		<div id="return-top" class="top_e">
			<img src="./images/top.png" width="60" id="img">
			<div style="width: 60px; margin: auto;">
				<p id='font'
					style="font-size: 20px; margin-left: 10px; margin-bottom:10px;display: none;">
					返回<br>顶部
				</p>
			</div>
		</div>
	</div>
	</div>

	<script type="text/javascript" src="./lib/layui/layui.js"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<script src="js/nav.js"></script>
	<script type="text/javascript">
		var param = location.search.substring(1);
		var id = param.split('&')[0].split('=')[1], uid = param.split('&')[1]
				.split('=')[1];
		var pid, seller_id;

		$
				.ajax({
					url : "/weibao/goods/getbyuid",
					type : "post",
					async : false,
					data : {
						"id" : id,
						"uid" : uid
					},
					success : function(res) {
						console.log("初始化数据:", res)
						var jsonObj = JSON.parse(res);
						var product = jsonObj.product;
						var products = jsonObj.products;
						var username = jsonObj.username;
						var isLove = jsonObj.isLove;
						var src = "images/no-picture.png"
						var delivery = 0;
						var product_pics = "";
						var u_name = "\'" + product.u_name + "\'";
						var p_name = "\'" + product.name + "\'";
						var category = "\'" + product.category + "\'";
						pid = product.id, seller_id = product.uid;
						if (product.pictureSet.length != 0
								&& product.pictureSet != []) {
							var picurl = product.pictureSet[0].picurl;
							var pic_arr = picurl.split("\\")
							src = pic_arr[pic_arr.length - 2] + "/"
									+ pic_arr[pic_arr.length - 1]
							pic_name = pic_arr[pic_arr.length - 1];
							console.log(src)

							product_pics += '<div class="item" style="    text-align: center;">'
									+ '<figure class="block-4-image"><div class="nonloop-block-3 owl-carousel" id="p_pics">'
							for (var i = 0; i < product.pictureSet.length; i++) {
								var picurll = product.pictureSet[i].picurl;
								var pic_arr = picurll.split("\\")
								src1 = pic_arr[pic_arr.length - 2] + "/"
										+ pic_arr[pic_arr.length - 1];
								src2 = "\'" + src1 + "\'";
								product_pics += '<a href="javascript:;" onclick="change_bigPicture('
										+ src2
										+ ')"><img src="'+src1+'" alt="Image placeholder" class="img-fluid" style="height: 110px;width: 110px; margin: 2.5px;"></a>'
							}
							product_pics += '	</figure>' + '</div>' + '</div>';
						}
						var p_picture = "\'" + src + "\'";
						var content = '<div class="col-md-6">'
								+ '<img src="'+src+'" alt="Image" class="img-fluid" style="height: 350px;" id="big_picture">'
								+ product_pics + '</div>'
								+ '<div class="col-md-6">'
								+ '	<h2 class="text-black">' + product.name
								+ '</h2>' + '	<p style="color: #000000">'
								+ product.description + '</p>' + '	<br>'
						if (product.delivery == 0) {
							content += '<p style="color:crimson">包邮</p><br>'
						} else {
							content += '<p style="color:crimson">运费:'
									+ product.delivery + '</p><br>'
							delivery = product.delivery;
						}

						if (username != null && username != "") {
							nologin_buy_content = '	<p><a href="javascript:(0)" onclick="buy('
									+ product.id
									+ ','
									+ product.current_price
									+ ','
									+ delivery
									+ ','
									+ product.uid
									+ ','
									+ u_name
									+ ','
									+ p_name
									+ ','
									+ p_picture
									+ ','
									+ category
									+ ')" class="buy-now btn btn-sm btn-primary">我想要</a>&emsp;&emsp;'
						} else {
							nologin_buy_content = ' <p><a href="javascript:(0)" onclick="xadmin.open(\'登录\',\'login_layer.jsp\',\'\',\'\',false)" class="buy-now btn btn-sm btn-primary">我想要</a>&emsp;&emsp;'
						}
						content += '<div>库存: <span id="left" name="left">'
								+ product.quality
								+ '</span></div><br>'
								+ '	<p><strong class="h4" style="color: red;">￥'
								+ product.current_price
								+ '.00</strong>&emsp;<span style="text-decoration:line-through;"><strong'
						+'			 style="font: gray">￥'
								+ product.origin_price
								+ '.00</strong></span></p>'
								+ '	<br>'
								+ '	<div class="mb-5">'
								+ '		<div class="input-group mb-3" style="max-width: 120px;">'
								+ '		<div class="input-group-prepend">'
								+ '			<button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>'
								+ '		</div>'
								+ '		<input type="text" id="quantity" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon"'
						+'		 aria-describedby="button-addon1">'
								+ '		<div class="input-group-append">'
								+ '			<button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>'
								+ '		</div>' + '	</div><br>'
								+ nologin_buy_content
						if (isLove != true) {
							content += '<span class="layui-icon layui-icon-star">收藏</span>&emsp;<span class="layui-icon layui-icon-reply-fill" id="comment">留言</span></p>'
									+ '</div>' + '</div>'
						} else {
							content += '<span class="layui-icon layui-icon-star layui-icon-star-fill">收藏</span>&emsp;<span class="layui-icon layui-icon-reply-fill" id="comment">留言</span></p>'
									+ '</div>' + '</div>'
						}
						$('#content').append(content)

						for (var i = 0; i < products.length; i++) {
							var src = "images/no-picture.png";
							var p = products[i];
							if (products[i].pictureSet.length != 0
									&& products[i].pictureSet != []) {
								var picurl = products[i].pictureSet[0].picurl;
								var pic_arr = picurl.split("\\")
								src = pic_arr[pic_arr.length - 2] + "/"
										+ pic_arr[pic_arr.length - 1]
								pic_name = pic_arr[pic_arr.length - 1];
								console.log(src)
							}

							$('#alsoSells')
									.append(
											'<div class="item">'
													+ '<div class="block-4 text-center">'
													+ '<figure class="block-4-image">'
													+ '	<img src="'+src+'" alt="Image placeholder" style="height:250px" class="img-fluid">'
													+ '	</figure>'
													+ '<div class="block-4-text p-4">'
													+ '<h3><a href="shop-single.jsp?id='
													+ p.id
													+ '&uid='
													+ p.uid
													+ '">'
													+ p.name
													+ '</a></h3>'
													+ '<p class="text-primary font-weight-bold">￥'
													+ p.current_price + '</p>'
													+ '</div>' + '</div>'
													+ '</div>')
						}

						console.log("获取数据成功！")
					},
					error : function(res) {
						console.log("获取数据失败！")
					}
				})

		function change_bigPicture(picurl) {
			$('#big_picture').attr('src', picurl);
		}

		function buy(id, price, delivery, uid, u_name, p_name, src, category) {
			total = 0;
			price = parseInt(price)
			quantity = $('#quantity').val()
			total += price * quantity
			console.log("产品单价:", price)
			console.log("产品类别:", category)
			console.log("产品数量:", quantity)
			console.log("产品运费:", delivery)
			console.log("实际付款:", total)
			console.log("产品图片url:", src)
			window.location.href = "checkout.jsp?id=" + id + "&price=" + price
					+ "&delivery=" + delivery + "&quantity=" + quantity
					+ "&uid=" + uid + "&u_name=" + u_name + "&p_name=" + p_name
					+ "&p_picture=" + src + "&category=" + category;

		}

		layui.use([ 'layer' ], function() {
			var layer = layui.layer;
			var $ = layui.jquery;
			//收藏
			$(function() {
				$(".layui-icon-star").click(function() {
					console.log($(this)[0].className)
					if ($(this).attr('class') == 'layui-icon layui-icon-star') {
						$.ajax({
							url : "/weibao/collect/add",
							type : "get",
							data : {
								"pid" : id
							},
							async : false,
							success : function(res) {
								if (res == "success") {
									layer.msg("收藏成功")
								} else {
									layer.msg("收藏失败,请重试！")
								}
							},
							error : function(res) {
								layer.msg("系统错误！请检查您的登陆情况！")
							}
						})
					} else {
						$.ajax({
							url : "/weibao/collect/del",
							type : "get",
							data : {
								"pid" : id
							},
							async : false,
							success : function(res) {
								if (res == "success") {
									layer.msg("取消收藏")
								} else {
									layer.msg("收藏失败,请重试！")
								}
							},
							error : function(res) {
								layer.msg("系统错误！请检查您的登陆情况！")
							}
						})
					}
					$(this).toggleClass(function() {
						return 'layui-icon-star-fill'
					})
					console.log("收藏按钮的class=" + $(this)[0].className)
				})
				/* $(".layui-icon-praise").click(function() { //点赞
					$(this).toggleClass('cs');
				}) */

				$("#comment").click(function() {
					layer.open({
						type : 2,
						title : '留言驿站',
						content : 'comment.jsp',
						area : [ '1000px', '300px' ],
						success : function(layero, index) {
							// 获取子页面的iframe
							var iframe = window['layui-layer-iframe' + index];
							// 向子页面的全局函数child传参
							iframe.post(pid, seller_id);
						}
					});
				})
			})

		})

		function all_comments() {
			$('#my_comments').css('color', 'gainsboro');
			$('#all_comments').css('color', 'black');
			$('#comments').html('')
			layui
					.use(
							'flow',
							function() {
								var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
								var flow = layui.flow;
								flow
										.load({
											elem : '#comments' //指定列表容器
											,
											done : function(page, next) { //到达临界点（默认滚动触发），触发下一页
												var lis = [];
												$
														.ajax({
															url : "/weibao/comment/getbypid",
															type : "post",
															async : false,
															data : {
																"pid" : id,
																"page" : page,
																"limit" : "3"
															},
															success : function(
																	res) {
																var jsonObj = JSON
																		.parse(res);
																console
																		.log(
																				"返回的comment数据:",
																				jsonObj)
																var comments = jsonObj.comments;
																console
																		.log(
																				"comments:",
																				comments)

																//假设你的列表返回在data集合中
																layui
																		.each(
																				comments,
																				function(
																						index,
																						item) {
																					var time_arr = item.time
																							.split('T');
																					lis
																							.push('<li>'
																									+ '<div class="col-md-11 border p-4 rounded comment" style="width: 1196px;">'
																									+ '<span class="comment-user">'
																									+ item.comment_name
																									+ '</span>'
																									+ '<p class="comment-content">'
																									+ item.comment
																									+ '</p>'
																									+ time_arr[0]
																									+ " "
																									+ time_arr[1]
																									+ '<a href="javascript:(0)"><span class="layui-icon" id="span'
																									+ item.cid
																									+ '" onclick="set_good('
																									+ item.cid
																									+ ')"'
																									+ '	style="float: right;">&#xe6c6;点赞</span></a><span style="float: right;" id="good'+item.cid+'">'
																									+ item.count
																									+ '</span>'
																									+ '</div>'
																									+ '</li>');
																				});

																//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
																//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
																next(
																		lis
																				.join(''),
																		page < jsonObj.pages);

																console
																		.log("再次获取全部comment成功！")
															},
															error : function(
																	res) {
																console
																		.log("再次获取全部comment失败！")
															}
														})

											}
										});
							});
		}

		function my_comments() {
			$('#my_comments').css('color', 'black');
			$('#all_comments').css('color', 'gainsboro');
			$('#comments').html('')
			layui
					.use(
							'flow',
							function() {
								var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
								var flow = layui.flow;
								flow
										.load({
											elem : '#comments' //指定列表容器
											,
											done : function(page, next) { //到达临界点（默认滚动触发），触发下一页
												var lis = [];
												$
														.ajax({
															url : "/weibao/comment/getbypidanduserid",
															type : "post",
															async : false,
															data : {
																"pid" : id,
																"page" : page,
																"limit" : "3"
															},
															success : function(
																	res) {
																var jsonObj = JSON
																		.parse(res);
																console
																		.log(
																				"返回的comment数据:",
																				jsonObj)
																var comments = jsonObj.comments;
																console
																		.log(
																				"comments:",
																				comments)

																//假设你的列表返回在data集合中
																layui
																		.each(
																				comments,
																				function(
																						index,
																						item) {
																					var time_arr = item.time
																							.split('T');
																					lis
																							.push('<li>'
																									+ '<div class="col-md-11 border p-4 rounded comment" style="width: 1196px;">'
																									+ '<span class="comment-user">'
																									+ item.comment_name
																									+ '</span>'
																									+ '<p class="comment-content">'
																									+ item.comment
																									+ '</p>'
																									+ time_arr[0]
																									+ " "
																									+ time_arr[1]
																									+ '<a href="javascript:(0)" onclick="del_comment('
																									+ item.cid
																									+ ')">&emsp;<span style="">删除</span></a>'
																									+ '</div>'
																									+ '</li>');
																				});

																//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
																//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
																next(
																		lis
																				.join(''),
																		page < jsonObj.pages);

																console
																		.log("获取我的comment成功！")
															},
															error : function(
																	res) {

																console
																		.log("获取我的comment失败！")
															}
														})

											}
										});
							});

		}
	</script>
	<script>
		layui
				.use(
						'flow',
						function() {
							var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
							var flow = layui.flow;
							flow
									.load({
										elem : '#comments' //指定列表容器
										,
										done : function(page, next) { //到达临界点（默认滚动触发），触发下一页
											var lis = [];
											$
													.ajax({
														url : "/weibao/comment/getbypid",
														type : "post",
														async : false,
														data : {
															"pid" : id,
															"page" : page,
															"limit" : "3"
														},
														success : function(res) {
															var jsonObj = JSON
																	.parse(res);
															console
																	.log(
																			"返回的comment数据:",
																			jsonObj)
															var comments = jsonObj.comments;
															console
																	.log(
																			"comments:",
																			comments)

															//假设你的列表返回在data集合中
															layui
																	.each(
																			comments,
																			function(
																					index,
																					item) {
																				var time_arr = item.time
																						.split('T');
																				lis
																						.push('<li>'
																								+ '<div class="col-md-11 border p-4 rounded comment" style="width: 1196px;">'
																								+ '<span class="comment-user">'
																								+ item.comment_name
																								+ '</span>'
																								+ '<p class="comment-content">'
																								+ item.comment
																								+ '</p>'
																								+ time_arr[0]
																								+ " "
																								+ time_arr[1]
																								+ '<a href="javascript:(0)"><span class="layui-icon" id="span'
																								+ item.cid
																								+ '" onclick="set_good('
																								+ item.cid
																								+ ')"'
																								+ '	style="float: right;">&#xe6c6;点赞</span></a><span style="float: right;" id="good'+item.cid+'">'
																								+ item.count
																								+ '</span>'
																								+ '</div>'
																								+ '</li>');
																			});

															//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
															//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
															next(
																	lis
																			.join(''),
																	page < jsonObj.pages);

															console
																	.log("再次获取全部comment成功！")
														},
														error : function(res) {
															$('#comments')
																	.html(
																			'你还没有评论')
															console
																	.log("再次获取全部comment失败！")
														}
													})

										}
									});
						});
	</script>
	<script>
		function del_comment(cid) {
			layer.confirm('确认删除吗？', function(index) {
				layer.close(index);
				//向服务端发送删除指令
				$.ajax({
					url : "/weibao/comment/del",
					type : 'post',//method请求方式，get或者post
					data : {
						"cid" : cid
					},
					dataType : "text",
					async : false,
					success : function(data) {//res为相应体,function为回调函数
						if (data == "success") {
							layer.msg('评论已删除!', {
								icon : 1,
								time : 1000
							});
							parent.location.reload();
						} else {
							layer.alert(data.msg, {
								icon : 5
							});
							console.log("failed")
						}
					},
					error : function(error) {
						console.log(error)
						layer.alert('操作失败！！！', {
							icon : 5
						});
					}
				});
			});
		}

		function set_good(cid) { //点赞!!
			console.log(cid)
			cidstr = '#span' + cid
			goodcount = '#good' + cid
			var flag = "";
			if ($(cidstr)[0].className == "layui-icon") {//123
				$(cidstr).addClass('cs')
				$(cidstr).css("color", "red");//生效
				$(goodcount).html(parseInt($(goodcount).html()) + 1)
				flag = "up";
			} else {
				$(cidstr).css("color", "");
				$(cidstr).attr("class", "layui-icon")
				$(goodcount).html(parseInt($(goodcount).html()) - 1)
				flag = "down";
			}
			$.ajax({
				url : "/weibao/comment/set_good",
				type : "post",
				async : false,
				data : {
					"cid" : cid,
					"flag" : flag
				},
				success : function(data) {//res为相应体,function为回调函数
					if (data == "success") {
						//parent.location.reload();
					} else {
						layer.alert(data.msg, {
							icon : 5
						});
						console.log("failed")
					}
				},
				error : function(error) {
					console.log(error)
					layer.alert('操作失败！！！', {
						icon : 5
					});
				}
			})
		}
	</script>
		<script type="text/javascript">
	// 控制按钮的显示和消失
	 $(window).scroll(function(){
	            if($(window).scrollTop()>100){
	                $('#return-top').fadeIn(100);
	                }
	             else{$('#return-top').fadeOut(0);}
	                 })


	// 点击按钮，使得页面返回顶部
	$("#return-top").click(function(){
	scrollTo(0,0);
	});
	// 鼠标悬浮按钮之上，图片消失，文字显示
	$(".top_e").mouseover(function(){
	    $("#img").hide();
	    $("#font").show();
	})
	//鼠标离开，文字消失，图片显示。
	$(".top_e").mouseout(function(){
	    $("#font").hide();
	    $("#img").show();
	})
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<link rel="stylesheet" href="./lib/layui/css/layui.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

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
									<li><a
										href="favorite.jsp?name=<%=session.getAttribute("name")%>"><span
											class="icon icon-heart-o" title="我的收藏"></span></a></li>
								</ul>
							</div>
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
								<li><a href="shop.jsp?kw=手机数码">手机数码</a></li>
								<li><a href="shop.jsp?kw=生活百货">生活百货</a></li>
								<li><a href="shop.jsp?kw=女装">女装</a></li>
								<li><a href="shop.jsp?kw=女鞋">女鞋</a></li>
								<li><a href="shop.jsp?kw=美妆<">美妆</a></li>
								<li><a href="shop.jsp?kw=男装">男装</a></li>
								<li><a href="shop.jsp?kw=男鞋">男鞋</a></li>
								<li><a href="shop.jsp?kw=家用电器">家用电器</a></li>
								<li><a href="shop.jsp?kw=运动户外">运动户外</a></li>
								<li><a href="shop.jsp?kw=家具/饰品">家具/饰品</a></li>
								<li><a href="shop.jsp?kw=整车/车品">整车/车品</a></li>
								<li><a href="shop.jsp?kw=游戏装备">游戏装备</a></li>
								<li><a href="shop.jsp?kw=宠物用品">宠物用品</a></li>
								<li><a href="shop.jsp?kw=乐器">乐器</a></li>
								<li><a href="shop.jsp?kw=卡券交易">卡券交易</a></li>
								<li><a href="shop.jsp?kw=书籍交易">书籍交易</a></li>
							</ul></li>
						<li><a href="shop.jsp">附近</a></li>
						<li class="has-children"><a href="javascript:(0)">技能服务/跑腿</a>
							<ul class="dropdown">
								<li><a href="shop.jsp?kw=闲置出租">闲置出租</a></li>
								<li><a href="shop.jsp?kw=快递代拿">快递代拿</a></li>
								<li><a href="shop.jsp?kw=PPT/PS/PR等">PPT/PS/PR等</a></li>
								<li><a href="shop.jsp?kw=兼职">兼职</a></li>
								<li><a href="shop.jsp?kw=校园拼车">校园拼车</a></li>
								<li><a href="shop.jsp?kw=其他">其他</a></li>
							</ul></li>
						<li><a href="contact.jsp">联系我们</a></li>
						<li><a href="about.jsp">关于我们</a></li>
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
							class="text-black">付款页面</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 mb-5 mb-md-0">
						<h2 class="h3 mb-3 text-black">订单详情</h2>
						<div>
							<div>
								<a href="javascript:(0)" onclick="selectAddress()">选择常用地址</a>
							</div>
							<form class="layui-form">
								<input type="hidden" id="uid" name="seller_id" />
								<div
									style="border: 1px solid; margin: 30px; border-color: gray; text-align: center;">
									<img src="" alt="image" id="p_pic" name="p_picture"
										style="height: 261px;">
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_fname" class="text-black">姓名 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="receive_name" name="buyer_name">
									</div>
									<div class="col-md-6">
										<label for="c_lname" class="text-black">联系电话 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="telephone" name="telephone">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black">地址 <span
											class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="address"
											name="address">
									</div>
								</div>

								<div class="form-group row"
									style="font-size: larger; color: indigo;">
									<div class="col-md-6">
										<label for="c_fname" class="text-black">单价</label> <b><span
											id="price"></span></b>
									</div>
									<div class="col-md-6">
										<label for="c_lname" class="text-black">数量 </label> <b><span
											id="quantity"></span></b>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black"><b
											style="font-size: x-large;">实付款:</b></label> <span
											style="color: red; font-size: x-large;"><b id="total"></b>&emsp;</span>(含运费：￥<span
											id="delievery1"></span>.00)
									</div>
									<div class="col-md-12" style="text-align: center;">
										<button lay-submit
											class="layui-btn layui-btn-lg layui-btn-danger">立即付款</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="./lib/layui/layui.js"></script>
	<script src="js/checkout.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form, layer = layui.layer;
			form.on('submit()', function(data) {
				var param = data.field;
				var jsonStr = {
					"pid" : id,
					"price" : price,
					"delivery" : delivery,
					"quantity" : quantity,
					"total" : total,
					"seller_name" : seller_name,
					"p_name" : p_name,
					"p_pictrue" : p_picture,
					"category" : category,
					"address" : param.address,
					"buyer_name" : param.buyer_name,
					"seller_id" : param.seller_id,
					"telephone" : param.telephone
				}
				console.log(jsonStr)
				var jsonobj = JSON.stringify(jsonStr)
				console.log("发送到server的信息:" + JSON.stringify(jsonStr))
				$.ajax({
							url : "/weibao/order/add",
							type : "post",
							data : jsonStr,
							async : false,
							success : function(res) {
								console.log(res)
								var jsonObj = JSON.parse(res);
								console.log("server返回值：" + jsonObj)
								if (jsonObj.status == "success") {
									layer.load(4, {time: 2*1000})
									//关闭当前frame
									parent.location.href = "thankyou.jsp?oid="
											+ jsonObj.oid;
									var index = parent.layer
											.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index)
								} else {
									layer.alert('付款失败！！！', {
										icon : 5
									});
								}
							},
							error : function() {
								layer.alert('付款失败！！！', {
									icon : 5
								});
							}
						})
				return false;
			})
		})

		var data = location.search.substring(1);
		var data_arr = data.split('&')
		console.log(data_arr)
		var id = data_arr[0].split('=')[1];
		var price = data_arr[1].split('=')[1];
		var delivery = data_arr[2].split('=')[1];
		var quantity = data_arr[3].split('=')[1];
		var uid = data_arr[4].split('=')[1];
		var seller_name = data_arr[5].split('=')[1];
		var p_name = data_arr[6].split('=')[1];
		var p_picture = data_arr[7].split('=')[1];
		var category = data_arr[8].split('=')[1];
		var total = price * quantity + parseInt(delivery);

		console.log("产品id:", id)
		console.log("产品名称:", p_name)
		console.log("产品类型:", category)
		console.log("产品图片url:", p_picture)
		console.log("产品单价:", price)
		console.log("产品数量:", quantity)
		console.log("产品运费:", delivery)
		console.log("商品发布人id:", uid)
		console.log("实际付款:", total)
		$('#uid').val(uid)
		$('#total').html('￥' + total + ".00")
		$('#p_pic').attr('src', p_picture)
		$('#delievery1').html(delivery)
		$('#price').html('￥' + price + ".00")
		$('#quantity').html(quantity)

		function selectAddress() {
			layui.use([ 'layer' ], function() {
				var layer = layui.layer;
				layer.open({
					type : 2,
					title : '选择地址',
					content : 'selectAddress.html',
					area : [ '1350px', '600px' ]
				});
			})
		}

		/*
		 *接收子页面返回的address值
		 */
		function return_selectedAddr(receive_name, tel, addr) {
			console.log("from子页面接的值：", receive_name, tel, addr)
			$('#receive_name').val(receive_name)
			$('#telephone').val(tel)
			$('#address').val(addr)
		}

		/*
		 * 初始化获取默认地址
		 */
		$.ajax({
			url : "/weibao/address/get_default",
			async : false,
			type : "post",
			success : function(res) {
				var jsonObj = JSON.parse(res);
				var addrObj = jsonObj.address;
				console.log("server return-->", jsonObj)
				if (jsonObj.status == "success") {
					$('#receive_name').val(addrObj.receive_name)
					$('#telephone').val(addrObj.telephone)
					$('#address').val(addrObj.address + "-" + addrObj.detail)
				} else {
					layui.use([ 'layer' ], function() {
						var layer = layui.layer;
						layer.msg('您还没有设置默认地址！', {
							icon : 5
						})
					})
				}
			},
			error : function(res) {
				console.log("系统错误！！！")
			}
		})
	</script>
</body>
</html>

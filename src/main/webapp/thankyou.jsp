<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" style="overflow-x: hidden;">
<head>
<title>变废为宝-WEIBAO！Thankyou</title>
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
							<form action="" class="site-block-top-search">
								<span class="icon icon-search2"></span> <input type="text"
									class="form-control border-0" placeholder="Search">
							</form>
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
												onclick="xadmin.open('登陆窗口','login_layer.jsp','','',true)">登录</a></li>
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
								<li><a href="shop.jsp?kw=手机数码">手机数码</a></li>
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
						<li class="has-children"><a href="href="javascript:(0)">技能服务/跑腿</a>
							<ul class="dropdown">
								<li><a href="shop.jsp?kw=free">闲置出租</a></li>
								<li><a href="shop.jsp?kw=delivery">快递代拿</a></li>
								<li><a href="shop.jsp?kw=computer">PPT/PS/PR等</a></li>
								<li><a href="shop.jsp?kw=job">兼职</a></li>
								<li><a href="shop.jsp?kw=car">校园拼车</a></li>
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
							class="text-black">付款成功</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<span class="icon-check_circle display-3 text-success"></span>
						<h2 class="display-3 text-black">Thank you!</h2>
						<p class="lead mb-5">您的订单已经支付完成！</p>
						<p class="lead mb-5">
							<a href="javascript:(0)" id="watch—order">点击查看您的订单</a>
						</p>
						<p>
							<a href="shop.jsp" class="btn btn-sm btn-primary">返回购物页面</a>
						</p>
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
	<script type="text/javascript">
		layui.use([ 'layer' ], function() {
			var param = location.search.substring(1);
			var oid = param.split("=")[1];
			//var index = layer.load(3, {time: 2*1000}); //又换了种风格，并且设定最长等待10秒 
			console.log("oid:" + oid)

			$('#watch—order').click(
					function() {
						xadmin.open('订单详情', 'record_detail.jsp?oid=' + oid, '',
									'', true);
					})
			$.ajax({
				url : "/weibao/order/setStatus",
				data : {
					"oid" : oid
				},
				async : false,
				type : "post",
				success : function(res) {
					console.log(res)
				},
				error : function(res) {
					layer.alert('付款失败！！！', {
						icon : 5
					});
				}
			})
		})

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
	</script>

</body>
</html>
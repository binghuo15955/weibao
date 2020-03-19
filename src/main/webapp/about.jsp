<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>关于WEIBAO</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
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
						<li><a href="contact.html">联系我们</a></li>
						<li><a href="about.html">关于我们</a></li>
					</ul>
				</div>
			</nav>
		</header>

			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0"><a href="index.jsp">首页</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">关于我们</strong></div>
					</div>
				</div>
			</div>

			<div class="site-section border-bottom" data-aos="fade">
				<div class="container">
					<div class="row mb-5">
						<div class="col-md-6">
							<div class="block-16">
								<figure>
									<img src="images/blog_1.jpg" alt="Image placeholder" class="img-fluid rounded">
									<a href="https://vimeo.com/channels/staffpicks/93951774" class="play-button popup-vimeo"><span class="ion-md-play"></span></a>

								</figure>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-5">


							<div class="site-section-heading pt-3 mb-4">
								<h2 class="text-black">How We Started</h2>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius repellat, dicta at laboriosam, nemo
								exercitationem itaque eveniet architecto cumque, deleniti commodi molestias repellendus quos sequi hic fugiat
								asperiores illum. Atque, in, fuga excepturi corrupti error corporis aliquam unde nostrum quas.</p>
							<p>Accusantium dolor ratione maiores est deleniti nihil? Dignissimos est, sunt nulla illum autem in, quibusdam
								cumque recusandae, laudantium minima repellendus.</p>

						</div>
					</div>
				</div>
			</div>

			<div class="site-section border-bottom" data-aos="fade">
				<div class="container">
					<div class="row justify-content-center mb-5">
						<div class="col-md-7 site-section-heading text-center pt-4">
							<h2>我 们 的 优 势</h2>
						</div>
					</div>
					<div class="row">
						<div class="site-section site-section-sm site-blocks-1">
							<div class="container">
								<div class="row">
									<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
										<div class="icon mr-4 align-self-start">
											<span class="icon-truck"></span>
										</div>
										<div class="text">
											<h2 class="text-uppercase">信任问题<br>Trust</h2>
											<p>我们向您承诺，所有的用户都是经过实名认证的，我们能保证您的交易过程一定安全，并且保障您的一切权益。</p>
										</div>
									</div>
									<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
										<div class="icon mr-4 align-self-start">
											<span class="icon-refresh2"></span>
										</div>
										<div class="text">
											<h2 class="text-uppercase">交易过程<br>transaction</h2>
											<p>使用我们，不用担心你的商品内容被刷新掉，从而避免您频繁的回复每个顾客商品信息</p>
										</div>
									</div>
									<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
										<div class="icon mr-4 align-self-start">
											<span class="icon-help"></span>
										</div>
										<div class="text">
											<h2 class="text-uppercase">浏览量<br>browse volume</h2>
											<p>我们比QQ群的浏览量高，我们只专注于校园附近范围，所以您的信息优先级将会大大提高，从而大幅度提高曝光率和交易可能。</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-12" style="text-align: center;">
				<a href="#">回到顶部</a>
			</div>

		</div>

		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/aos.js"></script>

		<script src="js/main.js"></script>

	</body>
</html>

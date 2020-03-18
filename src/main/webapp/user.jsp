<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>个人中心</title>
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

							<div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">

							</div>

							<div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
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
											<li><a
												href="favorite.jsp?name=<%=session.getAttribute("name")%>"><span
													class="icon icon-heart-o" title="我的收藏"></span></a></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<div class="site-top-icons">
										<ul>
											<li><a href="javascript:(0)"
												onclick="xadmin.open('登陆窗口','login_layer.jsp','','',true)">登录</a></li> &emsp;
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
				<nav class="site-navigation text-right text-md-center" role="navigation">
					<div class="container">
						<ul class="site-menu js-clone-nav d-none d-md-block">
							<a href="index.jsp">首页</a>
							<li class="has-children">
								<a href="javascript:(0)">分类</a>
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
								</ul>
							</li>
							<li><a href="shop.jsp">附近</a></li>
							<li class="has-children">
								<a href="javascript:(0)">技能服务/跑腿</a>
								<ul class="dropdown">
									<li><a href="shop.jsp?kw=free">闲置出租</a></li>
									<li><a href="shop.jsp?kw=delivery">快递代拿</a></li>
									<li><a href="shop.jsp?kw=computer">PPT/PS/PR等</a></li>
									<li><a href="shop.jsp?kw=job">兼职</a></li>
									<li><a href="shop.jsp?kw=carsharing">校园拼车</a></li>
									<li><a href="shop.jsp?kw=others">其他</a></li>
								</ul>
							</li>
							<li><a href="contact.html">联系我们</a></li>
							<li><a href="about.html">关于我们</a></li>
						</ul>
					</div>
				</nav>
			</header>

			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0"><a href="index.jsp">首页</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">个人中心</strong>	
						</div>
					</div>
				</div>
			</div>

			<div class="site-section">
				<div class="container">
					<div class="row mb-5">
						<div class="col-md-9 order-2">

							<div class="row">
								<div class="layui-tab-content">
								    <div class="layui-tab-item layui-show">
								        <iframe src='personal.jsp' frameborder="0" scrolling="yes" class="x-iframe" style="width: 1000px;height: 1500px;"></iframe>
								    </div>
								</div>
							</div>
							
						</div>

						<div class="col-md-3 order-1 mb-5 mb-md-0">
							<div class="border p-4 rounded mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">账号管理</h3>
								<ul class="list-unstyled mb-0"><!-- 获取该分类的总数 -->
									<li class="mb-1"><a href="javascript:(0)" class="d-flex" onclick="add_tab('personal.jsp')">个人资料</a></li>
									<li class="mb-1"><a href="javascript:(0)" class="d-flex" onclick="add_tab('mypost.jsp')">我的发布</a></li>
									<li class="mb-1"><a href="javascript:(0)" class="d-flex" onclick="add_tab('edit_password.jsp')">修改密码</a></li>
									<li class="mb-1"><a href="javascript:(0)" class="d-flex" onclick="add_tab('history.jsp')">我的足迹</a></li>
									<li class="mb-1"><a href="javascript:(0)" class="d-flex" onclick="add_tab('favorite.jsp')">我的收藏</a></li>
									<li class="mb-1"><a href="javascript:(0)" class="d-flex" onclick="add_tab('address.jsp')">收货地址</a></li>
								</ul>
							</div>
						</div>
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
		<script src="js/user.js"></script>
	</body>
</html>

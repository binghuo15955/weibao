<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>变废为宝-WEIBAO！</title>
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
<link rel="stylesheet" href="css/shop-single.css">
<link rel="stylesheet" href="css/top.css">
<style type="text/css">
#a ul li {
	display: none
}

#a ul li:hover li {
	display: list-item;
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
											<li><a href="login.jsp">登录</a></li> &emsp;
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
								<li><a href="shop.jsp?kw=car">校园拼车</a></li>
								<li><a href="shop.jsp?kw=others">其他</a></li>
							</ul></li>
						<li><a href="contact.html">联系我们</a></li>
						<li><a href="about.html">关于我们</a></li>
					</ul>
				</div>
			</nav>
		</header>

		<div class="site-blocks-cover"
			style="background-image: url(images/hero_1.jpg);" data-aos="fade">
			<div class="container">
				<div
					class="row align-items-start align-items-md-center justify-content-end">
					<div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
						<h1 class="mb-2">让资源得到充分的利用</h1>
						<div class="intro-text text-center text-md-left">
							<p class="mb-4">无论您是卖家还是买家，我们都有健全的信用机制保证您的交易安全和产品质量；无论您是需要帮助的人还是帮助别人的人，我们都为您提供了平台！
							</p>
							<p>
								<a href="shop.jsp" class="btn btn-sm btn-primary">开始购物！</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="site-section site-blocks-2">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>热 门 分 类</h2>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
						data-aos="fade" data-aos-delay="">
						<a class="block-2-item" href="shop.jsp?kw=">
							<figure class="image">
								<img src="images/women.jpg" alt="" class="img-fluid">
							</figure>
							<div class="text">
								<span class="text-uppercase">美妆/女装/女鞋</span>
								<h3>女生入口</h3>
							</div>
						</a>
					</div>
					<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
						data-aos="fade" data-aos-delay="100">
						<a class="block-2-item" href="shop.jsp?kw=">
							<figure class="image">
								<img src="images/children.jpg" alt="" class="img-fluid">
							</figure>
							<div class="text">
								<span class="text-uppercase">玩具</span>
								<h3>小孩入口</h3>
							</div>
						</a>
					</div>
					<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
						data-aos="fade" data-aos-delay="200">
						<a class="block-2-item" href="shop.jsp?kw=">
							<figure class="image">
								<img src="images/men.jpg" alt="" class="img-fluid">
							</figure>
							<div class="text">
								<span class="text-uppercase">男装/男鞋/健身器材</span>
								<h3>男生入口</h3>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>最 新 添 加</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel" id="latest_add"></div>
					</div>
				</div>
			</div>
		</div>

		<div id="return-top" class="top_e">
			<img src="./images/top.png" width="60" id="img">
			<div style="width: 60px; margin: auto;">
				<p id='font'
					style="font-size: 20px; margin-left: 10px; margin-bottom:10px;display: none;">
					返回<br>顶部
				</p>
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
	<scirpt src="js/top.js"></scirpt>
	<script src="js/main.js"></script>
	<script type="text/javascript" src="./lib/layui/layui.js"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>
	<script src="js/nav.js"></script>
	<script type="text/javascript">
		$
				.ajax({
					url : "/weibao/product/getLatestProducts",
					type : "post",
					async : false,
					success : function(res) {
						var jsonObj = JSON.parse(res);
						products = jsonObj.products;
						console.log("server-->", jsonObj.products);
						var content = "";
						for (var i = 0; i < products.length; i++) {
							var src = "images/no-picture.png"
							var pic_name = "none"
							//console.log("length:"+products[i].pictureSet.length)
							if (products[i].pictureSet.length != 0
									&& products[i].pictureSet != []) {
								var picurl = products[i].pictureSet[0].picurl;
								var pic_arr = picurl.split("\\")
								src = pic_arr[pic_arr.length - 2] + "/"
										+ pic_arr[pic_arr.length - 1]
								pic_name = pic_arr[pic_arr.length - 1];
								console.log(src)
							}
							content += '<div class="item">'
									+ '	<a href="shop-single.jsp?id='
									+ products[i].id
									+ '&uid='
									+ products[i].uid
									+ '">'
									+ '<div class="block-4 text-center">'
									+ '	<figure class="block-4-image">'
									+ '	<img src="'+src+'" alt="Image placeholder" style="width:346.66px;height:346.66px;"'
					+'		class="img-fluid">	'
									+ '</figure>	'
									+ '<div class="block-4-text p-4">'
									+ '	<h3>'
									+ products[i].name
									+ '</h3>'
									+ '	<p class="text-primary font-weight-bold">￥'
									+ products[i].current_price
									+ '</p>'
									+ '	<p class="mb-0">'
									+ products[i].u_name
									+ '&emsp;信用分'
									+ products[i].u_credit
									+ '</p>'
									+ '</div>'
									+ '</div>'
									+ '</a>'
									+ '	</div>'
						}
						$('#latest_add').append(content);
						console.log("获取最近product成功！！")
					},
					error : function(res) {
						console.log("获取失败！！")
					}
				})
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

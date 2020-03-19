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
<link rel="stylesheet" href="css/top.css">
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
						<a href="index.jsp">首页</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">所有商品</strong>
						<div class="col-md-6" style="float: right;">
							<form class="site-block-top-search">
								<span class="icon icon-search2" style="padding-left: 10px"></span>
								<input type="text" id="search" name="search"
									class="form-control border-0" placeholder="输入你想要的宝贝名称">
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row mb-5">

					<div class="col-md-9 order-2">

						<div class="row">
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">
										<a href="shop.jsp">查看所有商品</a><span id="categories"></span>
									</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOrder" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">排序</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="javascript:(0) "
												onclick="selectByOrder(this)">---</a> <a
												class="dropdown-item" href="javascript:(0)"
												onclick="selectByOrder(this)">浏览量从高到低</a> <a
												class="dropdown-item" href="javascript:(0)"
												onclick="selectByOrder(this)">信用从高到低</a>
										</div>
									</div>
									<div class="btn-group">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuReference" data-toggle="dropdown">价格</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item" href="javascript:(0) "
												onclick="selectByPrice(this)">---</a> <a
												class="dropdown-item" href="javascript:(0)"
												onclick="selectByPrice(this)">按照价格从低到高</a> <a
												class="dropdown-item" href="javascript:(0)"
												onclick="selectByPrice(this)">按照价格从高到低</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5" id="products"></div>
						<!-- <div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><a href="#">&lt;</a></li>
										<li class="active"><span>1</span></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div> -->
					</div>

					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">分类</h3>
							<ul class="list-unstyled mb-0" id="count_category">
								<!-- 获取该分类的总数 -->
								<!-- <li class="mb-1"><a href="shop.jsp?kw=手机数码" class="d-flex"><span>手机数码</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=生活百货" class="d-flex"><span>生活百货</span>
										<span class="text-black ml-auto">(2,550)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=女装" class="d-flex"><span>女装</span>
										<span class="text-black ml-auto">(2,124)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=女鞋" class="d-flex"><span>女鞋</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=美妆" class="d-flex"><span>美妆</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=男装" class="d-flex"><span>男装</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=男鞋" class="d-flex"><span>男鞋</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=家用电器" class="d-flex"><span>家用电器</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=运动户外" class="d-flex"><span>运动户外</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=家具/饰品" class="d-flex"><span>家具/饰品</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=整车/车品" class="d-flex"><span>整车/车品</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=游戏装备" class="d-flex"><span>游戏装备</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=宠物用品" class="d-flex"><span>宠物用品</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=乐器" class="d-flex"><span>乐器</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=卡券交易" class="d-flex"><span>卡券交易</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=闲置出租" class="d-flex"><span>闲置出租</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=快递代拿" class="d-flex"><span>快递代拿</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=PPT/PS/PR等"
									class="d-flex"><span>PPT/PS/PR等</span> <span
										class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=兼职" class="d-flex"><span>兼职</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=校园拼车" class="d-flex"><span>校园拼车</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="shop.jsp?kw=其他" class="d-flex"><span>其他</span>
										<span class="text-black ml-auto">(2,220)</span></a></li> -->
							</ul>
						</div>

						<!-- <div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">价格区间</h3>
								<div id="slider-range" class="border-primary" ></div>
								<input type="text" name="amount" id="amount"
									class="form-control border-0 pl-0 bg-white" disabled="" />
							</div>
						</div> -->
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
	<script>
		var page, limit = "12";
		var products, count;
		var condition = "", price = "", key = "", value = "";
		var request = getRequest();

		console.log("request:", request)

		function load_products(mappingurl){
		layui.use('flow',function() {
			var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
			var flow = layui.flow;
			$('#products').html('')
			flow.load({
						elem : '#products' //指定列表容器
						,
						done : function(page, next) { //到达临界点（默认滚动触发），触发下一页
							var lis = [];
							$
									.ajax({
										url : "/weibao/shop/"+mappingurl,
										type : "post",
										async : false,
										data : {
											"category" : location.search.substring(4),
											"name":name,
											"key" : key,
											"value" : value,
											"condition" : condition,
											"price" : price,
											"page" : page,
											"limit" : "12"
										},
										success : function(res) {
											var jsonObj = JSON.parse(res);
											console.log("server返回的数据:",jsonObj)
											if(mappingurl=="getbyName"){
												$('#search').val(jsonObj.name)
												console.log("查询成功")
											}else if(mappingurl=="getbyCondition"){
												$('#search').val(jsonObj.name)
												console.log("排序成功")
											}
											var products = jsonObj.products;
											console.log("products:",products)
											//假设你的列表返回在data集合中
											layui
													.each(
															products,   
															function(index,item) {
																var src="images/no-picture.png";
																if(item.pictureSet.length>0){
																	console.log(item.pictureSet)
																	src=item.pictureSet[0].picurl;
																	src=src.split("webapp\\")[1];
																}
																lis.push('<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">'
																		+ '<div class="block-4 text-center border">'
																		+ '<figure class="block-4-image">'
																		+ '	<a href="shop-single.jsp?id='
																		+ item.id
																		+ '&uid='
																		+ item.uid
																		+ '"><img src="'+src+'"'
															+'	style="height: 160.64px;"	alt="图片暂时无法显示" class="img-fluid"></a>'
																		+ '</figure>'
																		+ '<div class="block-4-text p-4">'
																		+ '	<h3>'
																		+ '		<a href="shop-single.jsp">'
																		+ item.name
																		+ '</a>'
																		+ '	</h3>'
																		+ '	<p class="text-primary font-weight-bold">￥'
																		+ item.current_price
																		+ '</p>' + '</div>' + '</div>'
																		+ '</div>');
															});

											//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
											//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
											next(lis.join(''),page < jsonObj.count);

											console.log("再次获取product成功！")
										},
										error : function(res) {
											$('#products').html('暂无此类商品')
											console.log("再次获取products失败！")
										}
									})

						}
					});
		});
	}
		
		//分类的计数
		$.ajax({
			url : "/weibao/shop/countCategory",
			type : "post",
			async : false,
			success : function(res) {
				if (res != null) {
					var jsonObj = JSON.parse(res);
					var cc = jsonObj.categoryCounts;
					console.log("server-->", jsonObj.categoryCounts)
					for (var i = 0; i < cc.length; i++) {
						$('#count_category').append(
								'<li class="mb-1"><a href="shop.jsp?kw='
										+ cc[i].category
										+ '" class="d-flex"><span>'
										+ cc[i].category + '</span>'
										+ '<span class="text-black ml-auto">('
										+ cc[i].count + ')</span></a></li>')
					}
					console.log("获取分类数据成功！")
				}
			},
			error : function(res) {
				console.log("获取分类数据失败!")
			}
		})

		if ((request.kw != null && request.kw != "")
				|| (JSON.stringify(request) == JSON.stringify({}))) {
			console.log("-->进入kw")
			load_products("getbyCategory");
			var kw = location.search.substring(4);
			console.log("kw:", kw)
			switch (kw) {
			case "%E6%89%8B%E6%9C%BA%E6%95%B0%E7%A0%81":
				$('#categories').html("->手机数码");
				break;
			case "%E7%94%9F%E6%B4%BB%E7%99%BE%E8%B4%A7":
				$('#categories').html("->生活百货");
				break;
			case "%E5%A5%B3%E8%A3%85":
				$('#categories').html("->女装");
				break;
			case "%E5%A5%B3%E9%9E%8B":
				$('#categories').html("->女鞋");
				break;
			case "%E7%BE%8E%E5%A6%86":
				$('#categories').html("->美妆");
				break;
			case "%E7%94%B7%E8%A3%85":
				$('#categories').html("->男装");
				break;
			case "%E7%94%B7%E9%9E%8B":
				$('#categories').html("->男鞋");
				break;
			case "%E5%AE%B6%E7%94%A8%E7%94%B5%E5%99%A8":
				$('#categories').html("->家用电器");
				break;
			case "%E8%BF%90%E5%8A%A8%E6%88%B7%E5%A4%96":
				$('#categories').html("->运动户外");
				break;
			case "%E5%AE%B6%E5%85%B7/%E9%A5%B0%E5%93%81":
				$('#categories').html("->家具/饰品");
				break;
			case "%E6%95%B4%E8%BD%A6/%E8%BD%A6%E5%93%81":
				$('#categories').html("->整车/车品");
				break;
			case "%E6%B8%B8%E6%88%8F%E8%A3%85%E5%A4%87":
				$('#categories').html("->游戏装备");
				break;
			case "%E5%AE%A0%E7%89%A9%E7%94%A8%E5%93%81":
				$('#categories').html("->宠物");
				break;
			case "%E4%B9%90%E5%99%A8":
				$('#categories').html("->乐器");
				break;
			case "%E5%8D%A1%E5%88%B8%E4%BA%A4%E6%98%93":
				$('#categories').html("->卡券交易");
				break;
			case "%E4%B9%A6%E7%B1%8D%E4%BA%A4%E6%98%93":
				$('#categories').html("->书籍交易");
				break;
			case "%E9%97%B2%E7%BD%AE%E5%87%BA%E7%A7%9F":
				$('#categories').html("->闲置出租");
				break;
			case "%E5%BF%AB%E9%80%92%E4%BB%A3%E6%8B%BF":
				$('#categories').html("->快递代拿");
				break;
			case "PPT/PS/PR%E7%AD%89":
				$('#categories').html("->PPT/PS/PR等");
				break;
			case "%E5%85%BC%E8%81%8C":
				$('#categories').html("->兼职");
				break;
			case "%E6%A0%A1%E5%9B%AD%E6%8B%BC%E8%BD%A6":
				$('#categories').html("->校园拼车");
				break;
			case "%E5%85%B6%E4%BB%96":
				$('#categories').html("->其他");
				break;
			default:
				break;
			}
		} else if (request.search != null && request.search != "") {
			console.log("-->进入search")
			console.log("search:", location.search.substring(8))
			var name = location.search.substring(8);
			/* $.ajax({
				url : "/weibao/shop/getbyName",
				type : "post",
				async : false,
				data : {
					"name" : name,
					"page" : "1",
					"limit" : "12"
				},
				success : function(res) {
					OUTPUT_Products(res);
					var jsonObj = JSON.parse(res);
					//console.log("jsonObj.name:"+jsonObj.name)
					$('#search').val(jsonObj.name)
					console.log("搜索成功")
				},
				error : function(res) {
					console.log("搜索失败")
				}
			}) */

			load_products("getbyName");
		}//end if

		function selectByOrder(obj) {
			var kw = location.search.substring(1);
			var select_title = $(obj)[0].innerHTML;
			console.log("keyword:", kw)//kw=daily
			if ("浏览量从高到低" == select_title) {//ajax order
				$("#dropdownMenuOrder").text(select_title)
				condition = "count";
				console.log("condition:", condition + "||" + "price:", price)
				selectByCondition();
			} else if ("信用从高到低" == select_title) {//ajax credit
				$("#dropdownMenuOrder").text(select_title)
				condition = "credit";
				console.log("condition:", condition + "||" + "price:", price)
				selectByCondition();
			} else {
				$("#dropdownMenuOrder").text("排序")
				condition = "";
				console.log("condition:", condition + "||" + "price:", price)
				selectByCondition();
			}
		}

		function selectByPrice(obj) {
			var select_title = $(obj)[0].innerHTML;
			var kw = location.search.substring(1);
			console.log("keyword:", kw)//kw=daily
			if ("按照价格从低到高" == select_title) {//ajax pricel2h
				$("#dropdownMenuReference").text(select_title)
				price = "up";
				console.log("condition:", condition + "||" + "price:", price)
				selectByCondition();
			} else if ("按照价格从高到低" == select_title) {//ajax priceh2l
				$("#dropdownMenuReference").text(select_title)
				price = "down";
				console.log("condition:", condition + "||" + "price:", price)
				selectByCondition();
			} else {
				$("#dropdownMenuReference").text("价格")
				price = "";
				console.log("condition:", condition + "||" + "price:", price)
				selectByCondition();
			}
		}

		function selectByCondition() {
			console.log("-->进入排序")
			if ($('#search').val() != null && $('#search').val() != '') {
				key = "name"
				value = $('#search').val();
			} else if (kw != null && kw != '') {
				key = "category"
				value = kw
			}
			console.log("category:", kw + "||" + "name:", $('#search').val())
			console.log("condition:", condition + "||" + "price:", price)
			/* $.ajax({
				url : "/weibao/shop/getbyCondition",
				async : false,
				type : "post",
				data : {
					"key" : key,
					"value" : value,
					"condition" : condition,
					"price" : price,
					"page" : "1",
					"limit" : "12"
				},
				success : function(res) {
					var jsonObj = JSON.parse(res)
					$('#search').val(jsonObj.name)
					OUTPUT_Products(res)
					console.log("排序查询成功")
				},
				error : function(res) {
					console.log("排序查询成功")
					console.log(res)
				}

			}) */
			
			load_products("getbyCondition");
		}

		function getRequest() {
			var url = location.search; //获取url中"?"符后的字串
			var theRequest = new Object();
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				for (var i = 0; i < strs.length; i++) {
					theRequest[strs[i].split("=")[0]] = unescape(strs[i]
							.split("=")[1]);
				}
			}
			return theRequest;
		}

		/* function OUTPUT_Products(res) {
			var jsonObj = JSON.parse(res);
			products = jsonObj.products;
			count = jsonObj.count;
			console.log("server-->", jsonObj.products);
			console.log("server-->", jsonObj.count);
			if (res != null) {
				$('#products').html("")
				for (var i = 0; i < products.length; i++) {
					var src = "images/shoe.png"
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
					$('#products')
							.append(
									'<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">'
											+ '<div class="block-4 text-center border">'
											+ '<figure class="block-4-image">'
											+ '	<a href="shop-single.jsp?id='
											+ products[i].id
											+ '&uid='
											+ products[i].uid
											+ '"><img src="'+src+'"'
								+'	style="height: 160.64px;"	alt="'+pic_name+'" class="img-fluid"></a>'
											+ '</figure>'
											+ '<div class="block-4-text p-4">'
											+ '	<h3>'
											+ '		<a href="shop-single.jsp">'
											+ products[i].name
											+ '</a>'
											+ '	</h3>'
											+ '	<p class="text-primary font-weight-bold">￥'
											+ products[i].current_price
											+ '</p>' + '</div>' + '</div>'
											+ '</div>')
				}
				console.log("加载成功!!!!")
			} else {
				layer.msg("加载失败！！！", {
					icon : 5,
					time : 700
				})
			}
		} */
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

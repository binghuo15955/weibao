<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.2</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<link rel="stylesheet" href="./css/record.css">
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<form class="layui-form layui-col-space5" id="myform">
							<fieldset
								class="layui-elem-field layui-field-title site-demo-button">
								<legend>购买记录</legend>
							</fieldset>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="pname_oid_search" name="pname_oid_search"
									placeholder="通过商品名称或订单号进行搜索" autocomplete="off">
								<button class="layui-btn" lay-submit
									lay-filter="name_oid_search">
									<i class="layui-icon">&#xe615;搜索</i>
								</button>
								&emsp; <a href="javascript:(0)" onclick="extendSearch()"
									id="extend">更多搜索条件↓</a>
							</div>
							<div class="layui-row layui-col-space10" id="extend_search"
								style="display: none; margin-top: 15px;">
								<div class="layui-col-md4" style="float: left">
									<span style="font-size: small; padding-left: 10px;">成交时间</span>
									<div class="layui-inline layui-show-xs-block">
										<input type="text" id="start_time_search"
											name="start_time_search" placeholder="请选择开始日期"
											autocomplete="off" class="layui-input" style="width: 154px;">
									</div>
									——
									<div class="layui-inline layui-show-xs-block">
										<input type="text" id="end_time_search" name="end_time_search"
											placeholder="请选择结束日期" autocomplete="off" class="layui-input"
											style="width: 154px;">
									</div>
								</div>
								<div class="layui-col-md1" style="line-height: 31px;">
									<span style="font-size: small; padding-left: 10px;">交易状态</span>
								</div>
								<div class="layui-col-md3">
									<div style="width: 159px;">
										<select id="status_search" name="status_search">
											<option value="">全部</option>
											<option value="1">等待买家付款</option>
											<option value="2">付款确认中</option>
											<option value="3">买家已付款</option>
											<option value="4">卖家已发货</option>
											<option value="5">交易成功</option>
											<option value="6">交易关闭</option>
											<option value="7">退款中的订单</option>
										</select>
									</div>
								</div>
								<div class="layui-col-md4">
									<div>
										<span style="font-size: small; padding-left: 10px;">卖家名称</span>
										<div class="layui-inline layui-show-xs-block">
											<input type="text" id="seller_name_search"
												name="seller_name_search" placeholder="输入卖家名称查询"
												autocomplete="off" class="layui-input">
										</div>
										<button class="layui-btn" lay-submit id="extend_search"
											lay-filter="extend_search">
											<i class="layui-icon">&#xe615;</i>
										</button>
										<button type="button" class="layui-btn">
											<i class="layui-icon" onclick="clearform()">清空所有条件</i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="layui-card-body layui-table-body layui-table-main">
						<table class="layui-table layui-form" id="showRecord"></table>
					</div>
					<div class="layui-card-body "></div>
				</div>
			</div>
		</div>
	</div>
</body>

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
	var c = 0;
	function extendSearch() {
		if (c % 2 == 0) {
			$('#extend_search').css("display", "")
			$('#extend').html('精简筛选条件↑')
			$('#extend').attr('id', 'close');
			c++;
		} else {
			$('#extend_search').css("display", "none")
			$('#close').html('更多搜索条件↓')
			$('#close').attr('id', 'extend');
			c++;
		}
	}
	function clearform() {
		$('#myform')[0].reset();
	}
</script>
<script>
	layui
			.use(
					[ 'laydate', 'form', 'table', 'jquery', 'laypage', 'layer' ],
					function() {
						var laydate = layui.laydate;
						var form = layui.form;
						var table = layui.table;
						var $ = layui.jquery;
						var laypage = layui.laypage, layer = layui.layer

						laydate.render({
							elem : '#start_time_search'
						});

						laydate.render({
							elem : '#end_time_search'
						});

						table.on('tool', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
							var data = obj.data; //获得当前行数据
							var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
							var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

							if (layEvent === 'del') { //删除
								layer.confirm('确认删除吗？', function(index) {
									obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
									layer.close(index);
									//向服务端发送删除指令
									$.ajax({
										url : "/weibao/order/del",
										type : 'post',//method请求方式，get或者post
										data : data,
										dataType : "text",
										async : false,
										success : function(data) {//res为相应体,function为回调函数
											if (data == "success") {
												layer.msg('已删除!', {
													icon : 1,
													time : 1000
												});
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
							} else if (layEvent === 'detail') { //查看详情
								//do something
								parent.xadmin.open('查看订单详情',
										'./record_detail.jsp?oid=' + data.oid,
										'', '', true)
							}
							return false;
						});

						table.render({
							elem : "#showRecord",
							url : '/weibao/order/getRecordByBuyerid',
							page : true,
							cellMinWidth : 30,
							limit : 20,
							limits : [ 10, 15, 20, 50, 100 ],
							id : "records",
							cols : [ [ {
								field : 'time',
								title : '日期',
								width : 220,
								sort : true
							}, {
								field : 'oid',
								title : '订单号',
								width : 320
							}, {
								field : 'p_pictrue',
								templet : '#picurl',
								title : '商品图片'
							}, {
								field : 'p_name',
								title : '商品名称',
								width : 320
							}, {
								field : 'price',
								title : '单价'
							}, {
								field : 'quantity',
								title : '数量'
							}, {
								field : 'total',
								title : '总价'
							}, {
								fixed : 'right',
								title : '操作',
								width : 180,
								toolbar : '#barDemo'
							} ] ],
							parseData : function(res) { //res 即为原始返回的数据
								return {
									"code" : res.status, //解析接口状态
									"msg" : res.message, //解析提示文本
									"count" : res.count, //解析数据长度
									"data" : res.data, //解析数据列表
								};
							},
							done : function(res, curr, count) {
								console.log(res);
								//得到当前页码
								console.log(curr);
								//得到数据总量
								console.log(count);
							}
						})

						//layui表格重载：点击查询的时候触发、条件搜索
						form.render();
						form
								.on(
										'submit(name_oid_search)',
										function(data) {
											var formData = data.field;
											console.log("搜索条件：", formData);
											var pname_oid_search = formData.pname_oid_search, start_time_search = formData.start_time_search, end_time_search = formData.end_time_search, status_search = formData.status_search, seller_name_search = formData.seller_name_search;

											table
													.reload(
															'records',
															{
																page : true,
																limit : 20,
																limits : [ 10,
																		15, 20,
																		50, 100 ],
																where : {
																	"p_name" : pname_oid_search,
																	"oid" : pname_oid_search,
																	"start_time" : start_time_search,
																	"end_time" : end_time_search,
																	"status" : status_search,
																	"seller_name" : seller_name_search
																},
																method : 'post',
																contentType : "application/x-www-form-urlencoded;charset=utf-8",
																url : '/weibao/order/getbymany'
															});
											return false;
										});
						form
								.on(
										'submit(extend_search)',
										function(data) {
											var formData = data.field;
											console.log("搜索条件：", formData);
											var pname_oid_search = formData.pname_oid_search, start_time_search = formData.start_time_search, end_time_search = formData.end_time_search, status_search = formData.status_search, seller_name_search = formData.seller_name_search;

											table
													.reload(
															'records',
															{
																page : true,
																limit : 5,
																limits : [ 5,
																		10, 15,
																		20, 50,
																		100 ],
																where : {
																	"p_name" : pname_oid_search,
																	"oid" : pname_oid_search,
																	"start_time" : start_time_search,
																	"end_time" : end_time_search,
																	"status" : status_search,
																	"seller_name" : seller_name_search
																},
																method : 'post',
																contentType : "application/x-www-form-urlencoded;charset=utf-8",
																url : '/weibao/order/getbymany'
															});
											return false;
										});

					});
</script>
<script type="text/html" id="barDemo">
	  <a class="layui-btn layui-btn-xs" lay-event="detail">订单详情</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
<script type="text/html" id="picurl">
	  <img src="{{d.p_pictrue}}" alt="image"></img>
	</script>
</html>

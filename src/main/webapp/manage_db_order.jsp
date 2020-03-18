<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="js/jquery-3.3.1.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<style>
.layui-inline input {
	height: 34px;
	font-size: 17px;
	padding-left: 10px;
	margin-right: 15px;
	margin-bottom: 11px;
	padding: 21px;
}

.x-admin-sm .layui-table td, .x-admin-sm .layui-table th {
	font-size: 16px;
	!
	important
}
</style>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<form class="layui-form layui-col-space5">
							<fieldset
								class="layui-elem-field layui-field-title site-demo-button">
								<legend>数据库订单总览</legend>
							</fieldset>
							<div class="layui-inline layui-show-xs-block"
								style="font-size: 13px;">查询订单成交日期范围：</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="start_time" name="start_time"
									placeholder="开始日期" autocomplete="off" class="layui-input">
							</div>
							—
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="end_time" name="end_time"
									placeholder="结束日期" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="pname_oid_search" name="pname_oid_search"
									placeholder="通过订单号精确查询/商品名称模糊查询" autocomplete="off"
									style="width: 367px;" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<select id="status" name="status" lay-search
									placeholder="选择订单状态">
									<option value="">选择订单状态</option>
									<c:if
										test="${sessionScope.dictionaries!=null && sessionScope.dictionaries!='' }">
										<c:forEach items="${sessionScope.dictionaries}" var="dic">
											<option value="${dic.value }">${dic.item }</option>
										</c:forEach>
									</c:if>
								</select>
							</div>

							<div class="layui-inline layui-show-xs-block">
								<button class="layui-btn" lay-filter="search" lay-submit="">
									<i class="layui-icon">&#xe615;</i>
								</button>
								<button class="layui-btn" onclick="clear()">
									<i class="layui-icon">&#xe640;清空</i>
								</button>
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
	</div>
</body>
<script>
	
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
							elem : '#start_time'
						});

						laydate.render({
							elem : '#end_time'
						});
						//工具栏事件
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
										'./order_detail.jsp?oid=' + data.oid,
										'500', '900', false)
							}
							return false;
						});

						//监听单元格编辑
						table.on('edit', function(obj) {
							var value = obj.value //得到修改后的值
							, data = obj.data //得到所在行所有键值
							, field = obj.field; //得到字段
							$.ajax({
								url : "/weibao/account/edit",
								data : {
									"id" : data.uid,
									"key" : field,
									"value" : value
								},
								type : "post",
								async : false,
								success : function(res) {
									if (res == "success") {
										parent.layer.msg("修改成功", {
											icon : 1
										})
									} else {
										parent.layer.msg("修改失败,请重试", {
											icon : 5
										})
									}
								},
								error : function(res) {
									parent.layer.msg("修改失败,请重试", {
										icon : 5
									})
								}
							})
						});
						//监听复选框
						table.on('checkbox()', function(obj) {
							console.log(obj.checked); //当前是否选中状态
							console.log(obj.data); //选中行的相关数据
							console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
						});

						var $ = layui.$, active = {
							getCheckData : function() { //获取选中数据
								var checkStatus = table.checkStatus('myuser'), data = checkStatus.data;
								layer.alert(JSON.stringify(data));
							}
						};
						//表格初始化
						table.render({
							elem : "#showRecord",
							url : '/weibao/order/getAll',
							page : true,
							cellMinWidth : 30,
							limit : 20,
							limits : [ 10, 15, 20, 50, 100 ],
							id : "records",
							cols : [ [ {
								field : 'p_pictrue',
								templet : '#picurl',
								title : '商品图片'
							}, {
								field : 'time',
								title : '日期',
								width : 220,
								sort : true,
								templet : function(d) {
									time_arr = d.time.split("T")
									return time_arr[0] + " " + time_arr[1];
								}
							}, {
								field : 'oid',
								title : '订单号',
								width : 320
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
								title : '操作',
								width : 180,
								toolbar : '#barDemo'
							} ] ],
							parseData : function(res) { //res 即为原始返回的数据
								return {
									"code" : res.status, //解析接口状态
									"msg" : res.msg, //解析提示文本
									"count" : res.count, //解析数据长度
									"data" : res.data, //解析数据列表
								};
							},
							done : function(res, curr, count) {/* 
																																				for (var i = 0; i < res.dics.length; i++) {
																																					console.log(res.dics[i].value+ "---"+res.dics[i].item)
																																					 $('#status').append('<option value="'+res.dics[i].value+'">'+res.dics[i].item+'</option>')
																																					$('#status').siblings('div.layui-form-select').find("dl").append('<dd class lay-value="'+res.dics[i].value+'">'+res.dics[i].item+'</dd>')								
																																				} */
								console.log(res);
								//得到当前页码
								console.log(curr);
								//得到数据总量
								console.log(count);
							}
						})

						//条件搜索
						form.render();
						form
								.on(
										'submit(search)',
										function(data) {
											var formData = data.field;
											console.log("搜索条件：", formData);
											var pname_oid_search = formData.pname_oid_search, start_time_search = formData.start_time, end_time_search = formData.end_time, status_search = formData.status;
											table
													.reload(
															'records',
															{
																page : true,
																limit : 10,
																limits : [ 10,
																		15, 20,
																		50, 100 ],
																where : {
																	p_name : pname_oid_search,
																	start_time : start_time_search,
																	end_time : end_time_search,
																	oid : pname_oid_search,
																	status : status_search
																},
																method : 'post',
																contentType : "application/x-www-form-urlencoded;charset=utf-8",
																url : '/weibao/order/getbymany'
															});
											return false;
										});

						function clear() {
							$("input").clear();
						}
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

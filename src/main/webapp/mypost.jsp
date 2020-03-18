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
<link rel="stylesheet" href="./css/mypost.css">
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
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
						<form class="layui-form layui-col-space5">
							<fieldset
								class="layui-elem-field layui-field-title site-demo-button">
								<legend>我的发布</legend>
							</fieldset>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="name" name="name"
									placeholder="通过商品名称进行搜索" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline layui-show-xs-block">
								<!-- <input type="text" id="category" name="category"
									placeholder="通过商品分类查询" autocomplete="off" class="layui-input"> -->
								<select id="category" name="category" class="category" lay-search placeholder="输入搜索/下拉选择">
										<option value="">输入搜索/下拉选择</option>
										<option value="手机数码">手机数码</option>
										<option value="生活百货">生活百货</option>
										<option value="女装">女装</option>
										<option value="女鞋">女鞋</option>
										<option value="美妆">美妆</option>
										<option value="男装">男装</option>
										<option value="男鞋">男鞋</option>
										<option value="家用电器">家用电器</option>
										<option value="运动户外">运动户外</option>
										<option value="家具/饰品">家具/饰品</option>
										<option value="整车/车品">整车/车品</option>
										<option value="游戏装备">游戏装备</option>
										<option value="宠物用品">宠物用品</option>
										<option value="乐器">乐器</option>
										<option value="卡券交易">卡券交易</option>
										<option value="书籍交易">书籍交易</option>
										<option value="闲置出租">闲置出租</option>
										<option value="快递代拿">快递代拿</option>
										<option value="PPT/PS/PR等">PPT/PS/PR等</option>
										<option value="兼职">兼职</option>
										<option value="校园拼车">校园拼车</option>
										<option value="其他">其他</option>
									</select>
							</div>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="start_time" name="start_time"
									placeholder="选择查询的开始日期" autocomplete="off" class="layui-input">
							</div>
							—
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="end_time" name="end_time"
									placeholder="选择查询的结束日期" autocomplete="off" class="layui-input">
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
						<table class="layui-table layui-form" id="showMypost"></table>
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
								parent.layer.confirm('确认删除吗？', function(index) {
									obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
									layer.close(index);
									//向服务端发送删除指令
									$.ajax({
										url : "/weibao/mypost/del",
										type : 'post',//method请求方式，get或者post
										data : data,
										dataType : "text",
										async : false,
										success : function(data) {//res为相应体,function为回调函数
											console.log("server:", data)
											if (data == "success") {
												parent.layer.msg('已删除!', {
													icon : 1,
													time : 1000
												});
											} else {
												parent.layer.alert(data.msg, {
													icon : 5
												});
												console.log("failed")
											}
										},
										error : function(error) {
											console.log(error)
											parent.layer.alert('操作失败！！！', {
												icon : 5
											});
										}
									});
								});
							} else if (layEvent === 'edit') { //编辑
								//do something
								parent.xadmin.open('修改商品信息',
										'./mypost-edit.jsp?id=' + data.id,
										'', '', false)
							}else if(layEvent==='go'){//前往页面
								 var index = parent.layer.getFrameIndex(window.name)								
								 parent.layer.close(index);//关闭当前页
								parent.window.location.href="./shop-single.jsp?id="+data.id+"&uid="+<%=session.getAttribute("userid")%>
							}
							return false;
						});
						
						//监听单元格编辑
						  table.on('edit', function(obj){
						    var value = obj.value //得到修改后的值
						    ,data = obj.data //得到所在行所有键值
						    ,field = obj.field; //得到字段
						    $.ajax({
						    	url:"/weibao/mypost/edit",
						    	data:{
						    		"id":data.id,
						    		"key":field,
						    		"value":value
						    	},
						    	type:"post",
						    	async:false,
						    	success:function(res){
						    		if(res=="success"){
						    			parent.layer.msg("修改成功",{icon:1})
						    		}else{
						    			parent.layer.msg("修改失败,请重试",{icon:5})
						    		}
						    	},
						    	error:function(res){
						    		parent.layer.msg("修改失败,请重试",{icon:5})
						    	}						    	
						    })
						  });
						//表格初始化
						table.render({
							elem : "#showMypost",
							url : '/weibao/mypost/getbyuid',
							page : true,
							limit : 10,
							limits : [ 10, 15, 20, 50, 100 ],
							id : "mypost",
							cols : [ [ {
								field : 'id',
								title : '商品编号',
								hide : true
							}, {
								field : 'name',
								title : '商品名称',
								edit :"text"
							}, {
								field : 'p_pictrue',
								title : '商品图片',
								templet : function(d) {
									if(d.pictureSet[0]!=null){
										var src = d.pictureSet[0].picurl.split("webapp\\")[1]
										//console.log(d.pictureSet[0].picurl.split("webapp\\")[1])
										return "<img src="+src+" alt=\"image\"></img>";
									}else{    
									//	console.log("no picture")     
										return '<img alt="images" src=\"images\\no-picture.png\"></img>';   
									}
								}
							}, {
								field : 'category',
								title : '商品分类',
								edit :"text",
								width : 100
							}, {
								field : 'origin_price',
								title : '原价',
								edit :"text",
								width : 100
							}, {
								field : 'current_price',
								title : '现价',
								edit :"text",
								width : 100
							}, {
								field : 'quality',
								title : '数量',
								edit :"text",
								width : 100
							}, {
								field : 'place',
								title : '交易城市'
							}, {
								field : 'telephone',
								title : '联系方式',
								edit :"text"
							}, {
								field : 'delivery',
								title : '快递费用',
								edit :"text",
								width : 100
							},  {
								title : '操作',
								width : 300,
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
							done : function(res, curr, count) {
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
											var name_search = formData.name, category_search = formData.category, start_time_search = formData.start_time, end_time_search = formData.end_time;
											table
													.reload(
															'mypost',
															{
																page : true,
																limit : 10,
																limits : [
																		10, 15,
																		20, 50,
																		100 ],
																where : {
																	name : name_search,
																	category : category_search,
																	start_time : start_time_search,
																	end_time : end_time_search
																},
																method : 'post',
																contentType : "application/x-www-form-urlencoded;charset=utf-8",
																url : '/weibao/mypost/getbymany'
															});
											return false;
										});

						function clear() {
							$("input").clear();
						}

					});
</script>
<script type="text/html" id="barDemo">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑/查看详情</a>
	  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="go">立刻前往</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
</html>

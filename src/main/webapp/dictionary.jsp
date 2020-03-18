<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>数据字典</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<style>
.layui-inline input {
	height: 34px;
	font-size: 17px;
	padding-left: 10px;
	margin-right: 15px;
	margin-bottom: 11px;
}
</style>
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
								<legend>数据字典管理</legend>
							</fieldset>
							<div class="layui-inline layui-show-xs-block">
								<input type="text" id="search_1" name="search_1"
									placeholder="通过分类进行搜索" autocomplete="off"> <input
									type="text" id="search_2" name="search_2"
									placeholder="通过条目进行搜索" autocomplete="off"> <input
									type="text" id="search_3" name="search_3" placeholder="通过值进行搜索"
									autocomplete="off"> <input type="text" id="search_4"
									name="search_4" placeholder="通过是否可编辑进行搜索" autocomplete="off">
								<button class="layui-btn" lay-submit lay-filter="search">
									<i class="layui-icon">&#xe615;</i>
								</button>
								<button type="button" class="layui-btn">
									<i class="layui-icon" onclick="clearform()">清空所有条件</i>
								</button>
							</div>
						</form>
						<div class="layui-inline layui-show-xs-block">
							<button type="button" class="layui-btn">
								<i class="layui-icon"
									onclick="xadmin.open('添加条目','dictionary-add.jsp','700','700')">添加</i>
							</button>
							<span style="    padding-left: 24px;font-size: 14px;">*点击单元格可直接修改条目</span>
						</div>
					</div>
					<div class="layui-card-body layui-table-body layui-table-main">
						<table class="layui-table layui-form" id="showDictionary" lay-filter="showDictionary"></table>
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
<!-- <script src="js/jquery-ui.js"></script> -->
<!-- <script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/main.js"></script>
<script src="js/nav.js"></script> -->
<script>
	function clearform() {
		$('#myform')[0].reset();
	}
	layui
			.use(
					[ 'form', 'table', 'jquery', 'laypage', 'layer' ],
					function() {
						var laydate = layui.laydate;
						var form = layui.form;
						var table = layui.table;
						var $ = layui.jquery;

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
										url : "/weibao/dictionary/del",
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
							} 
							return false;
						});

						table.render({
							elem : "#showDictionary",
							url : '/weibao/dictionary/getall',
							page : true,
							cellMinWidth : 30,
							limit : 20,
							limits : [ 10, 15, 20, 50, 100 ],
							id : "dictionaries",
							cols : [ [ {
								field : 'id',
								title : '序号', 
								hide:true
							}, {
								field : 'classification',
								title : '类别',
								edit : 'text'
							}, {
								field : 'item',
								title : '条目',
								edit : 'text'
							}, {
								field : 'value',
								title : '对应的值',
								edit : 'text'
							}, {
								field : 'editable',
								title : '是否可编辑'
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

						//监听单元格编辑
						table.on('edit(showDictionary)', function(obj) {
							var value = obj.value //得到修改后的值
							, data = obj.data //得到所在行所有键值
							, field = obj.field; //得到字段
							if(data.editable=='否'){
								parent.layer.msg("该条目不可编辑！请勿尝试！",{icon:5})
								return false;
							}
							$.ajax({
						    	url:"/weibao/dictionary/edit_one",
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
						
						
						//layui表格重载：点击查询的时候触发、条件搜索
						form.render();
						form
								.on(
										'submit(search)',
										function(data) {
											var formData = data.field;
											console.log("搜索条件：", formData);
											var classification_search = formData.search_1, item_search = formData.search_2, value_search = formData.search_3, editable_search = formData.search_4;

											table
													.reload(
															'dictionaries',
															{
																page : true,
																limit : 20,
																limits : [ 10,
																		15, 20,
																		50, 100 ],
																where : {
																	classification : classification_search,
																	item : item_search,
																	value : value_search,
																	editable : editable_search
																},
																method : 'post',
																contentType : "application/x-www-form-urlencoded;charset=utf-8",
																url : '/weibao/dictionary/getbymany'
															});
											return false;
										});

					});
</script>
<script type="text/html" id="barDemo">
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
</html>

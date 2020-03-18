<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">

	<head>
		<meta charset="UTF-8">
		<title>欢迎页面-X-admin2.2</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
		<link rel="stylesheet" href="./css/post.css">
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
		<!-- <script type="text/javascript" src="./js/xadmin.js"></script> -->
		<script type="text/javascript" src="js/xcity.js"></script>
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
	</head>

	<body style="background: white;">
		<div class="layui-fluid">
			<div class="layui-row">
				<form class="layui-form layui-form-pane" lay-filter="mypost">
					<fieldset class="layui-elem-field layui-field-title site-demo-button">
						<legend>修改商品</legend>
					</fieldset>
					<input type="hidden" name="id" id="id" value="">
					<div class="layui-form-item" style="padding-left: 20px;">
						<div class="layui-form-item">
							<div class="layui-col-md12">
								<label for="employeeNum" class="layui-form-label"> <span class="x-red">*</span>商品名称
								</label>
								<div class="layui-input-inline">
									<input type="text" id="name" name="name" lay-verify="required" placeholder="不可输入字符"
									 autocomplete="off" class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md6">
								<label for="telephone" class="layui-form-label"> <span class="x-red">*</span>商品图片
								</label>
								<div class="layui-upload">
								  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
								  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
								    预览图：
								    <div class="layui-upload-list" id="demo2"></div>
								 </blockquote>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md12">
								<label style="width:109px" class="layui-form-label"> <span class="x-red">*</span>商品信息
								</label>
								<div class="layui-input-block">
								    <textarea placeholder="品牌型号,新旧程度,入手渠道,转手原因..." id="description" name="description" class="layui-textarea" lay-verify="required"></textarea>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md12">
								<label for="employeeNum" class="layui-form-label"> <span class="x-red">*</span>价格
								</label>
								<div class="layui-input-inline">
									<input type="text" id="current_price" name="current_price" lay-verify="" placeholder="您打算卖出的价格" autocomplete="off"
									 class="layui-input" lay-verify="required|number">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md12">
								<label for="employeeNum" class="layui-form-label"> 入手价
								</label>
								<div class="layui-input-inline">
									<input type="text" id="origin_price" name="origin_price" lay-verify="number" placeholder="您买入宝贝的价格" autocomplete="off"
									 class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md6">
								<label for="haveChildren" class="layui-form-label"> <span class="x-red">*</span>运费
									</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" name="delivery" id="delivery" placeholder="0.00" lay-verify="required|number">
								</div>
								<div class="layui-input-inline">
									<input type="checkbox" name="haveChildren" id="free4delivery" lay-skin="switch" lay-text="包邮|包邮" lay-filter="free">
								</div>
							</div>
						</div>
						<div >
							<div class="layui-col-md6">
								<label for="edcation_background" class="layui-form-label">
									<span class="x-red">*</span>分类
								</label>
								<div class="layui-input-inline">
									<select id="category" name="category" class="category" lay-search placeholder="输入搜索/下拉选择" lay-verify="required">
										<option value=""></option>
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
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md6">
								<label for="birthplace" class="layui-form-label"> <span class="x-red">*</span>数量
								</label>
								<div class="layui-input-inline">
									<input type="text" id="quality" name="quality" lay-verify="required|number" autocomplete="off" class="layui-input"
									 placeholder="0">
								</div>
							</div>
						</div>

						<div class="layui-form-item">
							<div class="layui-col-md12">
								<div class="layui-form-item x-city" id="start">
									<label for="current_address" class="layui-form-label"> <span class="x-red">*</span>卖家地址
									</label>
									<div class="layui-input-inline">
										<select name="province" lay-filter="province" id="province">
											<option value="">请选择省</option>
										</select>
									</div>
									<div class="layui-input-inline">
										<select name="city" lay-filter="city" id="city">
											<option value="">请选择市</option>
										</select>
									</div>
									<div class="layui-input-inline">
										<select name="area" lay-filter="area" id="area">
											<option value="">请选择县/区</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-col-md6">
								<label for="telephone" class="layui-form-label"> 联系电话
								</label>
								<div class="layui-input-inline">
									<input type="text" id="telephone" name="telephone" autocomplete="off" class="layui-input" lay-verify="phone" placeholder="">我们将会以虚拟号码，保证您的隐私安全，请放心填写！
								</div>
							</div>
						</div>
						<div class="layui-form-item" id="btn" style="text-align: center;">
							<button class="layui-btn layui-btn-normal layui-btn-lg" lay-filter="add" lay-submit="">确认发布</button>
						</div>
				</form>
			</div>
		</div>
		</div>
		<script>
			layui.use(['form', 'code'], function() {
				form = layui.form;

				layui.code();

				$('#start').xcity();


			});
		</script>
		<script>
		/*
		 *删除图片
		 */
		function delpic(obj){
			var picid = obj.firstChild.id,
			 picurl = obj.firstChild.src;
			if(obj.firstChild.firstChild!=null&&obj.firstChild.firstChild!=''){
				picurl=obj.firstChild.firstChild.value;
				console.log(picurl)
				picurl_arr=picurl.split('\\');
				console.log(picurl_arr)
				console.log(picurl_arr[picurl_arr.length-2]+"/"+picurl_arr[picurl_arr.length-1])
				
			}
			console.log(picid)
			console.log(picurl)
			 layui.use(['layer'],function(){					
				layer.confirm('确定删除图片吗?', {icon: 2, title:'删除'}, function(index){
					 $.ajax({
						url:"/weibao/mypost/delImgbyid",
						type:"post",
						async:false,
						data:{"id":picid,"pathname":picurl},
						success:function(res){
							if(res=="success"){
								obj.remove();
							 	console.log("删除图片成功！")
							 	layer.msg("删除成功！！！",{icon:1 ,time:700})
							 	layer.close(index);
							}else{
								layer.msg("删除失败！！！",{icon:5,time:700})
							}
							
						},
						error:function(error){
							layer.msg("系统错误！！！",{icon:5,time:700})
							console.log(error)
						}
					}) 
					  
					});
			}) 
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
			
			
			function delnewpic(obj){
				var picurl = obj.firstChild.firstChild.value;
				console.log(picurl)
				layui.use(['layer'],function(){					
					layer.confirm('确定删除图片吗?', {icon: 2, title:'删除'}, function(index){
						 $.ajax({
							url:"/weibao/product/delImg",
							type:"post",
							async:false,
							data:{"picurl":picurl},
							success:function(res){
								if(res=="success"){
									obj.remove();
								 	console.log("删除图片成功！")
								 	layer.msg("删除成功！！！",{icon:1 ,time:700})
								 	layer.close(index);
								}else{
									layer.msg("删除失败！！！",{icon:5,time:700})
								}
								
							},
							error:function(error){
								layer.msg("系统错误！！！",{icon:5,time:700})
								console.log(error)
							}
						}) 
						  
						});
				})
			}
			layui.use(['form', 'layer', 'jquery', 'laydate','upload'], function() {
				var $ = layui.jquery;
				var form = layui.form,
					layer = layui.layer,
					upload = layui.upload,
					request = getRequest();
				var count =0;
				
				$.ajax({
					url : "/weibao/mypost/getbyid",
					type : "post",
					async : false,
					data : request,
					dataType : "json",
					success : function(res) {
						var data = res.data;
						var pics=res.pictures;
						console.log("server-->",res.data)
						console.log("server-->",pics)
						for(var i =0;i<pics.length;i++){
							var filename=pics[i].picurl.split("\\")
							var fn = filename[filename.length-1]
							console.log("pics["+i+"].picurl:",fn)
							console.log("pics["+i+"].id:",pics[i].id)
							$('#demo2').append('<a href=\'javascript:(0)\' onclick=\'delpic(this)\'><img id="'+pics[i].id+'" src="uploadImg/'+fn+'" style="width:100px;height:100px" name="file"></a>')
						}
						form.val("mypost", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
							"name" : data.name, // "name": "value"
							"id" : data.id,
							"origin_price" : data.origin_price,
							"current_price" : data.current_price,
							"quality" : data.quality,
							"telephone" : data.telephone,
							"delivery" : data.delivery,
							"description":data.description
						});
						//select的赋值！！！
						var place_arr=data.place.split('-');
						var province_select='dd[lay-value=' + place_arr[0] + ']';
						var city_select='dd[lay-value=' + place_arr[1] + ']';
						var area_select='dd[lay-value=' + place_arr[2] + ']';
						var select = 'dd[lay-value=' + data.category + ']';
						$('#province').siblings("div.layui-form-select").find('dl').find(province_select).click();
						$('#city').siblings("div.layui-form-select").find('dl').find(city_select).click();
						$('#area').siblings("div.layui-form-select").find('dl').find(area_select).click();
						$('#category').siblings("div.layui-form-select").find('dl').find(select).click();
						form.render('select');
						form.render();
					}
				});
				//给表单赋值
				
				form.on('switch(free)', function(data){
					//  console.log(data.elem); //得到checkbox原始DOM对象
					  console.log(data.elem.checked); //开关是否开启，true或者false
					//  console.log(data.value); //开关value值，也可以通过data.elem.value得到
					//  console.log(data.othis); //得到美化后的DOM对象
					  if(data.elem.checked==true){
						  console.log("元素:",$('#delivery').val())
						  $('#delivery').val("0.00");
					  }else{
						  $('#delivery').val("");
					  }
					}); 
				
				upload.render({
				    elem: '#test2'
				    ,url: '/weibao/product/uploadImg' //改成您自己的上传接口
				    ,multiple: true
					,size:5120
				    ,before: function(obj){
				      //预读本地文件示例，不支持ie8
				      obj.preview(function(index, file, result){
				    	  var id = file.name.split(".")[0];
				        $('#demo2').append('<a href=\'javascript:(0)\' onclick=\'delnewpic(this)\'><img id="'+id+'" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:100px;height:100px" name="file"></a>')
				      });
				    }
					,allDone: function(obj){ //当文件全部被提交后，才触发
				        console.log(obj.total); //得到总文件数
				        console.log(obj.successful); //请求成功的文件数
				        console.log(obj.aborted); //请求失败的文件数
					}
				    ,done: function(res){
				    	console.log("服务器传来的信息：",res)
				    	console.log(res.msg)
				    	var id="#"+res.filename.split(".")[0]
				    	//console.log($(id),id)
				    	//console.log($("#护照"))
				    	$(id).append('<input type="hidden" name="pic'+count+'" value="'+res.url+'"/>')
				    	count++;
				    }
				  });
				

				//监听表单提交事件
				form.on('submit(add)', function(data) {
					var param = data.field; //定义临时变量获取表单提交过来的数据，非json格式
					console.log(JSON.stringify(param)); //测试是否获取到表单数据，调试模式下在页面控制台查看
					$.ajax({
						url: "/weibao/mypost/editall",
						type: 'post', //method请求方式，get或者post
						data: param, //表格数据序列化
						async: false,
						success: function(res) { //res为相应体,function为回调函数
							console.log("服务器返回值："+res)
							if (res == "success") {
								layer.msg('修改成功', {
									icon: 1,
									time: 1000
								}, function() {
									parent.location.reload();
									var index = parent.layer
										.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index)

								});
								//$("#res").click();//调用重置按钮将表单数据清空
							} else {
								layer.alert(data.msg, {
									icon: 5
								});
								console.log("failed")
							}
						},
						error: function() {
							layer.alert('修改失败！请检查您的登陆情况！！', {
								icon: 5
							});
						}
					});
					return false;
				});
				
				

			});
		</script>
	</body>

</html>

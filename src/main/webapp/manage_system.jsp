<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
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
					<div class="layui-card-header">
						<fieldset
							class="layui-elem-field layui-field-title site-demo-button">
							<legend>系统设置</legend>
						</fieldset>
					</div>
					<div class="layui-card-body ">
						<ul
							class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" onclick="clear_imgs()"
								class="x-admin-backlog-body">
									<h3><hr></h3>
									<p>
										<cite>清理服务器图片缓存</cite>
									</p>
							</a></li>
							<!-- <li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>注册用户数</h3>
									<p>
										<cite id="user">12</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>评论数</h3>
									<p>
										<cite id="comment">99</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>商品总浏览量</h3>
									<p>
										<cite id="scan">67</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>订单数</h3>
									<p>
										<cite id="order">67</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6 "><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>无</h3>
									<p>
										<cite>***</cite>
									</p>
							</a></li> -->
						</ul>
					</div>
				</div>
			</div>
			<!-- <div class="layui-col-sm6 layui-col-md2">
				<div class="layui-card">
					<div class="layui-card-header">
						本周最热门分类 <span class="layui-badge layui-bg-cyan layuiadmin-badge">Top5</span>
					</div>
					<div class="layui-card-body  " id="category">
						<p class="layuiadmin-big-font">33,555</p>
						<p>
							新下载 <span class="layuiadmin-span-color">10% <i
								class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
						</p>
					</div>
				</div>
			</div>
			<div class="layui-col-sm6 layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">
						本周最佳卖家 <span class="layui-badge layui-bg-cyan layuiadmin-badge">Top5</span>
					</div>
					<div class="layui-card-body" id="seller_name">
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p>
							新下载 <span class="layuiadmin-span-color">10% <i
								class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
						</p>
					</div>
				</div>
			</div>
			<div class="layui-col-sm6 layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">
						本周最佳买手<span class="layui-badge layui-bg-cyan layuiadmin-badge">Top5</span>
					</div>
					<div class="layui-card-body " id="buyer_name">
						<p class="layuiadmin-big-font">33,555</p>
						<p>
							新下载 <span class="layuiadmin-span-color">10% <i
								class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
						</p>
					</div>
				</div>
			</div>
			<div class="layui-col-sm6 layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">
						本周流量商品 <span class="layui-badge layui-bg-cyan layuiadmin-badge">Top5</span>
					</div>
					<div class="layui-card-body" id="scan_count">
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p class="layuiadmin-big-font">33,555</p>
						<p>
							新下载 <span class="layuiadmin-span-color">10% <i
								class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
						</p>
					</div>
				</div>
			</div> -->

			<!-- <div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">系统信息</div>
					<div class="layui-card-body ">
						<table class="layui-table">
							<tbody>
								<tr>
									<th>xxx版本</th>
									<td>1.0.180420</td>
								</tr>
								<tr>
									<th>服务器地址</th>
									<td>x.xuebingsi.com</td>
								</tr>
								<tr>
									<th>操作系统</th>
									<td>WINNT</td>
								</tr>
								<tr>
									<th>运行环境</th>
									<td>Apache/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9</td>
								</tr>
								<tr>
									<th>PHP版本</th>
									<td>5.6.27</td>
								</tr>
								<tr>
									<th>PHP运行方式</th>
									<td>cgi-fcgi</td>
								</tr>
								<tr>
									<th>MYSQL版本</th>
									<td>5.5.53</td>
								</tr>
								<tr>
									<th>ThinkPHP</th>
									<td>5.0.18</td>
								</tr>
								<tr>
									<th>上传附件限制</th>
									<td>2M</td>
								</tr>
								<tr>
									<th>执行时间限制</th>
									<td>30s</td>
								</tr>
								<tr>
									<th>剩余空间</th>
									<td>86015.2M</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div> -->
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">开发团队</div>
					<div class="layui-card-body ">
						<table class="layui-table">
							<tbody>
								<tr>
									<th>版权所有</th>
									<td>Tttttttt <a href="./index.jsp" target="_blank">访问官网</a></td>
								</tr>
								<tr>
									<th>开发者</th>
									<td>叶韬(448985604@qq.com)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<style id="welcome_style"></style>
		</div>
	</div>
	</div>
</body>

<script>
	function clear_imgs() {
		$.ajax({
			url : "/weibao/picture/clearUselessImgs",
			type : "post",
			async : false,
			success : function(res) {
				layui.use('layer', function() {
					layui.layer.msg("清理完成", {
						icon : 1,
						time : 800
					})
				})
			},
			error : function(res) {
				layui.use('layer', function() {
					layui.layer.msg("系统错误，清理失败！", {
						icon : 3
					})
				})
			}
		})
	}
</script>
</html>
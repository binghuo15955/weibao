<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html class="x-admin-sm">

	<head>
		<meta charset="UTF-8">
<title>变废为宝-WEIBAO！</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
		<link rel="stylesheet" href="css/personal.css">
		<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
		<script src="./lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="./js/xadmin.js"></script>
		<script type="text/javascript" src="./js/xcity.js"></script>
		<!-- <script type="text/javascript" src="./js/imgload.js"></script> -->
		<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
	</head>

	<body style="background: white;">
		<div id="header">个人资料</div>
		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card-body ">
						<form class="layui-col-md12 layui-form-pane">
							<div>
								<label class="layui-form-label"><span class="x-red">*</span>昵称：</label>
								<div class="layui-input-inline">
									<input type="text" id="name" name="name" required="" class="layui-input wider-input" value="<%=session.getAttribute("name") %>"></div>
								<br>
								<label class="layui-form-label">头像：</label>
								<div class="layui-input-inline">
									<a href="javascript:(0)"><img id="pic" style="width:100px;height:100px;border-radius:50%;" src="./images/hero_1.png">
									<input id="upload" name="file" type="file" style="display: none;"></a></div>
								<br>
								<div class="layui-input-inline">
									<button type="submit" class="layui-btn layui-btn-normal layui-btn-lg">保存</button></div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</body>
	<script>	
	$ (function() {
		      $("#pic").click(function() {
		          $("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
		          $("#upload").on("change", function() {
		              var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
		              if (objUrl) {
		                  $("#pic").attr("src", objUrl); //将图片路径存入src中，显示出图片
		                  upimg();
		              }
		          });
		      });
		      
		      /* $.ajax({
		    	  url:"/weibao/user/getUser",
		    	  type:"post",
		    	  async:false,
		    	  success:function(obj){
		    		  console.log(obj)
		    	  }
		      }) */
		  });
		
		  //建立一?可存取到?file的url
		  function getObjectURL(file) {
		      var url = null;
		      if (window.createObjectURL != undefined) { // basic
		          url = window.createObjectURL(file);
		      } else if (window.URL != undefined) { // mozilla(firefox)
		          url = window.URL.createObjectURL(file);
		      } else if (window.webkitURL != undefined) { // webkit or chrome
		          url = window.webkitURL.createObjectURL(file);
		      }
		      return url;
		  }
		  //上传头像到服务器
		  function upimg() {
		      console.log("client(uploadImg)-->Server")
		      var pic = $('#upload')[0].files[0];
		      var file = new FormData();
		      file.append('image', pic);
		      $.ajax({
		          url: "/weibao/user/uploadImg",
		          type: "post",
		          data: file,
		          cache: false,
		          contentType: false,
		          processData: false,
		          success: function(data) {
		              console.log(data);
		              var res = data;
		              $("#resimg").append("<img src='/" + res + "'>")
		          }
		      });
		  }
	</script>
</html>

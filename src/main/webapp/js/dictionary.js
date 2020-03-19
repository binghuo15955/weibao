$.ajax({
		url : "/weibao/dictionary/getbymany",
		type : "post",
		async : false,
		data:{"classification":"init"},
		success : function(res) {
			var jsonObj = JSON.parse(res);
			pc = jsonObj.product_classification;
			sc = jsonObj.skill_classification;
			console.log("server-->", pc,sc);
			var pcContent="";
			for (var i = 0; i < pc.length; i++) {
				 //先创建好select里面的option元素
                var option = document.createElement("option");
                //转换DOM对象为JQ对象,好用JQ里面提供的方法 给option的value赋值
                $(option).val(pc[i]);
                //给option的text赋值,这就是你点开下拉框能够看到的东西
                $(option).text(pc[i]);
                $("#pc").append(option)
				//$("#pc").append('<li><a href="shop.jsp?kw='+pc[i].value+'">'+pc[i].item+'</a></li>');
			}
			for (var i = 0; i < sc.length; i++) {
				$('#sc').append('<li><a href="shop.jsp?kw='+sc[i].value+'">'+sc[i].item+'</a></li>');
			}
			  
		},
		error : function(res) {
			console.log("获取失败！！")
		}
	})
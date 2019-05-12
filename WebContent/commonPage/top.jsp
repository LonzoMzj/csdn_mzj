<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript">
function privilege(){
	var userName=$("#sessionUname").val();
	if(userName==""){
		$(".upload").prop("href","javascript:void(0)");
		$(".upload").attr("onclick","showWin()");
		$("#loginOut").hide();
		$("#cons").empty();
		$("#addTopicBtn").prop("onclick","");
		$("#addTopicCommentBtn").prop("onclick","");
		$("#addCommentComment").prop("onclick","");
	}else{
		$("#login").empty();
		var img = $("<img  />").attr("src","user/showImg").attr("style","width:100%;height:100%;border-radius:49%");
		$("#login").append(img);
	}
}
</script>
</head>
<body>
<div class="header">
		<div class="lf">
			<a href="index.jsp">首页</a>
			<a href="user/toPage?toPage=bbs">论坛</a>
			<a class="upload" href="user/toPage?toPage=upload">上传资料</a>
		</div>
		
		<div class="rf">
			<a class="upload" href="user/personal">个人信息</a>
			<a class="upload" href="user/toPage?toPage=collect">我的收藏</a>
			<a class="upload" href="user/toPage?toPage=score">积分</a>
			<a id="loginOut" href="user/loginOut">退出登录</a>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript">
$(function(){
	privilege();
})
</script>
</head>
<body>
<%@ include file="/commonPage/top.jsp" %>
    <input type="hidden" id="sessionUname" value="${user.userName}">

    <!-- 网站主体 -->
    <div id="main">
        <!-- 上传表单-->
        <div class="upload">
            <p>用户注册<span id="msg"></span></p>
            <hr />
            <form action="" id="myform" method="post" enctype="multipart/form-data">
                <span>
                    <label>用户头像：</label>
                    <input class="upt" type="text" readonly="readonly"/>
                    <input class="upt" type="file" name="file" value="" onblur="check('file',this)" />
                    <b>文件格式可以是jpg,gif,png等图片格式</b>
                </span>
                <span>
                    <label>用户名：</label>
                    <input id="name" class="upt" type="text" id="userName" onblur="check('userName',this)" name="userName" value="" />
					<b id="nameb"></b>
                    <b>账号可以包含字母，数字，下划线，不允许出现其他符号</b>
                </span>
                <span>
                    <label>密码：</label>
                    <input id="password" class="upt" type="password" onblur="check('password',this)" id="password" name="password" value="" />
                    <b>密码长度为6-20位</b>
                </span>
                <span>
                    <label>确认密码：</label>
                    <input id="confirmPass" class="upt" onblur="check('password2',this)" type="password" id="password2" name="password2" value="" />
                    <b>两次输入的密码必须保持一致</b>
                </span>
                <span>
                    <label>联系方式：</label>
                    <input id="tel" class="upt" onblur="check('tel',this)" type="text" id="tel" name="tel" value="" />
                    <b>您丢失密码后找回密码的凭证</b>
                </span>
                <span>
                    <label>电子邮箱：</label>
                    <input id="email" class="upt" onblur="check('email',this)" type="text" name="email" value="" />
                    <b>您丢失密码后找回密码的凭证</b>
                </span>

                <span><label class="btn"><input id="reg" type="button"  value="注册" /></label></span>
            </form>
        </div>

    </div>
	<script>
		$("#reg").click(function(){
			  //check(what,val);
			  document.getElementById("myform").action="user/regist";
			  document.getElementById("myform").submit();
		});
		function check(what,val){
			var unameReg = /^[0-9a-zA-Z_]{1,}$/;
			var telReg = /^1[3|4|5|8][0-9]\d{4,8}$/ ;
			var emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			if(what=="file"){
				if(val.value==""){
					$("#msg").html("请选择头像上传");
					$("#msg").css("color","red");
					return false;
				}
			}else if("userName"==what){
				if(val.value==""){
					$("#msg").html("请输入用户名");
					$("#msg").css("color","red");
					return false;
				}else if(!unameReg.test(val.value)){
					$("#msg").html("用户名不合法");
					$("#msg").css("color","red");
					return false;
				}
			}else if("password"==what){
				if(val.value==""){
					$("#msg").html("请输入密码");
					$("#msg").css("color","red");
					return false;
				}
			}else if("password2"==what){
				var pwd1 = $("#password").val();
				if(val.value==""){
					$("#msg").html("请重复输入密码");
					$("#msg").css("color","red");
					return false;
				}else if(val.value!=pwd1){
					$("#msg").html("两次密码不一致");
					$("#msg").css("color","red");
					return false;
				}
			}else if("tel"==what){
				if(val.value==""){
					$("#msg").html("电话号码为空");
					$("#msg").css("color","red");
					return false;
				}else if(!telReg.test(val.value)){
					$("#msg").html("电话号码格式不正确");
					$("#msg").css("color","red");
					return false;
				}
			}else if("email"==what){
				if(val.value==""){
					$("#msg").html("邮箱为空");
					$("#msg").css("color","red");
					return false;
				}else if(!emailReg.test(val.value)){
					$("#msg").html("邮箱格式不正确");
					$("#msg").css("color","red");
					return false;
				}
			}
		}
	</script>
</body>
</html>
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
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript">
$(function(){
	privilege();
	$("#btn").click(function(){
		var obj = $("#method option:selected").val();
		//电话找回
		if(obj==1){
		   $("#telOrEmail").prop("name","tel");
		   document.getElementById("myform").action="user/findpassByTel";
		   document.getElementById("myform").submit();
		//邮箱找回
		}else{
		   $("#telOrEmail").prop("name","email");
		   document.getElementById("myform").action="user/findpassByEmail";
		   document.getElementById("myform").submit();
		}
	})
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
            <p>密码找回</p>
            <hr />
            <form action="" id="myform" method="post" enctype="multipart/form-data">
                <span>
                    <label>找回方式：</label>
                    <select class="upt" id="method">
                        <option value="1">电话找回</option>
                        <option value="2">邮件找回</option>
                    </select>
                </span>
                <span>
                    <label>输入电话/邮件：</label>
                    <input class="upt" type="text" id="telOrEmail" name="" value="" />
                </span>
                <span>
                    <label>新密码：</label>
                    <input class="upt" type="password" name="password" value="" />
                    <b>密码长度为6-20位</b>
                </span>
                <span>
                    <label>确认密码：</label>
                    <input class="upt" type="password" name="" value="" />
                    <b>两次输入的密码必须保持一致</b>
                </span>

                <span><label class="btn"><input  id="btn" type="button" value="确认找回" /></label></span>
            </form>
        </div>

    </div>

</body>
</html>
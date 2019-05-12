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
<title>个人详情</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript">
$(function(){
	jifen();
	detail();
})
function detail(){
	var bir = $("#bir").val();
	$("#birs").html(Transdate(bir));
}
function Transdate(time) {
	var date = new Date(time);
	return date.toLocaleDateString();//把date对象的日期部分(年月日)转化为字符串
}
//查询总积分
function jifen(){
	$.ajax({
		url:"scoreDetail/querySum",
		type:"post",
		dataType:"json",
		success:function(result){
			$("#sum").html(result.extend.sumScore);
			$("#fatie").html(result.extend.fatieCount);
			$("#shoucang").html(result.extend.shoucangCount);
		}
	})
}
</script>
</head>
<body>
<%@ include file="/commonPage/top.jsp" %>

    <!-- 网站主体 -->
    <div id="main">
        <div class="personal">
			<div class="lf">
				<img src="user/showImg" alt="用户头像"/>
			</div>
			
			<div class="rf">
				<div>
					<span>${user.userName}</span>
					
					<span><b>${sessionScope.user.trueName}</b> | 
					<b>${sessionScope.user.gender=='1'?"男":"女"}</b> |  
					<input id="bir" type="hidden" value="${sessionScope.user.birthday}">
					<b id="birs"></b></span>
				</div>
				<div>
					<span><b id="sum"></b>积分</span>
					<span><b id="fatie"></b>发帖</span>
					<span><b id="shoucang"></b>收藏</span>
				</div>
			</div>
		</div>
		
    </div>
</body>
</html>
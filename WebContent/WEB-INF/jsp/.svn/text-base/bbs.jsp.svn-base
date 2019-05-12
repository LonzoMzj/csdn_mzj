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
	to_page(1);
})
//锚点定位
function anchor(str){
    document.getElementById(str).scrollIntoView();
}
//日期格式转换
function Transdate(time) {
	var date = new Date(time);
	return date.toLocaleString();
}
function to_page(currentPage){
	$.ajax({
		url : "topic/queryTopic",
		data : "currentPage=" + currentPage,
		type : "post",
		dataType : "json",
		success : function(result) {
			//alert(1);
			topic_json(result);
			page_json(result);
		},
	});
}
//解析帖子
function topic_json(result){
	$("#bbsmain").empty();
	$.each(result.extend.topicList,function(index,current){
		var nameAndTime= $("<div></div>").append("<span>"+current.user.userName+"</span>").append("<span>"+Transdate(current.date)+"</span>");
	    var rfDiv = $("<div class='rf'></div>").append(nameAndTime);
	    var zhiding = $("<span></span>").append("[置顶]").css("color","red");
	    if(current.isUp==1){
	    	var typeSpan = $("<span></span>").append(zhiding).append("["+current.type+"]").css("color","blue");
	    }else{
	    	var typeSpan = $("<span></span>").append("["+current.type+"]").css("color","blue");
	    }
	    var ahref = $("<a></a>").append(current.title).attr("href","topic/topicDetail?id="+current.id);
	    var lfDiv= $("<div class='lf'></div>").append(typeSpan).append(ahref);
	    $("<div class='tz'></div>").append(lfDiv)
	                               .append(rfDiv)
	                               .appendTo("#bbsmain");
	})
}
//解析分页
function page_json(result){
	$("#panigation").empty();
	   var firstPage = $("<a></a>").append("首页");
	   var lastPage = $("<a></a>").append("上一页");
	   if(result.extend.currentPage==1){
		   firstPage.addClass("disabled");
		   lastPage.addClass("disabled");
	   }else{
		   firstPage.click(function(){
			   to_page(1);
		   });
		   lastPage.click(function(){
			   to_page(result.extend.currentPage - 1);
		   });
	   }
	   var endPage = $("<a></a>").append("尾页");
	   var nextPage = $("<a></a>").append("下一页");
	   if(result.extend.currentPage==result.extend.totalPage){
		   endPage.addClass("disabled");
		   nextPage.addClass("disabled");
	   }else{
		   endPage.click(function(){
			   to_page(result.extend.totalPage);
		   });
		   nextPage.click(function(){
			   to_page(result.extend.currentPage + 1);
		   });
	   }
	   $("#panigation")
	   .append(firstPage).append("&emsp;")
	   .append(lastPage).append("&emsp;")
	   .append(nextPage).append("&emsp;")
	   .append(endPage).append("&emsp;");
	   $("#panigation").append("一共有"+result.extend.totalCount+"条数据,当前是第"+result.extend.currentPage+"页");	
}
//发表帖子
function addTopic(){
	$.ajax({
		url:"topic/addTopic",
		data:$("#addTopicForm").serialize(),
		type:"post",
		dataType:"json",
		success:function(result){
			if(result.extend.count==1){
				alert("发表成功");
				window.location.reload(true);
			}
		}
	})
}
</script>
</head>
<body>
<%@ include file="/commonPage/top.jsp" %>
<input type="hidden" id="sessionUname" value="${user.userName}">
 <!-- 网站主体 -->
    <div id="main">
        <div class="bbs">
			<a class="btn" href="javascript:anchor('tiezi')">发帖</a>
			<hr />
			<div id="bbsmain">
			   <!-- <div class="tz">
				   <div class="lf">
					<span>[技术专题]</span>
					<a href="bbsdetail.html">三台县人民法院违反审判程序制造冤案</a>
				   </div>
				   <div class="rf" id="rf">
				 	<div>
						<span>zhangsan</span>
						<span>2017-05-23 11:23:44</span>
					</div>
				   </div>
			   </div> -->
		  </div>
			   <div class="panigation" id="panigation">
				<!-- <a>&lt;上一页</a>
				<a>1</a>
				<a>2</a>
				<a class="act">3</a>
				<a>4</a>
				<a>5</a>
				<a>下一页></a> -->
			   </div>
			
			
			
			<!-- <a class="btn" href="#tiezi">发帖</a> -->
			
			
			<!-- 开始发帖-->
			<!-- 上传表单-->
			<div class="bbs_tz" id="tiezi">
				<p>快速发帖</p>
				<hr />
				<form action="" method="post" id="addTopicForm">
					<span>
						<select name="type">
							<option value="技术专题">技术专题</option>
							<option value="闲聊专题">闲聊专题</option>
						</select>
						<input type="text" name="title" class="upt" placeholder="请输入帖子标题"/>
					</span>
					<span>
						<textarea  class="area" name="content"></textarea>
					</span>
					<span><a id="addTopicBtn" class="btn" href="javascript:void(0)" onclick="addTopic()">发表帖子</a></span>
				</form>
			</div>
			
		</div>
		
    </div>
</body>
</html>
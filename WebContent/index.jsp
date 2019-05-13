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
	//to_page(1);
	to_page2(1);//利用pageHelper的一览
	
})
function to_page2(currentPage){
	$.ajax({
		url : "file/queryFile2",
		data : "currentPage=" + currentPage,
		type : "post",
		dataType : "json",
		success : function(result) {	
			file_json2(result);
			page_json2(result);
		},
	});
}
function file_json2(result){
	$("#main").empty();
	$.each(result.extend.pageInfo.list,function(index,current){
		var flg=current.fileType;
		var imgState;
		imgState = $("<img />").attr("src","./images/"+flg+".svg");
		var img = $("<div class='img'> </div>").append(imgState);
		var fileName =$("<a href=''></a>").append(current.fileName).prop("href","file/fileDetail?fileId="+current.fileId);
		var classUp = $("<div class='up'></div>").append(fileName);
		var nameAndTime = $("<div class='down'></div>").append("上传者:"+current.user.userName+"&emsp;上传时间:"+Transdate(current.uploadDate));
	    var classCs = $("<div class='cs'></div>").append(classUp).append(nameAndTime);
		var score = $("<div class='arr'></div>").append("积分<span>"+current.score+"</span>");
	    var pro = $("<div class='pro'></div>");
	    pro.append(img)
	    .append(classCs)
	    .append(score)
	    .appendTo("#main");
	})	
	$("#main").append("<div class='panigation' id='panigation'></div>");
}
function page_json2(result){
	$("#panigation").empty();
	   var firstPage = $("<a></a>").append("首页");
	   var lastPage = $("<a></a>").append("上一页");
	   //如果有上一页
	   if(result.extend.pageInfo.hasPreviousPage == false){
		   firstPage.addClass("disabled");
		   lastPage.addClass("disabled");
	   }else{
		   firstPage.click(function(){
			   to_page2(1);
		   });
		   lastPage.click(function(){
			   to_page2(result.extend.pageInfo.pageNum - 1);
		   });
	   }
	   $("#panigation").append(firstPage).append(lastPage);
	   var endPage = $("<a></a>").append("尾页");
	   var nextPage = $("<a></a>").append("下一页");
	   //如果有下一页
	   if(result.extend.pageInfo.hasNextPage == false){
		   endPage.addClass("disabled");
		   nextPage.addClass("disabled");
	   }else{
		   endPage.click(function(){
			   to_page2(result.extend.pageInfo.pages);
		   });
		   nextPage.click(function(){
			   to_page2(result.extend.pageInfo.pageNum + 1);
		   });
	   }
	   //循环显示分页条
	   $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
		   var numa = $("<a></a>").append(item);
		   if(result.extend.pageInfo.pageNum == item){
			   numa.addClass("act");
		   }
		   numa.click(function(){
			   to_page2(item);
		   });
		   $("#panigation").append(numa);
	   })
	   $("#panigation").append(nextPage).append(endPage);
	   	   
}


//页面一览
function to_page(currentPage){
	$.ajax({
		url : "file/queryFile",
		data : "currentPage=" + currentPage,
		type : "post",
		dataType : "json",
		success : function(result) {	
			file_json(result);
			page_json(result);
		},
	});
}
//日期格式转换
function Transdate(time) {
	var date = new Date(time);
	return date.toLocaleString();
}
//解析文件列表
function file_json(result){
	$("#main").empty();
	$.each(result.extend.fileResourceList,function(index,current){
		var flg=current.fileType;
		var imgState;
		imgState = $("<img />").attr("src","./images/"+flg+".svg");
		var img = $("<div class='img'> </div>").append(imgState);
		var fileName =$("<a href=''></a>").append(current.fileName).prop("href","file/fileDetail?fileId="+current.fileId);
		var classUp = $("<div class='up'></div>").append(fileName);
		var nameAndTime = $("<div class='down'></div>").append("上传者:"+current.user.userName+"&emsp;上传时间:"+Transdate(current.uploadDate));
	    var classCs = $("<div class='cs'></div>").append(classUp).append(nameAndTime);
		var score = $("<div class='arr'></div>").append("积分<span>"+current.score+"</span>");
	    var pro = $("<div class='pro'></div>");
	    pro.append(img)
	    .append(classCs)
	    .append(score)
	    .appendTo("#main");
	})	
	$("#main").append("<div class='panigation' id='panigation'></div>");
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
	   $("#panigation").append("共有"+result.extend.totalPage+"页,当前是第"+result.extend.currentPage+"页");
}
//分页查询
function searchs(currentPage){
	var fileName = $("#likeName").val();
	$.ajax({
		url:"file/searchLike",
		data:"currentPage="+currentPage+"&fileName="+fileName,
		type:"post",
		dataType:"json",
		success:function(result){
			file_json(result);
			search_page_json(result);
		}
	})
}
//解析分页页码
function search_page_json(result){
	$("#panigation").empty();
	   var firstPage = $("<a></a>").append("首页");
	   var lastPage = $("<a></a>").append("上一页");
	   if(result.extend.currentPage==1){
		   firstPage.addClass("disabled");
		   lastPage.addClass("disabled");
	   }else{
		   firstPage.click(function(){
			   searchs(1);
		   });
		   lastPage.click(function(){
			   searchs(result.extend.currentPage - 1);
		   });
	   }
	   var endPage = $("<a></a>").append("尾页");
	   var nextPage = $("<a></a>").append("下一页");
	   if(result.extend.currentPage==result.extend.totalPage){
		   endPage.addClass("disabled");
		   nextPage.addClass("disabled");
	   }else{
		   endPage.click(function(){
			   searchs(result.extend.totalPage);
		   });
		   nextPage.click(function(){
			   searchs(result.extend.currentPage + 1);
		   });
	   }
	   $("#panigation")
	   .append(firstPage).append("&emsp;")
	   .append(lastPage).append("&emsp;")
	   .append(nextPage).append("&emsp;")
	   .append(endPage).append("&emsp;");
	   $("#panigation").append("一共有"+result.extend.totalCount+"条数据,当前是第"+result.extend.currentPage+"页");
}
//登陆验证
function check(){
	var  name = $("#userName").val();
	var  pwd  =$("#password").val();
	if(name==""){
		$("#chkMsg").html("请输入正确的用户名");
		$("#chkMsg").css("color","red");
		return false;
	}else if(pwd==""){
		$("#chkMsg").html("请输入密码");
		$("#chkMsg").css("color","red");
		return false;
	}
}
</script>
</head>
<body>
<body>
<input type="hidden" id="sessionUname" value="${user.userName}">
    <!-- 登录弹出层 -->
    <div class="cvs" style="display:none" id="cvs2_logon">
        <div class="newModWin">
            <div class="title">登录爱下下账号</div>
            <div class="close" id="cvs2_close" onclick="close_win()">X</div>

            <div class="logWin">
                <form action="user/login" method="post" onsubmit="return check()">
                    <p style="text-align: center" id="chkMsg"></p>
                    <input type="text" id="userName" class="inp user" name="userName" autocomplete="off" placeholder="请输入用户名" />
                    <input type="password" id="password" class="inp pass" name="password" autocomplete="off" placeholder="请输入密码" />
                    <a href="findpass.jsp" class="find_pass">忘记密码，立即找回</a>
                    <input type="submit" class="su_btn" value="登录" />
                    <a href="regist.jsp" class="reg">注册</a>
                </form>
            </div>
        </div>
    </div>
	<%@ include file="commonPage/top.jsp" %>
    <!-- 网站头信息-->
    <div id="nav">
        <div id="search">
            <form method="post" id="searchForm">
            <input type="text" id="likeName" name="fileName" autocomplete="off"/>
            <a class="btn" href="javascript:void(0)" onclick="searchs(1)">搜索</a>
            </form>
        </div>

        <div id="logon">
            <div class="cons" id="cons">
                欢迎光临CSDN！
            </div>
            <div class="opers">
				<a id="upload" class="btn upload" href="user/toPage?toPage=upload">上传资料</a>
            </div>
        </div>

        <div id="login">
            
            <a href="javascript:void(0)" onclick="showWin()">点击登录</a>
        </div>
    </div>

    <!-- 网站主体 -->
    <div id="main">
        <!-- 定义一个条目-->
    
		<div class="panigation" id="panigation">
		<div id="aList">
		   
		</div>
			<!-- <a>上一页</a>
			<a>1</a>
			<a>2</a>
			<a class="act">3</a>
			<a>4</a>
			<a>5</a>
			<a>下一页></a> -->
		</div>
    </div>


    <script>
        function showWin(){
            //获取对应的DIV元素
            var div = document.getElementById("cvs2_logon");
            div.style = 'display:block' ;
        }
        function close_win(){
            var div = document.getElementById("cvs2_logon");
            div.style = 'display:none' ;
        }

    </script>

</body>
</body>
</html>
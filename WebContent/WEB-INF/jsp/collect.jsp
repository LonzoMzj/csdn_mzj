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
	//privilege();
	to_page(1);
	
})

function to_page(currentPage){
	$.ajax({
		url : "file/queryCollectFile",
		data : "currentPage=" + currentPage,
		type : "post",
		dataType : "json",
		success : function(result) {
			//alert(1);
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
	$("#main").empty()
	
	$.each(result.extend.collectFileList,function(index,current){
		var flg=current.fileResource.fileType;
		var imgState;
		imgState = $("<img />").attr("src","./images/"+flg+".svg");
		var img = $("<div class='img'> </div>").append(imgState);
		var fileName =$("<a href=''></a>").append(current.fileResource.fileName).prop("href","file/fileDetail?fileId="+current.fileResource.fileId);
		var classUp = $("<div class='up'></div>").append(fileName);
		var nameAndTime = $("<div class='down'></div>").append("上传者:"+current.user.userName+"&emsp;上传时间:"
		+Transdate(current.fileResource.uploadDate)+"&emsp;收藏时间:"+Transdate(current.collectTime));
	    var classCs = $("<div class='cs'></div>").append(classUp).append(nameAndTime);
		var score = $("<div class='arr'></div>").append("积分<span>"+current.fileResource.score+"</span>");
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
	   $("#panigation").append("一共有"+result.extend.totalCount+"条数据,当前是第"+result.extend.currentPage+"页");
}

</script>
</head>
<body>
 <%@ include file="/commonPage/top.jsp" %>
<!-- 网站主体 -->
    <!-- 网站主体 -->
    <div id="main">
        <!-- 定义一个条目-->
    
		<div class="panigation" id="panigation">
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
</html>
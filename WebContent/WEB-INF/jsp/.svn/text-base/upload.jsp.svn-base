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
	$("#btn").click(function(){
		 check();//表单验证
		 document.getElementById("myform").action="file/addFile";
		 document.getElementById("myform").submit();
	})
})
function check(){
	var fileName= $("#fileName").val();
	var keyWord = $("#keyWord").val();
	var point = $("#point").val();
	var introduction = $("#introduction").val();
	var tongyi = $("input[type='checkbox']").is(':checked');
	
	if(fileName==""){
		var span =$("#tofileNameSpan");
		span.html("请输入文件名");
		span.css("color","red");
		return false;
	}else if(keyWord==""){
		var span = $("#tokeyWordSpan");
		span.html("请输入关键字");
		span.css("color","red");
		return false;
	}else if(point==""){
		var span = $("#topointSpan");
		span.html("请输入积分");
		span.css("color","red");
		return false;
		
	}else if(introduction==""){
		var span = $("#toinSpan");
		span.html("请输入资料详情");
		span.css("color","red");
		return false;
		
	}else if(tongyi==false){
		var span = $("#totongyiSpan");
		span.html("请同意爱下下资源上传协议");
		span.css("color","red");
		return false;
		
	}else{
		$("#tofileNameSpan").html("");
		$("#tokeyWordSpan").html("");
		$("#topointSpan").html("");
		$("#toinSpan").html("");
		$("#totongyiSpan").html("");
		return true;
	}
}
//校验文件名
function chkfileName(){
	var fileName= $("#fileName").val();
	 $("#tofileNameSpan").show();
     if(fileName==""){
        $("#tofileNameSpan").html("文件名不能为空");
        $("#tofileNameSpan").css({"color":"red"});
     }else{
        $("#tofileNameSpan").html("");
    }
}
//关键字不能为空
function chkkeyWord(){
	var keyWord = $("#keyWord").val();
	 $("#tokeyWordSpan").show();
     if(keyWord==""){
        $("#tokeyWordSpan").html("关键字不能为空");
        $("#tokeyWordSpan").css({"color":"red"});
     }else{
        $("#tokeyWordSpan").html("");
    }
}
//积分校验
function chkpoint(){
	var point = $("#sel").val();
	var pattern = /^[0-9]*$/;
	 $("#topointSpan").show();
     if(point==""){
        $("#topointSpan").html("所需积分不能为空");
        $("#topointSpan").css({"color":"red"});
     }else if(!pattern.test(point)){
    	 $("#topointSpan").html("请输入数字");
	      $("#topointSpan").css({"color":"red"});
     
     }else{
        $("#topointSpan").html("");
    }
}
//资源描述校验
function chkintr(){
	var introduction = $("#introduction").val();
	 $("#toinSpan").show();
     if(introduction==""){
        $("#toinSpan").html("资源描述不能为空");
        $("#toinSpan").css({"color":"red"});
     }else{
        $("#toinSpan").html("");
    }
	
}


</script>
</head>
<body>
   <%@ include file="/commonPage/top.jsp" %>
	
	
    <!-- 网站主体 -->
    <div id="main">
        <!-- 上传表单-->
        <div class="upload">
            <p>上传资源</p>
            <hr />
            <form id="myform"  action="" method="post" enctype="multipart/form-data">
                <span>
                    <label>选择文件：</label>
                    <input class="upt" type="text" readonly="readonly"/>
                    <input class="upt" type="file" name="file" value=""/>
                    <b>文件格式可以是txt、pdf、zip、rar等后缀</b>
                </span>
                <span>
                    <label>资源名称：</label>
                    <input class="upt" type="text" id="fileName" name="fileName" value="" onblur="chkfileName()" />
                    <b id="tofileNameSpan"></b>
                </span>
                <span>
                    <label>资源类型：</label>
                    <select class="upt" name="fileType">
                        <option value="txt">文本文件</option>
                        <option value="pdf">电子文件</option>
                        <option value="rar">压缩文件</option>
                    </select>
                </span>
                <span>
                    <label>关键词：</label>
                    <input class="upt" type="text" name="keyWord" value="" onchange="check(this)"/>
                    <b id="tokeyWordSpan">多个关键词用空格分割,关键词不能超过5个</b>
                </span>
                <span>
                    <label>资源分：</label>
                    <select class="upt" id="sel" name="score">
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option selected="selected">3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                    <b id="topointSpan"></b>
                </span>
                <span class="d_span">
                    <label>资源描述：</label>
                    <textarea name="introduction" class="area" placeholder="描述不支持HTML标签；详细的资源描述有机会获得我们的推荐，更有利于他人下载，赚取更多积分。如资源描述不清，有可能审核不通过。"></textarea>
                    <b id="toinSpan"></b>
                </span>
                <span>
                    <label class="agree">
                        <input type="checkbox" name="" value="1" />
                        同意爱下下资源上传协议
                    </label>

                </span>

                <span><label class="btn"><input id="btn" type="button" value="提交" /></label></span>
            </form>
        </div>
        <!-- 公告 -->
        <div class="advice">
            <p class="title">上传须知</p>
            <hr />
            <p><span>*</span>如涉及侵权内容,您的资源将被移除</p>
            <p><span>*</span>请勿上传小说、mp3、图片等与技术无关的内容.一旦发现将被删除</p>
            <p><span>*</span>请勿在未经授权的情况下上传任何涉及著作权侵权的资源，除非该资源完全由您个人创作</p>
            <p><span>*</span>点击上传资源即表示您确认该资源不违反资源分享的使用条款，并且您拥有该资源的所有版权或者上传资源的授权</p>
        </div>
    </div>

</body>
</html>
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
<script>
		$(function(){
			privilege();
			$("div.mystar span").click(function(){
				$(this).addClass('act2').prevAll("span").addClass("act2");
				$(this).nextAll("span").removeClass("act2");
			});
			$(".rf a:first").removeAttr('href');
			//查询页面上方文件信息
			queryThisFile();
			//查询该文件资源的评论信息
			queryThisFileComment(1);
			//判断session
			isLogin();
		});
		//判断session是否有值
		function isLogin(){
			var userid = $("#sessionUid").val();
			if(userid==""){
				//点击下载跳转至首页
				$("#downloadThis").hide();
				//点击收藏跳转至首页
				$("#collectThis").hide();
				//点击发表评论跳转至首页
				$("#addFileCommentBtn").attr("onclick","");
			}
		}
		//查询页面上方文件信息
		function queryThisFile(){
			var fileId = $("#thisFileId").val();
			$.ajax({
				url:"file/queryThisFile?fileId="+fileId,
				type:"post",
				dataType:"json",
				success:function(result){
					thisFile_json(result);
				}
			})
		}
		//日期格式转换
		function Transdate(time) {
			var date = new Date(time);
			return date.toLocaleString();
		}
		//计算文件大小
		function calFileSize(fileSize){
			var size = (fileSize/1024);
			var sizeM=size/1024;
			var a;
			var b;
			var result;
			//如果够1M
			if(sizeM>=1){
				 b = parseFloat(sizeM).toFixed(3);//小数位数的数字
				 result = b.substring(0,b.toString().length-1);
				 return result+"M";//这个方法有问题
			//如果不够1M
			}else{
				 a = fileSize/1024;
				 b = parseFloat(a).toFixed(3);
				 result = b.substring(0,b.toString().length-1);
				 return result+"kb";
			}
		}
		//分裂显示关键字
		function calFileKeyWord(val){
			var arr = val.split(" ");
			return arr;
		}
		//解析页面上方文件信息
		function thisFile_json(result){
			$.each(result.extend.fileResourceList,function(index,current){
				var flg=current.fileType;
				var imgState;
			    imgState = $("<img />").attr("src","./images/"+flg+".svg");
				$("#img").append(imgState);
				$("#thisFileName").append(current.fileName);
				$("#thisFileUploadDate").append(Transdate(current.uploadDate)+"&emsp;上传大小:"+calFileSize(current.fileSize));
				for(var i=0;i<calFileKeyWord(current.keyWord).length;i++){
					var spans = $("<span></span>").append(calFileKeyWord(current.keyWord)[i]);
					$("#thisFileKeyWord").append(spans);
				};
				$("#thisFileContent").append(current.introduction);
				$("#thisFileScore").append(current.score);
				$("#thisFileDownloadTime").append(current.downloadCount);
				$("#downloadThis").prop("href","file/downloadThisFile?fileId="+current.fileId);
				$("#collectThis").attr("onclick","collectThisFile("+current.fileId+")");
				for(var i=1;i<=result.extend.avgGrade;i++){
					$("#grade"+i).prop("class","act");
				}
			})
		}
		//收藏文件
		function collectThisFile(val){
			$.ajax({
				url:"file/collectThisFile?fileId="+val,
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.extend.count==1){
						alert("收藏成功");
					}
				}	
			})		
		}
		//一览文件的评论信息
		function queryThisFileComment(currentPage){
			var fileId = $("#thisFileId").val();
			$.ajax({
				url:"file/queryThisFileComment?fileId="+fileId+"&currentPage="+currentPage,
				dataType:"json",
				type:"json",
				success:function(result){
					$("#totalCounts").html("共有"+result.extend.totalCount+"条");
					//解析评论
					thisFileComment_json(result);
					//解析分页
					thisCommentPage_json(result);
				}
			})
		}
		
		//解析评论
		function thisFileComment_json(result){
			$("#commentjson").empty();
			$.each(result.extend.fileCommetList,function(index,current){
				//评分的span
				var starSpan=$("<span class='star'></span>");
				//获取评分
				var score = current.commentGrade;
				for(var i=1;i<=score;i++){
					starSpan.append("<span class='act'>★</span>");
				}
				for(var i=1;i<=5-score;i++){
					starSpan.append("<span>★</span>");
				}
				//评论时间
				var timer = $("<span class='timer'></span>").append(Transdate(current.commentDate));
				//评论人姓名
				var userName =$("<span class='author'></span>").append(current.user.userName);
				//评论的内容
				var content = $("<div class='msg'></div>").append("<dt>"+current.commentContent+"</dt>");
				var cmtDiv = $("<div class='cmt'></div>")
				.append(userName)
				.append(timer)
				.append(starSpan)
				.append(content);
				//头像
				var img = $("<img />").prop("src","user/showImgs?userid="+current.user.userid);
				var headImg = $("<div class='img'></div>").append(img);
				$("<div class='cons'></div>")
				.append(headImg)
				.append(cmtDiv)
				.appendTo("#commentjson");	
			})
		}
		//解析分页
		function thisCommentPage_json(result){
			$("#changePage").empty();
			var firstPage = $("<a></a>").append("首页");
			   var lastPage = $("<a></a>").append("上一页");
			   if(result.extend.currentPage==1){
				   firstPage.addClass("disabled");
				   lastPage.addClass("disabled");
			   }else{
				   firstPage.click(function(){
					   queryThisFileComment(1);
				   });
				   lastPage.click(function(){
					   queryThisFileComment(result.extend.currentPage - 1);
				   });
			   }
			   var endPage = $("<a></a>").append("尾页");
			   var nextPage = $("<a></a>").append("下一页");
			   if(result.extend.currentPage==result.extend.totalPage){
				   endPage.addClass("disabled");
				   nextPage.addClass("disabled");
			   }else{
				   endPage.click(function(){
					   queryThisFileComment(result.extend.totalPage);
				   });
				   nextPage.click(function(){
					   queryThisFileComment(result.extend.currentPage + 1);
				   });
			   }
			   $("#changePage")
			   .append(firstPage).append("&emsp;")
			   .append(lastPage).append("&emsp;")
			   .append(nextPage).append("&emsp;")
			   .append(endPage).append("&emsp;");
			   $("#changePage").append("共"+result.extend.totalPage+"页,当前是第"+result.extend.currentPage+"页");
		}
		
		//发表评论
		function addFileComment(){
			//获取星星评分
			var grade=0;
			$(".act2").each(function(){
				grade++;
			})
			$("#mycommentGrade").val(grade);
			alert(grade);
			$.ajax({
				url:"file/addFileComment",
				data:$("#mycommentsForm").serialize(),
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
        <!-- 定义详细目录-->
        <div id="detail">
            <div class="title"> <!-- 主信息-->
                <div class="img" id="img">  
                </div>
                <div class="cons">
                    <div>
                        <label id="thisFileName"></label>
                    </div>
                    <div>
                        <label id="thisFileUploadDate"></label>
                        <label id="thisFileKeyWord"></label>
                    </div>
                </div>
            </div>
            <div class="desc" id="thisFileContent"> <!-- 信息描述-->
            </div>
            <div class="msg"> <!-- 评价信息-->
                <span id="grade1" class="">★</span>
                <span id="grade2" class="">★</span>
                <span id="grade3" class="">★</span>
                <span id="grade4" class="">★</span>
                <span id="grade5" class="">★</span>
            </div>
            <div class="oper"> <!-- 下载操作-->
                <span>所需积分：<b id="thisFileScore"></b></span>
                <span>下载次数：<b id="thisFileDownloadTime"></b></span>
                <span>
                    <a class="btn" id="downloadThis">下载</a>
					<a class="btn" id="collectThis">收藏</a>
                </span>
            </div>
        </div>
        <div id="comment">
            <div class="title">
                                  评论：<span id="totalCounts"></span>
                 <span id="changePage"></span>
                <hr />
            </div>
            <!--每一条评论 -->
            <div id="commentjson">
              
            </div>
        </div>

        <!-- 开始评论-->
        <div id="mycomments">
        <form method="post" id="mycommentsForm">
            <div>
                <span>我的评论</span>
                <hr />
                <input type="hidden" id="sessionUid" name="userid" value="${sessionScope.user.userid}" >
                <input type="hidden" id="thisFileId" name="fileId" value="${fileId}" >
                <textarea id="commentContent" name="commentContent" placeholder="可以留下您的宝贵意见哟"></textarea>
                <div class="mystar" > <!-- 评价信息-->
                    <span >★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                </div>
                <input type="hidden" name="commentGrade" id="mycommentGrade" value="">
                <a class="btn" id="addFileCommentBtn" href="javascript:void(0)" onclick="addFileComment()">评论</a>
            </div>
       </form>

        </div>
    </div>

</body>

</html>
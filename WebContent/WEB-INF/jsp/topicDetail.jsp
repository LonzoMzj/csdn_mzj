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

//锚点定位
function anchor(str){
    document.getElementById(str).scrollIntoView();
}
 
 $(function(){
	    privilege();
	    //查询页面上方帖子信息
		queryThisTopic();
		//查询该帖子的评论信息
		queryThisTopicComment(1);
 })
 
 //日期格式转换
		function Transdate(time) {
			var date = new Date(time);
			return date.toLocaleString();
		}
 //查询页面上方帖子内容
 function queryThisTopic(){
	 var thisTopicId = $("#thisTopicId").val();
	 $.ajax({
			url:"topic/queryThisTopic?id="+thisTopicId,
			type:"post",
			dataType:"json",
			success:function(result){
				thisTopic_json(result);
			}
		})
 }
 //解析页面上方帖子内容
 function thisTopic_json(result){
	 $("#tieziType").append("["+result.extend.topic.type+"]");
	 $("#tieziName").append(result.extend.topic.title);
	 $("#tieziContent").append(result.extend.topic.content);
	 $("#toIds").prop("value",result.extend.topic.user.userid);
	 $("#others").append("发帖人:"+result.extend.topic.user.userName+"&emsp;发帖时间:"
	 +Transdate(result.extend.topic.date));
	 
	// $("#topicId").append(result.extend.topic.id);
 }
 //查询页面下方该帖子的评论信息
 function queryThisTopicComment(currentPage){
	 //topicId=id
	 var topicId = $("#thisTopicId").val();
		//alert(fileId);
		$.ajax({
			url:"topic/queryThisTopicComment?topicId="+topicId+"&currentPage="+currentPage,
			dataType:"json",
			type:"json",
			success:function(result){
				//解析评论
				thisTopicComment_json(result);
				//解析分页
				thisTopicCommentPage_json(result);
			}
		})
 }
 //解析评论
 function thisTopicComment_json(result){
	 $("#reply_main").empty();
	 $.each(result.extend.topicList,function(index,current){
		 var name = $("<p></p>").append(current.user.userName);
		 var img = $("<img />").prop("src","user/showImgs?userid="+current.user.userid);
		 var headImg = $("<div></div>").append(img);
		 var lfDiv = $("<div class='lf'></div>").append(name).append(headImg);
		 var lineDiv = $("<div class='line'></div>");
		 var timeSpan = $("<span></span>").append("发表于:"+Transdate(current.date));
		 var louceng = $("<span></span>").append((index+1)+"楼");
		 var titleP =$("<p class='title'></p>").append(timeSpan).append(louceng);
		 var contentP= $("<p class='content'></p>").append(current.content);
		 var strong = $("<a>回复</a>").attr("href","javascript:void(0)").attr("onclick","showWin("+current.user.userid+","+current.id+")");
		 var spanTo =$("<span></span>").append(strong);
		 var chakan = $("<b>点击查看</b>").attr("id","closeAndOpen"+(index+1)).attr("onclick","chakanComment("+current.id+","+(index+1)+")");
		 var spanTo2 = $("<span></span>").append(chakan);
		 var bottomP=$("<p class='bottom'></p>").append(spanTo).append(spanTo2);
		 var commentList =$("<div class='comment_list' show='no' ></div>").attr("id","comment_list"+(index+1));
		 var rfDiv= $("<div class='rf'></div>").append(titleP).append(contentP).append(bottomP).append(commentList);
		 $("<div class='floor_list'></div>")
		 .append(lfDiv)
		 .append(lineDiv)
		 .append(rfDiv)
		 .appendTo("#reply_main");
	 })
 }
 //解析分页
 function thisTopicCommentPage_json(result){
	 $("#panigation").empty();
	   var firstPage = $("<a></a>").append("首页");
	   var lastPage = $("<a></a>").append("上一页");
	   if(result.extend.currentPage==1){
		   firstPage.addClass("disabled");
		   lastPage.addClass("disabled");
	   }else{
		   firstPage.click(function(){
			   queryThisTopicComment(1);
		   });
		   lastPage.click(function(){
			   queryThisTopicComment(result.extend.currentPage - 1);
		   });
	   }
	   var endPage = $("<a></a>").append("尾页");
	   var nextPage = $("<a></a>").append("下一页");
	   if(result.extend.currentPage==result.extend.totalPage){
		   endPage.addClass("disabled");
		   nextPage.addClass("disabled");
	   }else{
		   endPage.click(function(){
			   queryThisTopicComment(result.extend.totalPage);
		   });
		   nextPage.click(function(){
			   queryThisTopicComment(result.extend.currentPage + 1);
		   });
	   }
	   $("#panigation")
	   .append(firstPage).append("&emsp;")
	   .append(lastPage).append("&emsp;")
	   .append(nextPage).append("&emsp;")
	   .append(endPage).append("&emsp;");
	   $("#panigation").append("一共有"+result.extend.totalCount+"条数据,当前是第"+result.extend.currentPage+"页");
 }
 
 function addTopicComment(){
	 $.ajax({
			url:"topic/addTopicComment",
			data:$("#addTopicCommentForm").serialize(),
			type:"post",
			dataType:"json",
			success:function(result){
				if(result.extend.count==1){
					alert("回复成功");
					window.location.reload(true);
				}
			}
		})
 }
 function addCommentComments(){
	 //alert(1);
	 $.ajax({
			url:"topic/addCommentComment",
			data:$("#addCommentCommentForm").serialize(),
			type:"post",
			dataType:"json",
			success:function(result){
				if(result.extend.count==1){
					alert("回复成功");
					window.location.reload(true);
				}
			}
		})
 }
 
 function showWin(toId,topicId){
	/*  alert(toId);
	 alert(topicId); */
	 $("#reTopicId").val(topicId);
	 $("#reToId").val(toId);
     //获取对应的DIV元素
     var div = document.getElementById("cvs2_logon");
     div.style ='display:block';
 }
 function close_win(){
     var div = document.getElementById("cvs2_logon");
     div.style = 'display:none' ;
 }
 //查看评论中评论
 function chakanComment(topicId,index){
	 //alert(index);
	 $.ajax({
		 url:"topic/chakanComment?topicId="+topicId,
		 type:"post",
		 dataType:"json",
		 success:function(result){
			 //解析
			 thisCommentComment_json(result,index);
		 }
	 });
 }
 //Todu
 function thisCommentComment_json(result,index){
	 //alert(index);
  $("#comment_list"+index).empty();
  var heightList=0;
  $.each(result.extend.topicList,function(i,current){
	  var img =$("<img />").attr("src","user/showImgs?userid="+current.user.userid);
	  var contentP =$("<p class='content'></p>").append(current.content);
	  var timeSpan = $("<span></span>").append(Transdate(current.date));
	  var timeDiv = $("<div></div>").append(timeSpan);
	  $("<div class='list_main'></div>")
	  .append(img)
	  .append(contentP)
	  .append(timeDiv)
	  .appendTo("#comment_list"+index); 
	  heightList+=200;
  });
  if($("#comment_list"+index).attr('show')=='no'){
	  $("#comment_list"+index).css('height','0px').css('display','block').attr('show','ok')
 	    .animate({height:heightList+'px',opacity:1},1000);
      $("#closeAndOpen"+index).html('点击收起');

 } else {
	 $("#comment_list"+index).animate({height:'0px',opacity:0},1000,function() {
		 $("#comment_list"+index).attr('show','no').css('display','none');
 	    });
	 $("#closeAndOpen"+index).html('点击查看');
 }
  
 }
</script>
</head>
<body>
     <%@ include file="/commonPage/top.jsp" %>
     
     <!-- 回复弹出层 -->
    <div class="cvs" style="display:none" id="cvs2_logon">
        <div class="newModWin">
            <div class="title">回复</div>
            <div class="close" id="cvs2_close" onclick="close_win()">X</div>

            <div class="logWin">
                <form action="" method="post" id="addCommentCommentForm">
                <input type="hidden" name="topicId" id="reTopicId" value=""><br>
                <input type="hidden" name="toId" id="reToId" value=""><br>
                <textarea  rows="10" cols="50" name="content" style="margin-left: 40px;margin-bottom: 50px" ></textarea>
                <input type="button" id="addCommentComment" class="su_btn" value="回复" onclick="addCommentComments()" >
                </form>
            </div>
        </div>
    </div>
     <input type="hidden" id="thisTopicId" value="${id}">
     <input type="hidden" id="sessionUname" value="${user.userName}">
    <!-- 网站主体 -->
    <div id="main">
        <div class="bbs">
			<a class="btn" href="javascript:anchor('tiezi')">发帖</a>
			<hr />
			
			<!-- 原帖 -->
			<div class="floor">
				  <div class="lf_1">
					<!-- <span>[置顶]</span> -->
					<span id="tieziType"></span>
					<a href="javascript:void(0)" id="tieziName"></a>
					<span id="others"></span>
					<hr/>
				  </div>
				  <div class="cons" id="tieziContent">
				  </div>
			</div>
			
			

			<!-- 回复帖子-->

            <div class="reply_mian" >
                 
                 <!-- 一楼 --> 
                 <div id="reply_main">          
				     <div class="floor_list">
					   <div class="line"></div>
					    <div class="rf">
			                <p class="title">
			                  <span></span>
							  <span></span>
							</p>
							<p class="content"></p>
							 
					   	</div> 
			         </div>
			     
			        <div class="comment_list"  show="no" id="comment_list">

	                </div>  
			    </div>
	            

				
			</div>
			
			<!-- 分页 -->
			
			<div class="panigation" id="panigation">
				<!-- <a>&lt;上一页</a>
				<a>1</a>
				<a>2</a>
				<a class="act">3</a>
				<a>4</a>
				<a>5</a>
				<a>下一页></a> -->
			</div>
			
			
			
			<a class="btn" href="#tiezi">发帖</a>
			<hr />
			
			<!-- 开始发帖-->
			<!-- 上传表单-->
			<div class="bbs_tz" id="tiezi">
				<p>快速回复</p>
				<hr />
				<form action="" method="post" id="addTopicCommentForm">
				<input type="hidden" name="toId" id="toIds" value="">
				<input type="hidden" name="topicId" id="topicId" value="${id}">
					<span>
						<textarea  class="area" name="content"></textarea>
					</span>
					<span><a id="addTopicCommentBtn" class="btn" href="javascript:void(0)" onclick="addTopicComment()">发表回复</a></span>
				</form>
			</div>
			
		</div>
		
    </div>

    <script>
		function replay(tag){
			console.log($(tag).next());
			$(tag).next().fadeToggle();
		}
				
	</script>
</body>

</html>
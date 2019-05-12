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
<title>积分详情</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/highcharts.js"> </script>
 <script type="text/javascript" src="js/exporting.js"> </script>
<script type="text/javascript">
$(function(){
	queryScoreDetail(1);
	queryForHighCharts();
})
//日期格式转换
	function Transdate(time) {
		var date = new Date(time);
		return date.toLocaleString();
	}
function queryScoreDetail(currentPage){
	$.ajax({
		url:"scoreDetail/queryScoreDetail",
		type:"post",
		data : "currentPage=" + currentPage,
		dataType:"json",
		success:function(result){
			$("#sum").html(result.extend.sumScore);
			table_json(result);
			page_json(result);			
		}
	})
}
//饼图
function queryForHighCharts(){
	$.ajax({
		url:"scoreDetail/queryForHighCharts",
		type:"post",
		dataType:"json",
		success:function(result){
			highChart_json(result);
		}
	})
}
//解析table
function table_json(result){
	$("#mytable tbody").empty();
	$.each(result.extend.scoreDetailList, function(index, current) {
		var flg=current.scoreSource;
		var source;
		if(flg==1){
			source="用户注册";
		}else if(flg==2){
			source="上传资源";
		}else if(flg==3){
			source="评论资源/帖子";
		}else if(flg==4){
			source="下载资源";
		}else{
			source="发表帖子";
		}
		var number = $("<td></td>").append(index+1);
		var scoreCount =$("<td></td>").append(current.scoreCount);
		var expendTime = $("<td></td>").append(Transdate(current.expendTime));
		var scoreSource = $("<td></td>").append(source);
		$("<tr></tr>")
		.append(number)
		.append(scoreCount)
		.append(expendTime)
		.append(scoreSource)
		.appendTo("#mytable tbody");
	});
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
			   queryScoreDetail(1);
		   });
		   lastPage.click(function(){
			   queryScoreDetail(result.extend.currentPage - 1);
		   });
	   }
	   var endPage = $("<a></a>").append("尾页");
	   var nextPage = $("<a></a>").append("下一页");
	   if(result.extend.currentPage==result.extend.totalPage){
		   endPage.addClass("disabled");
		   nextPage.addClass("disabled");
	   }else{
		   endPage.click(function(){
			   queryScoreDetail(result.extend.totalPage);
		   });
		   nextPage.click(function(){
			   queryScoreDetail(result.extend.currentPage + 1);
		   });
	   }
	   $("#panigation")
	   .append(firstPage).append("&emsp;")
	   .append(lastPage).append("&emsp;")
	   .append(nextPage).append("&emsp;")
	   .append(endPage).append("&emsp;");
	   $("#panigation").append("一共有"+result.extend.totalCount+"条数据,当前是第"+result.extend.currentPage+"页");
}

function highChart_json(result){
	 var  chart = Highcharts.chart('container', {
			chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false
			},
			title: {
					text: '积分消费明细'
			},
			tooltip: {
					headerFormat: '{series.name}<br>',
					pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
					pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
									enabled: true,
									format: '<b>{point.name}</b>: {point.percentage:.1f} %',
									style: {
											color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
									}
							},
							states: {
									hover: {
											enabled: false
									}  
							},
							slicedOffset: 20,         // 突出间距
							point: {                  // 每个扇区是数据点对象，所以事件应该写在 point 下面
									events: {
											// 鼠标滑过是，突出当前扇区
											mouseOver: function() {
													this.slice();
											},
											// 鼠标移出时，收回突出显示
											mouseOut: function() {
													this.slice();
											},
											// 默认是点击突出，这里屏蔽掉
											click: function() {
													return false;
											}
									}
							}
					}
			},
			series: [{
					type: 'pie',
					name: '各个方式积分消费占比',
					data: [
							['用户注册',  result.extend.r1],
							//['上传资源',  result.extend.r2],
							{
									name: '上传资源',
									y: result.extend.r2,
									sliced: true, // 突出显示这个点（扇区），用于强调。
							}, 
							['评论资源/帖子', result.extend.r3],
							['下载资源',   result.extend.r4],
							['发表帖子',  result.extend.r5]
					]
			}]
	});
}
</script>
</head>
<body>
<%@ include file="/commonPage/top.jsp" %>
<div class="page_nav">
        <p>当前积分：<span id="sum"></span></p>
    </div>

        <!-- 上传表单-->
	<div class="page_tb">
		<table id="mytable">
			<thead>
				<tr>
					<th>序号</th>
					<th>积分</th>
					<th>时间</th>
					<th>来源</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		
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
	<br>
	<div id="container" style="min-width:400px;height:400px"></div>
</body>
</html>
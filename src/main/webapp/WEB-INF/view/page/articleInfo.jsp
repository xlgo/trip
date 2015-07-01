<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>西葡游</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/main/tourguideInfo.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>" />
	<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery-1.11.1.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js" />"></script>
	<script type="text/javascript">
		
	</script>
	<style type="text/css">
		body{
			background-color: #eee;
		}
		.titleText{
			font-size:28px;
			
		}
		.titleItem{
			font-size:24px;
			margin-left: 20px;
		}
		.titleLogin{
			font-size:18px;
			margin-left: 20px;
		}
		.titleBar a:HOVER,.titleBar a:ACTIVE,.titleBar a:VISITED,.titleBar a:LINK{
			color: #fff;
			font-weight: bold;
		}
		.bodyDiv{
			width: 1180px;
			margin: 0px auto;
			margin-top: 30px;
		}
		.bodyLeft{
			background-color: #fff;
			width: 930px;
			float: left;
		}
		.bodyRight{
			background-color: #fff;
			width: 220px;
			float: left;
			margin-left: 30px;
		}
		.bodyContext{
			width: 835px;
			margin: 0px auto;
		}
		
		.bodyIcon{
			width: 140px;
			float: left;
		}
		.titleInfo{
			width: 690px;
			float: left;
		}
		.realTitle{
			margin-top:20px;
			padding-bottom:3px;
			font-size: 34px;
			font-weight:bold;
			border-bottom:solid 1px #cecece;
		}
		.realInfo{
			color: #555;
			padding-top: 7px;
			font-size: 16px;
		}
		
		.bodyInfo{
			background-color: #f5f5f5;
			margin-top: 20px;
			font-size: 21px;
			color: #000;
		}
		.bodyInfo .c1 {
			padding:5px 0px;
		}
		.bodyInfo .c1 span{
			margin-left:30px;
			padding-left:40px;
			display: inline-block;
		}
		.icon1{
			background: url("../resource/img/triptourguide/icon1.png") no-repeat;
		}
		.icon2{
			background: url("../resource/img/triptourguide/icon2.png") no-repeat;
		}
		.icon3{
			background: url("../resource/img/triptourguide/icon3.png") no-repeat;
		}
		.icon4{
			background: url("../resource/img/triptourguide/icon4.png") no-repeat;
		}
		.icon5{
			background: url("../resource/img/triptourguide/icon5.png") no-repeat;
		}
		.icon6{
			background: url("../resource/img/triptourguide/icon6.png") no-repeat;
		}
		.bodyRight{
			text-align: center;
			padding:30px 0px;
		}
	</style>
</head>
<body>
	<div class="main">
		<div class="titleBar" style="width: 100%px;background-color: #ff6600;">
			<table style="width: 1180px;height:40px; margin: 0px auto;">
				<tr>
					<td>
						  <a href="../" class="titleText" >西葡游</a>
					</td>
					<td width="400">
						<a href="#" class="titleItem" >预约导游</a>
						<c:forEach var="item" items="${articleType}">
							<a href="#" class="titleItem" >${item.articleTypeName }</a>
						</c:forEach>
					</td>
					<td width="140" style="text-align: right;">
						<a href="javascript:dialog();" class="titleLogin">注册</a>
		 				<a href="#"  class="titleLogin">登陆</a>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<div class="bodyDiv">
				<div class="bodyLeft">
					<div class="bodyContext">
						<div class="bodyIcon">&nbsp;
						</div>
						<div class="titleInfo">
							<div class="realTitle">
									${tripArticle.articleTitle }
							</div>
							<div class="realInfo">
								<span>更新时间：<fmt:formatDate value="${tripArticle.createTime }" pattern="yyyy-MM-dd"/>	</span>
								<span style="float: right;">——文章来自西葡游用户真实体验，转载请标明作者、出处</span>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div style="clear: both;"></div>
						<div class="bodyInfo">
							<div class="c1">
								<span class="icon1">天数：${tripArticle.articleDays }</span>
								<span class="icon2">时间：${tripArticle.articleStartTime }</span>
								<span class="icon3">导游：${tripArticle.articleGuideId }</span>
								<span class="icon4">导游费用：${tripArticle.articleCreateBy }</span>
							</div>
							<div class="c1">
								<span  class="icon5">标签：${tripArticle.articleLabel }</span>
							</div>
							<div class="c1">
								<span  class="icon6">提到过那些地方：${tripArticle.articleRemindArea }</span>
							</div>
						</div>
						<div style="margin: 10px 0px;"><fmt:formatDate value="${tripArticle.createTime }" pattern="yyyy-MM-dd HH:mm"/></div>
						<div class="zhengwen">
							${tripArticle.articleContent }
						</div>
					</div>
				</div>
				<div class="bodyRight">
					<img alt="" src="<c:url value="/resource/img/triptourguide/erweima.jpg"/>">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>西葡游</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/main/index.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>" />
	<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery-1.11.1.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js" />"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div style="width:1380px;">
		<div>
			<img src="<c:url value="/resource/img/index/page_top.png"/>">
		</div>
		<div id="bar1">
			<a href="index" class=${empty param.areaId ?"curr":"" }>所有</a>
			<c:forEach var="item" items="${area}">
				<a class="${item.areaId == param.areaId ?"curr":"" }" href="index?areaId=${item.areaId}">${item.areaName }</a>
			</c:forEach>
			<a class="btn">╋&nbsp;加入西葡牙人</a>
		</div>
		<div style="width: 1180px;margin: 0px auto;">
			<div id="daoyou">
				<div class="itemTitle">
					<table>
						<tr>
							<td><img src="<c:url value="/resource/img/index/wenzhang.png"/>" align="bottom" /></td>
							<td valign="bottom"><span>找到你的私人的导游</span></td>
						</tr>
					</table>
				</div>
				<div id="daoyouItems"></div>
				<a class="ajaxLoad" href="tourguide?guideServiceArea=${param.areaId}&pageNum=1&pageSize=8">找到你的私人的导游</a>
				<script type="text/javascript">
					$(function(){
						if(!$("#daoyouItems").html()){
							$("#daoyouItems").load("tourguide?guideServiceArea=${param.areaId}&pageNum=1&pageSize=8");
						}
						$("#daoyouItems").on("click","li",function(){
							$("#daoyouItems").load($(this).find("a").attr("href"));
						});
					});
				</script>
			</div>
			<c:forEach var="item" items="${articleType}">
				<div class="" >
						<div style="">
							<img src="<c:url value="/resource/img/index/dingyue.png"/>">
						</div>
						<div class="itemTitle">
							<table>
								<tr>
									<td><img src="<c:url value="/resource/img/index/wenzhang.png"/>" align="bottom" /></td>
									<td valign="bottom"><span>${item.articleTypeName }</span></td>
								</tr>
							</table>
						</div>
						<div class="wenzhangItems_${item.articleTypeId }"></div>
						<a class="ajaxLoad" href="article?articleTypeId=${item.articleTypeId}&guideServiceArea=${param.areaId}&pageNum=1&pageSize=6">${item.articleTypeName}</a>
						<script type="text/javascript">
						$(function(){
							if(!$(".wenzhangItems_${item.articleTypeId}").html()){
								$(".wenzhangItems_${item.articleTypeId}").load("article?articleTypeId=${item.articleTypeId}&guideServiceArea=${param.areaId}&pageNum=1&pageSize=6");
							}
							$(".wenzhangItems_${item.articleTypeId}").on("click","li",function(){
								$(".wenzhangItems_${item.articleTypeId}").load($(this).find("a").attr("href"));
							});
							
						});
					</script>
				</div>
			</c:forEach>
		</div>
		
		<div class="bottom">
			<img src="<c:url value="/resource/img/index/bottom.png"/>">
		</div>
	</div>
</body>
</html>
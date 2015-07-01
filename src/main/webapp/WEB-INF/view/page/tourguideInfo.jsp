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
			width: 700px;
			float: left;
		}
		.bodyRight{
			width: 450px;
			float: left;
			margin-left: 30px;
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
				<div class="title"> biaoti
				</div>
				<div>
					<div class="bodyLeft">
						<div>照片</div>
						<div>
							<div>导游自述</div>
							<div></div>
						</div>
					</div>
					<div class="bodyRight">
						right
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>试卷信息</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>" />
	<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery-1.11.1.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js" />"></script>
	<script type="text/javascript">
	
	function viewRanking(examId){
		$.get('<c:url value="/project/userexamination/ranking?id="/>'+examId+"&_r="+Math.random(),function(data){
			$("#"+examId).html('<span class="label label-info">'+data+'</span>');
		});
	}
	</script>
</head>
<body>
<!-- 
<div class="page-header">
  <h1>用户试卷信息 <small>请选择一个试卷进行操作</small></h1>
</div>
 -->
 <br/> <br/>
<div class="well" style="width:90%;margin:0px auto;">
	<table class="table">
		<thead>
			<tr>
				<th>试卷名称</th>
				<th>开始答卷时间</th>
				<th>答卷耗时(分钟)</th>
				<th>得分</th>
				<th>排名</th>
				<th align="center">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${modelList}" var="model" varStatus="eachStatus">
				<tr>
					<td>${model.userExaminationExaminationName}</td>
					<td>
						<fmt:formatDate value="${model.createTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td>
						<fmt:formatNumber value="${model.userExaminationTimeLength}" pattern="0.0"/>
					</td>
					<td>${model.userExaminationScore}</td>
					<td><span id="${model.userExaminationExaminationId}"></span></td>
					<td>
						<a class="btn btn-info btn-sm" title="排名只是目前的排名，只有竞赛结束后才是到正的排名" onclick="viewRanking('${model.userExaminationExaminationId}')" href="javascript:void(0)">查看排名</a>
						<a class="btn btn-warning btn-sm" href="<c:url value="/project/userexamination/contrast?id=${model.userExaminationExaminationId}"/>">错题对比</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>
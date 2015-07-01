<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<div class="items3">
	<c:forEach  var="item" items="${article.list}" varStatus="i">
			<div class="item" style="${i.count%3==0?"margin-right: 0px;":""}">
			<a href="<c:url value="/page/articleInfo?id=${item.id}"/>" >
				<img src="<c:url value="/trip/sysattachment/download?businessId=${item.id}&businessModel=cn.hnzxl.trip.project.model.TripArticle&businessType=photo"/>" />
				<div class="info">
					<div class="bg"></div>
					<div class="info01">${item.articleTitle}</div>
				</div>
				<div>${item.articleContent}</div>
			</a>
			</div>
	</c:forEach>
	<div style="clear: both;"></div>
</div>
<div class = "pagebar">
	<ul>
		<c:set var="begin"  value="${article.pageNum - 3 < 1?1:article.pageNum+2>=article.pages?article.pages-4:article.pageNum-2}" />
		<c:forEach var="index" begin="${begin}" end="${begin+4>article.pages?article.pages:begin+4 }">
	    	<li><a class="${article.pageNum == index ?"currPage":""}" onclick="javascript:return false;" href="article?guideServiceArea=${param.guideServiceArea}&pageNum=${index}&pageSize=${article.pageSize}">${index}</a></li>
		</c:forEach>
	    
	    <li><a onclick="javascript:return false;" href="article?articleTypeId=${param.articleTypeId}&guideServiceArea=${param.guideServiceArea}&pageNum=${article.pageNum+1>article.pages?article.pages:article.pageNum+1}&pageSize=${article.pageSize}">NEXT</a></li>
	</ul>
	<div style="clear: both;"></div>
</div>
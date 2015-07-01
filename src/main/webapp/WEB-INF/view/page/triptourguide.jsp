<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<div class="items">
	<c:forEach  var="item" items="${tourguide.list}" varStatus="i">
		<div class="item" style="${i.count%4==0?"margin-right: 0px;":""}">
			<a href="<c:url value="/page/tourguideInfo?id=${item.id}"/>" >
				<img src="<c:url value="/trip/sysattachment/download?businessId=${item.id}&businessModel=cn.hnzxl.trip.project.model.TripTourGuide&businessType=photo"/>" />
				<div class="info">
					<div class="bg"></div>
					<div class="info01">${item.guideName}</div>
					<div class="info02">${item.guideIntro }</div>
				</div>
			</a>
		</div>
	</c:forEach>
	<div style="clear: both;"></div>
</div>
<div class = "pagebar">
	<ul>
		<c:set var="begin"  value="${tourguide.pageNum - 3 < 1?1:tourguide.pageNum+2>=tourguide.pages?tourguide.pages-3:tourguide.pageNum-2}" />
		<c:forEach var="index" begin="${begin}" end="${begin+4>tourguide.pages?tourguide.pages:begin+4 }">
	    	<li><a class="${tourguide.pageNum == index ?"currPage":""}" onclick="javascript:return false;" href="tourguide?guideServiceArea=${param.guideServiceArea}&pageNum=${index}&pageSize=${tourguide.pageSize}">${index}</a></li>
		</c:forEach>
	    
	    <li><a onclick="javascript:return false;" href="tourguide?guideServiceArea=${param.guideServiceArea}&pageNum=${tourguide.pageNum+1>tourguide.pages?tourguide.pages:tourguide.pageNum+1}&pageSize=${tourguide.pageSize}">NEXT</a></li>
	</ul>
	<div style="clear: both;"></div>
</div>
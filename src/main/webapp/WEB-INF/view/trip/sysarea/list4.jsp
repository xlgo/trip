<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="cn.hnzxl.exam.project.model.Question"%>
<%@page import="com.github.pagehelper.Page"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<%@ include file="/WEB-INF/view/common/pageForm.jsp"%>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="<c:url value="${modelPath}list4"/>" method="post">
		<input type="hidden" name="navTabId" value="${searchParam.navTabId}" />
		<div class="searchBar">
			<ul class="searchContent">
				<li style="width: 246px;">
					<label  style="width: 60px;">国家名称：</label>
					<select name="areaPId">
						<option value="">==全部==</option>
						<c:forEach var="item" items="${sysArea2}">
							<option value="${item.areaId}" ${item.areaId == searchParam.areaPId ?"selected" :""  }>${item.areaName}</option>
						</c:forEach>
					</select>
				</li>
				<li style="width: 246px;"><label  style="width: 60px;">城市名称：</label> <input type="text" name="S_areaName" value="${searchParam.S_areaName}" /></li>
			</ul>
			<div class="subBar">
				<ul>
					<li>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div>
					</li>
					<%-- 
					<li><a class="button" href="demo_page6.html" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li>
					--%>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a title="城市维护-添加" class="add" href="<c:url value="${modelPath}add4?navTabId=${searchParam.navTabId}"/>" target="navTab" rel="${searchParam.navTabId}_add4"><span>添加</span></a></li>
			<li><a warn="请至少选择一行进行删除！" title="确实要删除吗？" target="selectedTodo" rel="id" href="<c:url value="${modelPath}delJSON"/>" class="delete"><span>批量删除</span></a></li>
			<li><a title="城市维护-修改" class="edit" href="<c:url value="${modelPath}edit4?navTabId=${searchParam.navTabId}&id="/>{modeId}" rel="${searchParam.navTabId}_edit4" target="navTab" fresh="false" warn="请选要编辑的行！" ><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="id" class="checkboxCtrl"></th>
				<th>国家名称</th>
				<th orderField="area_name" class="${searchParam.sortField=='area_name'?searchParam.sortOrder:""}">城市名称</th>
				<th orderField="area_en_name" class="${searchParam.sortField=='area_en_name'?searchParam.sortOrder:""}">英文名</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageList.list}" var="model" varStatus="eachStatus">
				<tr target="modeId" rel="${model.id}"  >
					<td><input name="id" value="${model.id}" type="checkbox"></td>
					<td>${model.areaPName}</td>
					<td>${model.areaName}</td>
					<td>${model.areaEnName}</td>
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="<c:url value="${modelPath}delJSON?id=${model.id}"/>" class="btnDel">删除</a>
						<a title="城市-修改" target="navTab" rel="${searchParam.navTabId}_edit4" href="<c:url value="${modelPath}edit4?navTabId=${searchParam.navTabId}&id=${model.id}"/>" fresh="false" class="btnEdit">编辑</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/view/common/pageBar.jsp"%>
</div>

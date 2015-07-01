<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="cn.hnzxl.exam.project.model.Question"%>
<%@page import="com.github.pagehelper.Page"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<%@ include file="/WEB-INF/view/common/pageForm.jsp"%>
<c:set value="导游信息" var="modeName"></c:set>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="<c:url value="${modelPath}list"/>" method="post">
		<input type="hidden" name="navTabId" value="${searchParam.navTabId}" />
		<div class="searchBar">
			<ul class="searchContent">
				<li style="width: 246px;"><label  style="width: 60px;">姓名：</label> <input type="text" name="S_guideName" value="${searchParam.S_guideName}" /></li>
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
			<li><a title="${modeName}-添加" class="add" href="<c:url value="${modelPath}add?navTabId=${searchParam.navTabId}"/>" rel="${searchParam.navTabId}_add" target="navTab"><span>添加</span></a></li>
			<li><a warn="请至少选择一行进行删除！" title="确实要删除吗？" target="selectedTodo" rel="id" href="<c:url value="${modelPath}delJSON"/>" class="delete"><span>批量删除</span></a></li>
			<li><a title="${modeName}-修改" class="edit" href="<c:url value="${modelPath}edit?navTabId=${searchParam.navTabId}&id="/>{modeId}" rel="${searchParam.navTabId}_edit" target="navTab" fresh="false" warn="请选要编辑的行！" ><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="id" class="checkboxCtrl"></th>
				<th orderField="guide_name" class="${searchParam.sortField=='guide_name'?searchParam.sortOrder:""}">中文名</th>
				<th orderField="guide_en_name" class="${searchParam.sortField=='guide_en_name'?searchParam.sortOrder:""}">英文名</th>
				<th orderField="guide_price" class="${searchParam.sortField=='guide_price'?searchParam.sortOrder:""}">服务价格</th>
				<th orderField="guide_from_place" class="${searchParam.sortField=='guide_from_place'?searchParam.sortOrder:""}">籍贯</th>
				<th orderField="guide_residential" class="${searchParam.sortField=='guide_residential'?searchParam.sortOrder:""}">居住地</th>
				<th orderField="guide_intro" class="${searchParam.sortField=='guide_intro'?searchParam.sortOrder:""}">简介</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageList.list}" var="model" varStatus="eachStatus">
				<tr target="modeId" rel="${model.id}"  >
					<td><input name="id" value="${model.id}" type="checkbox"></td>
					<td>${model.guideName}</td>
					<td>${model.guideEnName}</td>
					<td>${model.guidePrice}</td>
					<td>${model.guideFromPlace}</td>
					<td>${model.guideResidential}</td>
					<td>${model.guideIntro}</td>
					<td>
						<a title="确实要删除吗？" target="ajaxTodo" href="<c:url value="${modelPath}delJSON?id=${model.id}"/>" class="btnDel">删除</a>
						<a title="${modeName}-修改" target="navTab" rel="${searchParam.navTabId}_edit" href="<c:url value="${modelPath}edit?navTabId=${searchParam.navTabId}&id=${model.id}"/>" fresh="false" class="btnEdit">编辑</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/view/common/pageBar.jsp"%>
</div>

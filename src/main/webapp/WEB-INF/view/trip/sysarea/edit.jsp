<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<div class="pageContent">
	<form method="post" action="<c:url value="${modelPath}/saveJSON"/>" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${model.id}"/>
		<input type="hidden" name="METHOD" value="${model.METHOD}"/>
		<input type="hidden" name="navTabId" value="${param.navTabId}"/>
		<div class="pageFormContent" layoutH="56">
			<dl>
				<dt>国家名称：<input name="areaType" type="hidden"  value="2"/></dt>
				<dd><input name="areaName" class="required" type="text" style="width: 240px;" size="35"  value="${model.areaName}" /></dd>
			</dl>
			<dl class="nowrap">
				<dt>国家英文名：</dt>
				<dd><input name="areaEnName" class="required" type="text" style="width: 240px;" size="35"  value="${model.areaEnName}" /></dd>
			</dl>
			<dl class="nowrap">
				<dt>国家描述：</dt>
				<dd><textarea name="areaRemark" class="" style="width: 240px;" rows="4" >${model.areaRemark}</textarea></dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
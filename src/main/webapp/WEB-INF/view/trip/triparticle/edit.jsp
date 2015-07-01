<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<div class="pageContent">
	<form method="post" action="<c:url value="${modelPath}saveJSON"/>" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${model.id}"/>
		<input type="hidden" name="METHOD" value="${model.METHOD}"/>
		<input type="hidden" name="navTabId" value="${param.navTabId}"/>
		<div class="pageFormContent" layoutH="56">
		<dl class="nowrap">
				<dt>照片：</dt>
				<dd>
					<c:if test="${model.METHOD == 'edit'}">
						<img id="article${model.METHOD}Photo" alt="" src="<c:url value="/trip/sysattachment/download?" />businessId=${model.id}&businessModel=${model["class"].name}&businessType=photo" baseScr="<c:url value="/trip/sysattachment/download?id=" />" width="80" height="80"/>
					</c:if>
					<c:if test="${model.METHOD == 'add'}">
						<img id="article${model.METHOD}Photo" alt="" src="" baseScr="<c:url value="/trip/sysattachment/download?id=" />" width="80" height="80"/>
					</c:if>
					<input id="triparticle${model.METHOD}Btn" type="file" name="file" 
							uploaderOption="{
								swf:'<c:url value="resource/js/uploadify/scripts/uploadify.swf"/>',
								uploader:'<c:url value="/trip/sysattachment/upload"/>',
								formData:{multi:false,businessId:'${model.id}',businessModel:'${model["class"].name}',businessType:'photo'},
								buttonText:'选择照片',
								fileSizeLimit:'1MB',
								fileTypeDesc:'*.jpg;*.jpeg;*.gif;*.png;',
								fileTypeExts:'*.jpg;*.jpeg;*.gif;*.png;',
								auto:true,
								multi:false,
								width:60,
								height:20,
								onUploadSuccess:article${model.METHOD}PhotoUploadSuccess,
								onQueueComplete:articlePhotoQueueComplete,
								itemTemplate:true
							}"
						/>
				</dd>
			</dl>
			<dl>
				<dt>文章类别：</dt>
				<dd>
					<select name="articleTypeId">
						<c:forEach items="${type }" var="item">
						<option value="${item.id}" ${item.id==model.articleTypeId?"selected":"" }>${item.articleTypeName}</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>出行天数：</dt>
				<dd><input name="articleDays" class="required digits" type="text" style="width: 240px;" size="35"  value="${model.articleDays}" /></dd>
			</dl>
			<dl>
				<dt>出行时间：</dt>
				<dd><input name="articleStartTime" class="required" type="text" style="width: 240px;" size="35"  value="${model.articleStartTime}" /></dd>
			</dl>
			<dl>
				<dt>导游：</dt>
				<dd><input name="articleGuideId" class="required" type="text" style="width: 240px;" size="35"  value="${model.articleGuideId}" /></dd>
			</dl>
			<dl class="nowrap" style="display: block;">
				<dt>费用：</dt>
				<dd>
					<input name="articleCreateBy" class="required" type="text" style="width: 620px;" size="35"  value="${model.articleLabel}" />
				</dd>
			</dl>
			<dl class="nowrap" style="display: block;">
				<dt>标签：</dt>
				<dd>
					<input name="articleLabel" class="required" type="text" style="width: 620px;" size="35"  value="${model.articleLabel}" />
					（标签之间用空格隔开）
				</dd>
			</dl>
			<dl class="nowrap" style="display: block;">
				<dt>提到过的地方：</dt>
				<dd>
					<input name="articleRemindArea" class="required" type="text" style="width: 620px;" size="35"  value="${model.articleRemindArea}" />
				</dd>
			</dl>
			<dl class="nowrap" style="display: block;">
				<dt>标题：</dt>
				<dd>
					<input name="articleTitle" class="required" type="text" style="width: 620px;" size="35"  value="${model.articleTitle}" />
				</dd>
			</dl>
			
			<dl class="nowrap">
				<dt>内容：</dt>
				<dd style="width: 800px"><textarea name="articleContent" class="editor"  cols="110" rows="18" >${model.articleContent}</textarea></dd>
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
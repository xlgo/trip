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
					<img id="user${model.METHOD}Photo" alt="" src="<c:url value="/trip/sysattachment/download?" />businessId=${model.id}&businessModel=${model["class"].name}&businessType=photo" baseScr="<c:url value="/trip/sysattachment/download?id=" />" width="80" height="80"/>
				</c:if>
				<c:if test="${model.METHOD == 'add'}">
					<img id="user${model.METHOD}Photo" alt="" src="" baseScr="<c:url value="/trip/sysattachment/download?id=" />" width="80" height="80"/>
				</c:if>
				<input id="user${model.METHOD}PhotoBtn" type="file" name="file" 
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
							onUploadSuccess:user${model.METHOD}PhotoUploadSuccess,
							onQueueComplete:userPhotoQueueComplete,
							itemTemplate:true
						}"
					/>
			</dd>
			</dl>
			<dl>
				<dt>导游姓名：</dt>
				<dd><input name="guideName" class="required" type="text" style="width: 240px;" size="35"  value="${model.guideName}" /></dd>
			</dl>
			<dl>
				<dt>导游英文名：</dt>
				<dd><input name="guideEnName" class="required" type="text" style="width: 240px;" size="35"  value="${model.guideEnName}" /></dd>
			</dl>
			<dl>
				<dt>籍贯：</dt>
				<dd><input name="guideFromPlace" class="required" type="text" style="width: 240px;" size="35"  value="${model.guideFromPlace}" /></dd>
			</dl>
			<dl>
				<dt>居住地：</dt>
				<dd><input name="guideResidential" class="required" type="text" style="width: 240px;" size="35"  value="${model.guideResidential}" /></dd>
			</dl>
			<dl class="nowrap">
				<dt>服务国家：</dt>
				<dd>
					<c:forEach var="item" items="${sa2}">
						<label><input type="checkbox" name="guideServiceArea" value="${item.id}" />${item.areaName }</label>
					</c:forEach>
					<script type="text/javascript">
						$(function(){
							$.each("${model.guideServiceArea}".split(","),function(i,o){
								$("[name=guideServiceArea][value="+o+"]").prop("checked",true);
							});
						})
					</script>
				</dd>
			</dl>
			<dl  class="nowrap">
				<dt>服务城市：</dt>
				<dd style="width: 660px;">
					<c:forEach var="item" items="${sa4}">
						<label><input type="checkbox" name="guideCity" value="${item.id}" />${item.areaName }</label>
					</c:forEach>
					<script type="text/javascript">
						$(function(){
							$.each("${model.guideCity}".split(","),function(i,o){
								$("[name=guideCity][value="+o+"]").prop("checked",true);
							});
						})
					</script>
				</dd>
			</dl>
			<dl>
				<dt>服务价格：</dt>
				<dd><input name="guidePrice" class="required number" type="text" style="width: 240px;" size="35"  value="${model.guidePrice}" /></dd>
			</dl>
			<dl class="nowrap" style="display: block;">
				<dt>标签：</dt>
				<dd>
					<input name="guideLable" class="required" type="text" style="width: 620px;" size="35"  value="${model.guideLable}" />
					（标签之间用空格隔开）
				</dd>
			</dl>
			<dl class="nowrap">
				<dt>简介：</dt>
				<dd><textarea name="guideIntro" class="" style="width: 790px;" rows="4" >${model.guideIntro}</textarea></dd>
			</dl>
			<dl class="nowrap">
				<dt>概述：</dt>
				<dd style="width: 800px"><textarea name="guideDetails" class="editor"  cols="110" rows="8" >${model.guideDetails}</textarea></dd>
			</dl>
			<dl class="nowrap">
				<dt>相关照片：</dt>
				<dd style="width: 800px">
					<div><input id="userExtBtn" type="file" name="file" 
						uploaderOption="{
							swf:'<c:url value="resource/js/uploadify/scripts/uploadify.swf"/>',
							uploader:'<c:url value="/trip/sysattachment/upload"/>',
							formData:{multi:true,businessId:'${model.id}',businessModel:'${model["class"].name}',businessType:'photoExt'},
							buttonText:'选择图片',
							fileSizeLimit:'20MB',
							fileTypeDesc:'*.jpg;*.jpeg;*.gif;*.png;',
							fileTypeExts:'*.jpg;*.jpeg;*.gif;*.png;',
							auto:true,
							multi:true,
							width:60,
							height:20,
							onUploadSuccess:userExtUploadSuccess,
							onQueueComplete:userExtQueueComplete
						}"
					/></div>
					<div>
						<ul class="photoExt">
							<li style="display: none;" class="temple"><span class="rem" data-id="">X</span><img title="" baseScr="<c:url value="/trip/sysattachment/download?id=" />" ></li>
							<c:forEach items="${photoExt}" var="item">
								<li><span class="rem" data-id="${item.id}">X</span><img title="${item.attachmentName}" src="<c:url value="/trip/sysattachment/download?id=" />${item.id}" ></li>
							</c:forEach>
							<div style="clear:both;"></div>
						</ul>
						<script type="text/javascript">
							$(function(){
								setTimeout(function(){}, 1000);
								var width = 119;
								var height = 119;
								$(".photoExt .rem").click(function(){
									var $remObj=$(this).parent();
									$.post('<c:url value="/trip/sysattachment/delJSON?id="/>'+$(this).data("id"),function(){
										$remObj.hide(500,function(){
											$(this).remove();
										});
									});
								});
								$(".photoExt img").load(function(){
									var realWidth = this.width ;
									var realHeight = this.height;
									var $this = $(this);
									if(height<=realHeight && width<=realWidth){
										if(realHeight/height <realWidth/width ){
											$this.width(width).height("auto");
										}else{
											$this.width("auto").height(height);
										}
									}else{
										if(width<=realWidth){
											$this.width(width);
										}else{
											$this.width("auto");
										}
										if(height<=realHeight){
											$this.height(height);
										}else{
											$this.height("auto");
										}
									}
									$this.css("marginTop",(height-$this.height())/2);
									$this.css("marginLeft",(width-$this.width())/2);
								}).each(function(){
									if(this.complete){
										$(this).load();
									}
								});
								
							});
						</script>
					</div>
				</dd>
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
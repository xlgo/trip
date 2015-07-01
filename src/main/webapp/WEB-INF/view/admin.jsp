<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<shiro:hasPermission name="sys">
	<jsp:forward page="/index.jsp"></jsp:forward>
</shiro:hasPermission>
<!DOCTYPE HTML >
<html>
<head>
<meta charset="utf-8" />
<title>西葡游 - 管理员首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/dwz/themes/silver/style.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/dwz/themes/css/core.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/uploadify/css/uploadify.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/base.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/main/admin.css"/>" />
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/dwz/themes/css/ieHack.css"/>" />
<![endif]-->
<!--[if lte IE 9]>
<script type="text/javascript" src="<c:url value="/resource/js/dwz/js/speedup.js" />"></script>
<![endif]-->
<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery-1.7.2.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery.cookie.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery.validate.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery.bgiframe.js" />"></script>

<script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor_lang/zh-cn.js" />"></script>

<script type="text/javascript" src="<c:url value="/resource/js/uploadify/scripts/jquery.uploadify.min.js" />"></script>

<script type="text/javascript" src="<c:url value="/resource/js/dwz/js/dwz.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/dwz/js/dwz.regional.zh.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/defin/uploadCallback.js" />"></script>

<script type="text/javascript">
	$(function() {
		DWZ.init("<c:url value='/resource/js/dwz/dwz.frag.xml'/>", {
			loginUrl : "<c:url value='/login' />", // 跳到登录页面
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "pageSize",
				orderField : "sortField",
				orderDirection : "sortOrder"
			},
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({themeBase:"resource/js/dwz/themes"}); 
			}
		});
	});
</script>
</head>

<body>
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="#">西葡游后台管理</a>
				<ul class="nav">
					<li>
						<a target="dialog" width="510" height="200"  mask=true href="<c:url value='/system/user/changepasswordDialog'/>">修改密码</a>
					</li>
					<li><a href="<c:url value='/logout'/>">注销</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div>蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div class="selected">银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>西葡游</h2>
					<div>收缩</div>
				</div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>信息维护
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="<c:url value="/trip/triptourguide/list?navTabId=triptourguide"/>" target="navTab" rel="triptourguide">导游信息管理</a></li>
							<li><a href="<c:url value="/trip/triparticle/list?navTabId=triparticle"/>" target="navTab" rel="triparticle">文章管理</a></li>
						</ul>
					</div>
					
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>字典维护
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="<c:url value="/trip/sysarea/list?navTabId=sysarea2"/>" target="navTab" rel="sysarea2">国家维护</a></li>
							<li><a href="<c:url value="/trip/sysarea/list4?navTabId=sysarea4"/>" target="navTab" rel="sysarea4">城市维护</a></li>
							<li><a href="<c:url value="/trip/triparticletype/list?navTabId=triparticletype"/>" target="navTab" rel="triparticletype">文章类别维护</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<p><h1 style="line-height:70px;font-size:44px;">欢迎使用西葡游后台管理系统</h1><p>
					<p><ul >
						<li style="line-height: 30px;font-size:16px;">1.首选要进行字典的维护</li>
						<li style="line-height: 30px;font-size:16px;">&nbsp;&nbsp;1-1.国家维护</li>
						<li style="line-height: 30px;font-size:16px;">&nbsp;&nbsp;1-2.城市家维护</li>
						<li style="line-height: 30px;font-size:16px;">&nbsp;&nbsp;1-2.文章类别维护</li>
						<li style="line-height: 30px;font-size:16px;">2.接着就可以对数据进行维护了</li>
						<li style="line-height: 30px;font-size:16px;">&nbsp;&nbsp;2-1.录入导游的信息</li>
						<li style="line-height: 30px;font-size:16px;">&nbsp;&nbsp;2-2.录入文章信息</li>
						<li style="line-height: 30px;font-size:16px;">3.回到首页，可以但到结果</li>
					</ul><p>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="footer"><%@ include file="/WEB-INF/view/common/bottom.jsp"%></div>
</body>
</html>

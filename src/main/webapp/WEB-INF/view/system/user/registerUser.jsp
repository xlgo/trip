<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>用户注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/jquery-ui/jquery-ui.min.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resource/js/jquery/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resource/js/jquery-ui/jquery-ui.min.js" />"></script>
<script type="text/javascript">
	function closeWindow() {
		window.open('<c:url value="/"/>', '_parent', '');
		window.close();
	}
	
	$(function(){
		//加载学院信息
		$.get("<c:url value="/resource/data/school.json"/>",function(data){
			var schoolInfo = data.split("\r\n");
			$("#school").autocomplete({
			      source: schoolInfo
		    });
		},"text");
	});
	function checkForm(){
		var username = $("[name=username]").val();
		if(!username){
			alert("用户名不能为空！");
			return false;
		}
		var hasUse=0;
		$.ajax({
			url:"<c:url value="/system/user/hasUse"/>",
			async:false,
			data:{username:username},
			success:function(data){
				if(data==false){
					alert("用户名已经存在！");
					hasUse=1;
				}
			}
		});
		if(hasUse==1){
			return false;
		}
		if(!$("[name=password]").val()){
			alert("密码不能为空！");
			return false;
		}
		if($("[name=password]").val()!=$("[name=password2]").val()){
			alert("两次密码不一致！");
			return false;
		}
		if(!$("[name=name]").val()){
			alert("姓名不能为空！");
			return false;
		}
		
		if(!($("[name=age]").val()>10 && $("[name=age]").val()<100)){
			alert("非法的年龄值！");
			return false;
		}
		if(!($("[name=idnumber]").val().length==18 ||$("[name=idnumber]").val().length==15)){
			alert("请输入正确的身份证号");
			return false;
		}
		
		if(!($("[name=mobilenumber]").val().length==11)){
			alert("请输入正确的手机号");
			return false;
		}
		if(!$("[name=school]").val()){
			alert("所属学校不能为空！");
			return false;
		}
		
		return true;
	}
</script>
<style type="text/css">
.formItem span{
	line-height: 26px;
	text-align: right;
	width: 140px;
	display: block;
	float: left;
}

.ui-autocomplete {
 max-height: 135px;
 overflow-y: auto;
 overflow-x: hidden;
}
</style>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1>欢迎注册</h1>
			<p>请如实填写下面信息，在每期网络知识竞赛后对于获奖者需要进行个人信息核实。信息一经提交，不允许修改！</p>
			<p><a class="btn btn-primary btn-lg" href="<c:url value="/"/>" role="button">返回登录</a></p>
		</div>
	</div>
	<div class="container">
	<form method="post" action="<c:url value="/system/user/saveRegister"/>" onsubmit="return checkForm();">
		<div class="formItem">
			<label><span>用户名：</span> <input style="width:200px;" maxlength="20" class="form-control input-sm" type="text" id="username" name="username"  placeholder="请输入用户名"></label>
		</div>
		<div class="formItem">
			<label>
				<span>密码：</span>
				<input style="width:120px;" class="form-control input-sm" type="password" id="password" name="password"  placeholder="请输入密码">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>确认密码：</span>
				<input style="width:120px;" class="form-control input-sm" type="password" id="password2" name="password2"  placeholder="再次输入密码">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>姓名：</span>
				<input style="width:90px;" maxlength="20" class="form-control input-sm" type="text" id="name" name="name"  placeholder="请输入姓名">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>性别：</span>
				<label style="width: 40px;"><input type="radio" name="gender" value="0" checked="checked" />男 </label>
				<label style="width: 40px;"><input type="radio" name="gender" value="1" />女</label> 
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>年龄：</span>
				<input style="width:85px;" class="form-control input-sm" type="text" id="age" name="age"  placeholder="请输入年龄">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>身份证号：</span>
				<input style="width:170px;" class="form-control input-sm" type="text" id="idnumber" name="idnumber"  placeholder="请输入身份证号">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>手机号：</span>
				<input style="width:120px;" class="form-control input-sm" type="text" id="mobilenumber" name="mobilenumber"  placeholder="请输入手机号">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>所属学校：</span>
				<input style="width:210px;" maxlength="50" class="form-control input-sm" type="text" id="school" name="school"  placeholder="请输入所属学校">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>所在班级：</span>
				<input style="width:120px;" maxlength="50" class="form-control input-sm" type="text" id="classname" name="classname"  placeholder="请输入所在班级">
			</label>
		</div>
		<div class="formItem">
			<label>
				<span>地区：</span>
				<input style="width:150px;" maxlength="100" class="form-control input-sm" type="text" id="area" name="area"  placeholder="请输入地区">
			</label>
		</div>
		<div class="formItem" style="display: none;">
			<label>
				<span>找回密码问题：</span>
				<input style="width:200px;" maxlength="200"  class="form-control input-sm" type="text" id="verifyquestion" name="verifyquestion"  placeholder="请输入问题">
			</label>
		</div>
		<div class="formItem" style="display: none;">
			<label>
				<span>找回密码答案：</span>
				<input style="width:200px;" maxlength="20" class="form-control input-sm" type="text" id="verifyanswer" name="verifyanswer" placeholder="请输入答案">
			</label>
		</div>
		<div style="text-align: center;margin:20px 0px;">
			<button type="submit" class="btn btn-success">提交</button>
			<button type="reset" class="btn">清空</button>
		</div>
	</form>
	</div>
</body>
</html>
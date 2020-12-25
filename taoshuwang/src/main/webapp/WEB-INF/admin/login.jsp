<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--静态导入--%>
<%@include file="/common.jsp"%>

<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>后台 - 登录</title>
<style>
.loginscreen.middle-box {
	padding-top: 260px;
}
</style>
</head>

<body background="/mby/img/demo-1-bg.jpg">
	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h2 style="color: white">淘书网</h2>
			</div>
			<h3 style="color: red">${message}</h3>
			<form id="form" method="post" class="m-t" role="form"
				  action="/mby/login"
				  onsubmit="return login()">
				<input type="hidden" name="role" value="1" />
				<div class="form-group">
					<input type="text" value="${user.username}" autofocus name="username" id="username"
						class="form-control" placeholder="用户名">

				</div>

				<div class="form-group">
					<input type="password"  value="${user.password}" name="password" id="password"
						class="form-control" placeholder="密码">
				</div>
				<div class="form-group">
					<label style="position: absolute;left:236px">
						<img id="img" type="image" src="/mby/code" onclick="javascript:$(this).prop('src','/mby/code?time='+new Date())"
								style="cursor:pointer;"/></label>
					<input type="text" name="authCode"
						   class="form-control" id="authCode"
						   style="width:230px" placeholder="验证码">
				</div>
				<input type="submit" class="btn btn-primary block full-width m-b"
				value="登 录"/>
			</form>

		</div>
	</div>
	<script type="text/javascript">
        // 登录
        function login(){
            var username = $("#username").val();
            var password = $("#password").val();
            var authCode = $("#authCode").val();
            if(username == ""){
                alert("用户名不能为空");
                return false;
            }
            if(password == ""){
                alert("密码不能为空");
                return false;
            }
            if(authCode == ""){
                alert("验证码不能为空");
                return false;
            }
        }
	</script>

</body>
</html>
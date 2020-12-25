<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common.jsp"%>
<html>

<head>
<meta charset="utf-8">
	<%--时钟--%>
	<script>
        $(document).ready(function(){
            $(function(){
                $("#clock").MyDigitClock();
            });
        });
	</script>
</head>

<body>
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">

				<jsp:include page="header.jsp" flush="true" />

				<li><a href="javascript:void(0)"> <i
						class="fa fa fa-volume-up"></i> <span class="nav-label">文章管理</span>
						<span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="/mby/articleList">文章列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"> <i
						class="fa fa fa-qrcode"></i> <span class="nav-label">标签管理</span> <span
						class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="toTags">标签列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"> <i
						class="fa fa fa-qrcode"></i> <span class="nav-label">链接管理</span>
						<span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/partner/list">链接列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"> <i
						class="fa fa fa-qrcode"></i> <span class="nav-label">用户管理</span>
						<span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/list">用户列表</a></li>
					</ul></li>
			</ul>

		</div>
		</nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
				<ul class="nav navbar-top-links navbar-right">
					<li style="padding-right: 10px;">
						当前时间：<span id="clock"></span>
					</li>
					<li><span class="m-r-sm text-muted welcome-message"><a
							href="javascript:void(0)"><i class="fa fa-home"></i></a>欢迎来到淘书网后台管理</span>
					</li>
					<li><a href="loginOut"> <i class="fa fa-sign-out"></i>
							退出
					</a></li>
				</ul>

				</nav>
			</div>
			<h2 style="font-size: 45px;position:fixed;font-weight:bold;margin: 220px 180px">欢迎光临Andy的淘书网后台管理</h2>

		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
<script src="/mby/js/heart.js"></script>
</html>
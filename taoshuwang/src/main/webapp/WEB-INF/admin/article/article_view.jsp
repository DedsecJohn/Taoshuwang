<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common.jsp"%>
<html>

<head>
<meta charset="utf-8">


</head>

<body>

	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">

				<jsp:include page="../header.jsp" flush="true"></jsp:include>

				<li class="active"><a href="javascript:void(0)"><i
						class="fa fa fa-volume-up"></i> <span class="nav-label">文章管理</span>
						<span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li class="active"><a href="/">文章列表</a>
						</li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
						<span class="nav-label">标签管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/tag/list">标签列表</a></li>
					</ul></li>
					<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
						<span class="nav-label">链接管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/friend/list">链接列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
						<span class="nav-label">用户管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/list">用户列表</a></li>
					</ul></li>
			</ul>

		</div>
		</nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>文章列表</h2>
					<ol class="breadcrumb">
						<li><a href="admin/home">主页</a></li>
						<li><a>文章管理</a></li>
						<li><a href="/">文章列表</a></li>
						<li><strong>文章预览</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-content">
								<form method="post" action="saveUpdate" class="form-horizontal">
									<input type="hidden" id="img" name="img" />
									<div class="form-group">
										<label class="col-sm-2 control-label">栏目:</label>
										<div style="margin-top: 7px" class="col-sm-4">
											${article.tname}
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label">标题:</label>
										<label style="margin-top: 7px">${article.title}</label>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group">
										<label class="col-sm-2 control-label">内容:</label>
										<div class="col-sm-10">
											<label>${article.content}</label>
										</div>
									</div>
									<div class="hr-line-dashed"></div>

									<div class="form-group">
										<div class="col-sm-4 col-sm-offset-2">
											<button class="btn btn-success" type="button"
												onclick="javascript:history.go(-1)">返回</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	</div>


	<!-- Mainly scripts -->
	<script src="/blog/js/bootstrap.min.js"></script>
	<script src="/blog/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="/blog/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/blog/js/hplus.js"></script>
	<script src="/blog/js/plugins/pace/pace.min.js"></script>
	<script src="/blog/js/validation.js"></script>
	<script src="/blog/js/article/article_edit.js"></script>
	<script type="text/javascript"
		src="/blog/js/flavr/flavr/js/flavr.min.js"></script>
	<script type="text/javascript" src="/blog/js/flavr/base.js"></script>
	<script type="text/javascript"
		src="/blog/js/zTree_v3/js/jquery.ztree.all-3.5.js"></script>
	<script
		src="/blog/js/plugins/datapicker/bootstrap-datepicker.js"></script>
</body>

</html>

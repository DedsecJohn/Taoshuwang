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
						<li><strong>发布文章</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-content">
								<form method="post" action="/blog/addOrUpdateArticle" class="form-horizontal">
									<input type="hidden" id="img" name="img" />
									<input type="hidden" name="aid" value="${article.aid}" />
									<div class="form-group">
										<label class="col-sm-2 control-label">栏目:</label>
										<div class="col-sm-4">
											<select id="tags" class="form-control m-b" name="tag_id">
												<option value="-1">请选中标签</option>
											</select>
											<script>
                                                $.ajax({
                                                    url : '/blog/queryTags',
                                                    type : 'post',
                                                    dataType : 'json',
                                                    success : function (data) {

                                                        for(var i = 0 ; i < data.length; i++){
                                                            $('#tags').append("<option value="+data[i].tid+">"+data[i].tname+"</option>");
                                                        }
                                                        var tid = '${tid}';
                                                        $('#tags option').each(function () {
                                                            if($(this).val() == tid){
                                                                $(this).prop('selected',true);
                                                            }
                                                        });
                                                    }
                                                });
											</script>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label">标题:</label>
										<div class="col-sm-10">
											<input type="text" name="title" class="form-control"
												placeholder="请输入标题" value="${article.title}">
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group">
										<label class="col-sm-2 control-label">内容:</label>
										<div class="col-sm-10">
											<textarea id="editor_id" name="content"
													  style="width:800px;height:400px;">
												${article.content}
											</textarea>
										</div>
									</div>
									<div class="hr-line-dashed"></div>

									<div class="form-group">
										<div class="col-sm-4 col-sm-offset-2">
											<input class="btn btn-primary" type="submit"
												value="保存内容" />
											<button class="btn btn-white" type="button"
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
	<script src="/blog/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="/blog/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/blog/js/hplus.js"></script>
	<script src="/blog/js/plugins/pace/pace.min.js"></script>
	<script src="/blog/js/validation.js"></script>
	<script src="/blog/js/article/article_edit.js"></script>
	<script type="text/javascript"
		src="/blog/js/flavr/flavr/js/flavr.min.js"></script>
	<script type="text/javascript" src="/blogjs/flavr/base.js"></script>
	<script type="text/javascript"
		src="/blog/js/zTree_v3/js/jquery.ztree.all-3.5.js"></script>
	<script
		src="/blog/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<%--kingEditor--%>
	<script src="/blog/js/kindeditor-4.1.11-zh-CN/kindeditor-all.js"></script>
	<script src="/blog/js/kindeditor-4.1.11-zh-CN/lang/zh-CN.js"></script>
<%--	<link rel="stylesheet" href="js/kindeditor-4.1.11-zh-CN/themes/example1/example1.css" />--%>
	<script>
		//uploadJson:请求后台服务器地址
		//filePostName:上传文件名称
		//imgFile: 文件form名称
		//dir:上传文件类型
		//afterUpload:上传文件成功后的回调函数
       KindEditor.ready(function(K) {
            K.create('#editor_id', {
                uploadJson : '/blog/fileUpload',
                filePostName : 'img',
                afterUpload : function (data) {
                    //使用隐藏域保存图片的地址
					$('#img').val(data);
                }
            });

        });


        //测试是否选中"请选中标签"
		$('#tags').change(function () {
			if($(this).val() == -1){
			    alert("请选中具体栏目！");
			    return;
			}
        });
        /*//查询所有标签
        $.ajax({
            url : 'getTags',
            type : 'post',
            dataType : 'json',
            success : function (data) {
                console.log(data);
                var content = "<option value=\"-1\">请选择标签</option>";
                for(var i = 0; i < data.length; i++){
                    content += "<option value="+data[i].tid+">"+data[i].tname+"</option>"
                }
                $("#tags").html(content);
            }
        });*/
	</script>
</body>

</html>

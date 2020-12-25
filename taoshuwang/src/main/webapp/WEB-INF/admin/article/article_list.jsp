<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common.jsp"%>

<!doctype html>
<head>
	<meta charset="utf-8">
	<style>
		.table th, .table td {
			text-align: center;
			vertical-align: middle!important;
		}
	</style>
	<script src="/js/blog.js"></script>
</head>

<body>
<div id="wrapper">
	<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">

				<jsp:include page="../header.jsp" flush="true"></jsp:include>

				<li class="active"><a href="javascript:void(0)"><i
						class="fa fa fa-qrcode"></i> <span class="nav-label">文章管理</span> <span
						class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li class="active"><a href="articleList">文章列表</a>
						</li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
					<span class="nav-label">标签管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="javascript:void(0)">标签列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
					<span class="nav-label">链接管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="javascript:void(0)">链接列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
					<span class="nav-label">用户管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="javascript:void(0)">用户列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
					<span class="nav-label">栏目管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/category/list">栏目列表</a></li>
					</ul></li>
			</ul>

		</div>
	</nav>

	<div id="page-wrapper" class="gray-bg dashbard-1">
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>文章列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0)">主页</a></li>
					<li><a href="articleList">文章管理</a></li>
					<li><strong>文章列表</strong></li>
				</ol>
			</div>
			<div class="col-lg-2"></div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight" style="width: 100%">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins" >
						<div class="ibox-content">
							<div class="row">
								<div class="col-sm-12">
									<form id="form" class="form-inline" action="/blog/articleList" method="post">
										<div class="form-group">
											<label>标签</label>
											<select id="tags" name="tid"
													class="form-control">
												<option value=-1>请选择</option>
												<%--<c:forEach items="${tags}" var="tag">
													<option value="${tag.tid}">${tag.tname}</option>
												</c:forEach>--%>
											</select>
										</div>
										<script>
											$.ajax({
												url : '/mby/queryTags',
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
											//选择一个种类，查询该种类下所有的文章
											$('#tags').change(function () {
											    //表单序列化
											    var formData = $('#form').serialize();
                                                location.href = "/mby/articleList?"+formData;
                                            });
										</script>
										<div class="form-group">
											<label>标题</label>
											<input type="text" value="${articleVo.title}" id="title" name="title" class="form-control"  placeholder="请输入标题">
										</div>
										<div class="form-group">
											<label>发布时间</label>
											<input type="text"
												   name="start" class="form-control start"  placeholder="开始时间"
													value="<fmt:formatDate value='${articleVo.start}' pattern='yyyy-MM-dd' />"
											/>
											<input type="text"
												   value="<fmt:formatDate value='${articleVo.end}' pattern='yyyy-MM-dd' />"
												   name="end" class="form-control end"  placeholder="截至时间" />
										</div>
										<script>
                                            laydate.render({
                                                elem: '.start', //指定元素
                                            });
                                            laydate.render({
                                                elem: '.end', //指定元素
                                            });
										</script>
										<button style="margin-top: 5px" <%--onclick="sub()"--%> type="submit" class="btn btn-primary">查询</button>
										<a style="margin-top: 5px" href="/mby/toAddArticle" type="button" class="btn btn-success"
										>新增文章</a>
										<button style="margin-top: 5px" id="del" onclick="deleteBatch($(this))" type="button" class="btn btn-danger alert-api-button alert-btn3"
										>批量删除</button>
									</form>
									<script>
										function sub() {
                                            var content = $("#form").serialize();
                                            content = decodeURIComponent(content ,true);
                                            location.href = "/articleList?" + content;
                                        }
									</script>
								</div>
							</div><br />

							<!-- 表格数据 -->
							<div>
								<table  class="table table-bordered table-hover">
									<tr>
										<th>
											<input id="father" value="-1" class="father" type="checkbox" >
										</th>
										<th>编号</th>
										<th>标签</th>
										<th>标题</th>
										<th>发布时间</th>
										<th>更新时间</th>
										<th>操作</th>
									</tr>
								<c:forEach items="${articles}"  var="article">
									<tr>
										<td>
											<input type="checkbox" value="${article.aid}" class="son" />
										</td>
										<td>${article.aid}</td>
										<td>${article.tname}</td>
										<td>${article.title}</td>
										<td>${article.create_time}</td>
										<td>${article.update_time}</td>
										<td>
											<button onclick="query($(this),${article.aid})" class="btn btn-primary alert-api-button alert-btn3">查看</button>
                                            <button onclick="deleteBatch($(this))" class="btn btn-danger alert-api-button alert-btn3">删除</button>
                                            <button onclick="edit($(this),${article.aid})" class="btn btn-success alert-api-button alert-btn3">修改</button>
										</td>
									</tr>
								</c:forEach>
								</table>
							</div>
							${pages}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</div>

</body>

<script>
	//全选和全不选
	//prop:固有属性 attr:自定义属性
	$('#father').click(function () {
	    //father是否勾中决定son是否勾中
		$('.son').each(function () {
			$(this).prop('checked',$('#father').prop('checked'));
        });
    });

	//根据son勾中的个数决定father是否勾中
	//思路:只要判断勾中的son长度和所有son的长度是否一样即可
	$('.son').each(function () {
		$(this).click(function () {
			var length = $('.son').length;
			var selectedLength = $('.son:checked').length;
			if(length == selectedLength){
			    $('#father').prop('checked',true);
			}else {
                $('#father').prop('checked',false);
			}
        });
    });
	
	
	//查看js弹窗
    function query(btn,aid) {
        if($('.son:checked').length > 1){
            btn.val("只能操作一条记录！");
        }else if($('.son:checked').length == 0){
            btn.val("未选中记录！");
        }else{
            //向后台发送请求查询当前文章信息
			location.href = "/mby/queryById/"+aid+"/article_view";
		}
    }


    //编辑
   function edit(obj,aid) {
        if($('.son:checked').length > 1){
            obj.val("只能操作一条记录！");
        }else if($('.son:checked').length == 0){
            obj.val("未选中记录！");
        }else{
            //根据id查询文章
           location.href = "/mby/queryById/"+aid + "/article_edit";
        }
    }

    //批量删除
	function deleteBatch(btn) {
       //单删和批删都没有勾中记录
        if(('.son:checked').length == 0){
            btn.val("没有选中记录");
            return;
        }

        if(btn.attr('id') == 'del'){
            //点击批删按钮
            btn.val = "确认要删除选中的"
                + $('.son:checked').length + "条记录吗？" ;

        }else {
            if($('.son:checked').length > 1){
                //点击单删按钮，选中记录数>1
                btn.val("只能操作一条记录");
                return;
            }else{
                //点击单删按钮，选中记录数==1
                btn.val = "确认要删除选中1条记录吗？" ;
            }
        }

        //将选中的记录的主键放入到数组中   56,57
        var aids = [];
        $('.son:checked').each(function () {
            aids.push($(this).val());
        });
        //join():将数组中的内容以,号拼接成字符串,也可以指定其他字符
        location.href = "/mby/deleteBatch?aids="+aids.join();
    }


</script>


</html>

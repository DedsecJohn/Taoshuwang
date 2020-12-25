<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/mby/xiu/style.css" type="text/css" />
	<link rel="stylesheet" media="screen" href="/mby/css/style2.css">
	<link rel="stylesheet" type="text/css" href="/mby/css/reset.css"/>
	<style>
		a:hover{
			text-decoration: underline;
		}
	</style>
</head>

<body id="contain" class="home blog ui-c3">
	<div style="position: absolute;font-size:15px;right: 150px;top:15px;z-index: 100">
		<a href="#" data-toggle="modal" data-target="#myModal">登录</a>
		<a href="#"  style="color: blue">注册</a>
	</div>
	<section class="container">
	<header class="header">
	<div class="logo_right">
		<span class="glyphicon glyphicon-search degfy_search"></span>
	</div>
	<div class="logo_left"></div>
	<ul class="nav" id="ul">
		<li
			class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-61">
			<a href=""> <span class="glyphicon glyphicon-home"></span>首页
		</a>
		</li>

		<script>
            $.ajax({
                url : '/mby/queryTags',
                type : 'post',
                dataType : 'json',
                success : function (data) {

                    for(var i = 0 ; i < data.length; i++){
                        $('#ul').append("<li><a href='/mby?tid="+data[i].tid+"'>"+data[i].tag_icon+data[i].tname+"</a></li>");
                    }

                }
            });
            
		</script>

	</ul>
	<div class="widget_head"></div>
	</header>
	<div class="content-wrap">
		<div class="content" id="content">
			<h3 class="title">
				<strong>最新发布文章</strong>
			</h3>
			<input type="hidden" id="categoryId" value="-1" />
			<c:choose>
				<c:when test="${type == 1}">
					<jsp:include page="/mby/tag_articles.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="/mby/hot_articles.jsp" />
				</c:otherwise>
			</c:choose>
		</div>
		 
	</div>
	<aside class="sidebar">
		<div style="padding-top: 30px" class="widget widget_searchbox affix-top" style="top: 0px;">
			<form class="form-inline">
				<div class="form-group">
					<input style="width: 136px;height: 20px" type="text" class="form-control"
						   placeholder="请输入标签名称">
				</div>
				<button style="margin-top: 5px;margin-left:-1px;width: 48px"
						type="submit" class="btn btn-success">搜索</button>
			</form>
		</div>
		<div class="widget widget_tags">
			<h3 class="title">
				<strong>热门文章</strong>
			</h3>
			<ul style="padding: 10px 10px">
				<c:forEach items="${hotArticles}" var="article">
					<li style="list-style: square;color: lightgrey">
						<a style="font-size:15px;color: #6D5887;
						font-family:Verdana 宋体" href="#">
								${article.title}
						</a>
						<hr style="margin-top:2px;border-style:dashed" />
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="widget widget_text">
			<h3 class="title">
				<strong>友情链接</strong>
			</h3>
			<div class="textwidget">
				<ul class="widget_tags_inner">
					<c:forEach items="${friendList}" var="friend">
						<li><a href="http://${friend.siteUrl}" target="_blank"
						class="fr_link">${friend.siteName}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</aside> 
	<jsp:include page="pager.jsp" flush="true"></jsp:include>
	</section>
</body>

<jsp:include page="login.jsp" />
</html>
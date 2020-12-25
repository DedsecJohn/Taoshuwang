<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/blog/xiu/style.css" type="text/css" />
<link rel="stylesheet" media="screen" href="/blog/css/style2.css">
<link rel="stylesheet" type="text/css" href="/blog/css/reset.css"/>
<script src="/blog/js/jquery-2.1.1.min.js"></script>

<c:forEach items="${latestArticles}" var="article">
	<article class="excerpt excerpt-one" style="color: grey;">
		<header>
			<a  class="cat label label-important"
				href="category/${article.tname}"
				data-original-title="" title="">${article.tname} <i
				class="label-arrow"></i>
			</a>
			<h2>
				<a href="#"
					title="${article.tname}">${article.title}</a>
			</h2>
		</header>

		<p class="text-muted time">作者：${article.username}&nbsp;&nbsp;&nbsp;&nbsp;
			发布于
				${article.create_time}
		</p>

		<p class="text-muted time" style="margin-top: 10px">
				${fn:substring(article.content,0 ,20)}...
		</p>
		<p class="text-muted views" style="margin-top: 10px">
			<span class="post-views">阅读：</span> <span
				class="post-tags">点赞：
			</span>
		</p>

		<p class="focus" style="position: relative;bottom:25px">
			<a href="">
					<c:choose>
						<c:when test="${article.img != ''}">
							<img style="width: 200px;height:150px"
								  src="${article.img}"
								 style="display: inline;">
						</c:when>
						<c:otherwise>
							<img style="width: 200px;height:150px"
									 src="/mby/img/p6.jpg"
								 style="display: inline;">
						</c:otherwise>
					</c:choose>
				</span>
			</span>
			</a>
		</p>
	</article>
</c:forEach>


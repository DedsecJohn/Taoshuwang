<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.img-circle {
	width: 64px;
}
</style>
<li class="nav-header">
	<div class="dropdown profile-element">
		<span> <img alt="image" class="img-circle"
			src="/blog/img/admin.png" />
		</span> <a data-toggle="dropdown" class="dropdown-toggle"
			href="javascript:void(0)"> <span class="clear"> <span
				class="block m-t-xs"> <strong class="font-bold">${loginUser.username}</strong>
			</span> <span class="text-muted text-xs block"> ${loginUser.username} <b
					class="caret"></b></span>
		</span>
		</a>
		<ul class="dropdown-menu animated fadeInRight m-t-xs">
			<li><a href="/blog/loginOut">安全退出</a></li>
		</ul>
	</div>
</li>
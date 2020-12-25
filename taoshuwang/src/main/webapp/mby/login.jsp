<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--登录页面--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h1 class="modal-title" style="font-size: 15px">登录</h1>
            </div>
            <div class="modal-body">
                <form>
                <div class="form-group" style="width: 530px">
                    <label>用户名</label>
                    <input autofocus type="email" class="form-control"
                           placeholder="请输入用户名">
                </div>
                <div class="form-group" style="width: 530px">
                    <label >密码</label>
                    <input type="password" class="form-control"
                           placeholder="请输入密码">
                </div>
                <div class="form-group" >
                    <input type="submit"
                            style="width: 525px;"
                            class="btn btn-lg btn-success"
                            data-dismiss="modal" value="登录">
                </div>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
</html>

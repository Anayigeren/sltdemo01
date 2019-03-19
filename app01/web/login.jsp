<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="center-block" style="width:500px;margin-top: 100px;">
        <div class="panel panel-primary">
            <div class="panel-heading" style="font-size: 18px;">
                <i class="glyphicon glyphicon-user"></i>
                <span>用户登录</span>
            </div>
            <div class="panel-body" style="margin: 10px;">
                <form action="${pageContext.request.getContextPath()}/loginServlet" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="verifycode">验证码</label>
                        <input type="text" class="form-control" style="width: 45%;display: inline-block;" id="verifycode" name="verifycode" placeholder="请输入验证码">
                        <a href="javascript:refreshCode()">
                            <img id="imgCheckCode" src="${pageContext.request.getContextPath()}/checkcode" title="看不清点击刷新" alt="看不清点击刷新" />
                        </a>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 记住密码
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary" id="btn_login">登录</button>
                    <button type="button" class="btn btn-default">注册</button>
                </form>

                <!-- 出错显示的信息框 -->
                <c:if test="${not empty login_msg}">
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" >
                            <span>&times;</span>
                        </button>
                        <strong>${login_msg}</strong>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    function refreshCode(){
        var img = document.getElementById('imgCheckCode');
        img.src = "${pageContext.request.getContextPath()}/checkcode?" + new Date().getTime();
    }
</script>
</html>

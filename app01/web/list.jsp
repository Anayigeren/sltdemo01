<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.Demos.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    table{
        text-align: center;
    }
    .mainContainer{
        width: 1000px;
        margin:35px auto;
    }
</style>
<head>
    <title>List</title>
</head>
<body>
<%
    List list = new ArrayList<User>();
    request.setAttribute("users", list);
%>
<div class="mainContainer">
    <div class="page-header">
        <h1><small>${user.name}，欢迎您！</small></h1>
    </div>
    <form class="form-inline">
        <div class="form-group">
            <label for="txtName">姓名：</label>
            <input type="text" class="form-control" id="txtName" placeholder="模糊查询">
        </div>
        <div class="form-group">
            <label for="txtPhone">邮箱：</label>
            <input type="email" class="form-control" id="txtPhone" placeholder="">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
        <div style="float: right;">
            <button type="button" class="btn btn-primary">添加联系人</button>
            <button type="button" class="btn btn-primary">删除选中</button>
        </div>

    </form>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover ">
            <thead>
            <tr>
                <td>编号</td>
                <td>姓名</td>
                <td>年龄</td>
                <td>性别</td>
                <td>手机</td>
                <td>邮箱</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <c:forEach items="${pb.list}" var="v" varStatus="o">
                <c:if test="${v.age>15}">
                    <tr>
                        <td>${o.index}</td>
                        <td>${v.name}</td>
                        <td>${v.age}</td>
                        <td>${v.sex}</td>
                        <td>${v.phone}</td>
                        <td>${v.email}</td>
                        <td>
                            <button type="button" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-pencil"></i> 编辑</button>
                            <button type="button" class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i> 删除</button>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
    <div class="">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size:20px;margin-left: 10px;">共150条记录，显示1-6记录</span>
            </ul>
        </nav>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage == 1}">
                <li class="disabled">
                </c:if>

                <c:if test="${pb.currentPage != 1}">
                <li>
                </c:if>

                <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </li>

                <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>

                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>

            </ul>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>

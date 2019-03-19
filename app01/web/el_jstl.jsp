<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.Demos.domain.Person" %>
<%@ page import="cn.Demos.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style type="text/css">
 table{
     border: 1px solid #c3c3c3;
     width: 500px;
 }table tr{
     height: 35px;
   }
  table tr td{
      border: 0px;
  }
    table thead{
        background: antiquewhite;
        text-align: center;
        font-weight: bold;
        font-family: "Microsoft YaHei UI", serif;
    }
    .ouRow{
        background: #94D8F6;
    }
    .jiRow{
        background: #98E0AD;
    }
</style>
<head>
    <title>List</title>
    <% request.setAttribute("number", 2);%>

    <%--c:if--%>
    <c:if test="${number % 2 == 0}">
        number为偶数<br>
    </c:if>
    <c:if test="${number % 2 == 1}">
        number为奇数<br>
    </c:if>
    <c:if test="${not empty number}">
        number不为空且长度>0<br>
    </c:if>

    <%--c:choose--%>
    <c:choose>
        <c:when test="${number == 1}">number为1<br></c:when>
        <c:when test="${number == 2}">number为2<br></c:when>
        <c:otherwise>number既不是1也不是2<br></c:otherwise>
    </c:choose>

    <%--c:forEach--%>
    <%
        List list = new ArrayList<User>();
        list.add(new User("张三", 15, "女", "15657574501", "12@aa.com"));
        list.add(new User("李四", 21, "男", "13945125120", "4512012@qq.com"));
        list.add(new User("王五", 23, "男", "15657574103", "12@aa.com"));
        list.add(new User("赵六", 18, "男", "13845122450", "12@aa.com"));
        list.add(new User("田七", 12, "女", "15845120563", "12@aa.com"));
        request.setAttribute("personlist", list);
    %>
    <c:forEach var="v" begin="0" end="10" step="2" varStatus="o">
        索引变量值(v)：${o.index} ；执行次数：${o.count}<br>
    </c:forEach>

    <table>
        <thead>
            <tr>
                <td>姓名</td>
                <td>年龄</td>
                <td>性别</td>
                <td>联系手机</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
        <c:forEach items="${personlist}" var="v" varStatus="o">
            <c:if test="${v.age>15}">
                <tr class="${o.index % 2 == 0 ? "ouRow" : "jiRow"}">
                    <td>${v.name}</td>
                    <td>${v.age}</td>
                    <td>${v.sex}</td>
                    <td>${v.phone}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</head>
<body>
</body>
</html>

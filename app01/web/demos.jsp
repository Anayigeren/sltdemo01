<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: lzb
  Date: 2019/3/5
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <table style="border: 1px solid #c3c3c3">
    <tbody>
    <%
      for (int i = 1; i < 10; i++) {
    %>
    <tr style="height: 35px;text-align:center;">
      <%
        for (int j = 1; j < 10; j++) {
      %>
        <td style="width: 120px;">
          <%=i + "*" + j + "=" + j*i%>
        </td>
      <%
        }
      %>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <div>
    <a href="/Demos_war_exploded/ImageServlet?filename=PPT.png">下载图片</a>
  </div>
  <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>
  <%
    response.getWriter().write("HHHHHH");
    out.write("asd");
  %>
  </body>
</html>

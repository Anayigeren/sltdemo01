package com.gitdemo.web.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/ImageServlet")
public class FileDownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("demo03 doGet...");
        // 获取请求文件名称
        String filename = req.getParameter("filename");
        // 获取Servletcontext对象
        ServletContext context = req.getServletContext();
        // 设置相应头（告知客户端浏览器文件的MIME类型）
        resp.setHeader("content-type", context.getMimeType(filename));

        //-------------------解决下载文件中文名称乱码问题----------------
        filename = URLEncoder.encode(filename, "utf-8");
        //------------------------------------------------------------

        // 设置相应头（告知客户端浏览器以附件的形式下载文件，指定下载文件的名称）
        resp.setHeader("content-disposition", "attachment;filename=下载" + filename);
        // 找到服务器文件路径
        String realPath = context.getRealPath("/images/" + filename);
        // 使用文件输出流将文件载入内存
        FileInputStream fileInputStream = new FileInputStream(realPath);
        // 将输入流的数据写到输出流中
        ServletOutputStream outputStream = resp.getOutputStream();
        byte[] buff = new byte[1024 * 2];
        int len = 0;
        while ((len = fileInputStream.read(buff)) != -1){
            outputStream.write(buff, 0, len);
        }
        fileInputStream.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("demo03 doPost...");
    }
}

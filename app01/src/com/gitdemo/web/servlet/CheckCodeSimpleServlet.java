package com.gitdemo.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkcodedemo")
public class CheckCodeSimpleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int width = 120;
        int height = 40;
        // 1.创建一个对象用来在内存中存放验证码图片
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 2.获取图片二维图形工具
        Graphics gp =  image.getGraphics();
        // 3.填充背景
        gp.setColor(Color.PINK); // 设置画笔颜色
        gp.fillRect(0,0, width, height); // 填充一个矩形

        // 4.画边框
        gp.setColor(Color.BLUE); // 设置画笔颜色
        gp.drawRect(0,0,width-1,height-1); // 画一个矩形边框
        image.getGraphics();

        // 5.写验证码
        String codeStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random dr = new Random();
        for (int i = 1; i < 5; i++) {
            int index = dr.nextInt(codeStr.length());
            char ch = codeStr.charAt(index);
            gp.drawString(ch + "", (width*i)/5 ,height/2);
        }

        // 6.添加干扰线
        for (int i = 0; i < 4; i++) {
            gp.setColor(Color.GREEN); // 设置画笔颜色
            gp.drawLine(dr.nextInt(width), dr.nextInt(height), dr.nextInt(width), dr.nextInt(height));
        }
        // 将图片输出客户端展示
        ImageIO.write(image, "png", resp.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}


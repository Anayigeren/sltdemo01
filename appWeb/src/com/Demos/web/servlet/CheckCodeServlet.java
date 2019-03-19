package com.Demos.web.servlet;

import com.Demos.Util.CodeUtil;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

@WebServlet("/checkcode")
public class CheckCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取验证码Map
        Map<String,Object> map = CodeUtil.generateCodeAndPic();
        // 将验证码存入session
        HttpSession session = req.getSession();
        String code = (String) map.get("code");
        session.setAttribute("CHECKCODE_SERVER", code);
        // 将图片输出客户端展示
        ImageIO.write((RenderedImage) map.get("codePic"), "png", resp.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}


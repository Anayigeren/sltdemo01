package com.gitdemo.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(value = "/*")
public class FormSubmitFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        // 修改bug
        System.out.println("===========拦截请求-主干分支===========");
        String username = (String) req.getParameter("username");
        if (username == null) {
            System.out.println("被拦截：跳转到login页面！");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            //放行
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }
}

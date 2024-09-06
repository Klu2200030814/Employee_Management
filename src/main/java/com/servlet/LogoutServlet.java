package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("index.html");
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies
        response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains"); // Enforce HTTPS
        response.setHeader("X-Content-Type-Options", "nosniff"); // Prevent MIME type sniffing
        response.setHeader("X-Frame-Options", "DENY"); // Prevent framing
        response.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self'");
    }
}

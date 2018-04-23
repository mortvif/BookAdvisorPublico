package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.User;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Remove cookie
		Cookie c = new Cookie("bookadvisorUser", "");
		resp.addCookie(c);
		
		req.getSession().setAttribute("user", null);
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
		
		
	}
	
	
}

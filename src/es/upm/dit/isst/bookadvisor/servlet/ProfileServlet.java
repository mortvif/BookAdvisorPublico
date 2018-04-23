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

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Get Cookies
		User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
					req.getSession().setAttribute("user", u);
					resp.sendRedirect(req.getContextPath() + "/profile.jsp");
					break;
				}
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/index.jsp");
			System.out.println("No hay usuario logueado");
		}
		

		
	}
	
	
}

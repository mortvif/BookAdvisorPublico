package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET login");
		
		// Get input parameters
		String user = req.getParameter("username");
		String password = req.getParameter("password");
		
		System.out.println("	Username:" + user);
		System.out.println("	Password:" + password);
		
		if(user != null && password != null && user.length() > 0) {
			User login = UserDaoImplementation.getInstance().loginUser(user, password);
			if(login != null) {
				// Prepare cookie and send cookie
//				Date date = new Date();
//				DateFormat df = new SimpleDateFormat("ddMMyyyyHHmmss");
				String cookieUser = login.getUsername();			//+df.format(date);
				System.out.println("	Cookie:" +cookieUser);
				login.setCookie(cookieUser);
				
				UserDaoImplementation.getInstance().updateUser(login);
	
				Cookie c = new Cookie("bookadvisorUser", cookieUser);
				// Set cookie expiring time to 5 minutes
				c.setMaxAge(60*5);
				
				resp.addCookie(c);
				
				req.getSession().setAttribute("user", login);
				resp.sendRedirect(req.getContextPath()+"/index.jsp");
				
			} else {

				req.getSession().setAttribute("error", "No existe un usuario con ese usuario y contrasena");
				resp.sendRedirect(req.getContextPath()+"/error.jsp");

			}
		} else {
			
			req.getSession().setAttribute("error", "Los campos pasados no son correctos");
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}
}

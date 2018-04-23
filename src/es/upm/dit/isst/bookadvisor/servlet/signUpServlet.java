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
import es.upm.dit.isst.bookadvisor.dao.model.UserType;

@WebServlet("/signup")
public class signUpServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET signup");
		// Get input parameters
				String username = req.getParameter("username");
				String password = req.getParameter("password");
				String address = req.getParameter("address");
				String role = req.getParameter("role");
				String mail = req.getParameter("email");

				
				System.out.println("	Username:" + username);
				System.out.println("	Password:" + password);
				System.out.println("	Email:" + mail);
				System.out.println("	Role:" + role);
				System.out.println("	Address:" + address);

				if(username != null && password != null && address != null && role != null && mail != null) {
					User userDoesExit = UserDaoImplementation.getInstance().getUser(username);
					
					if(userDoesExit == null) {
						// Usuario no existe. Creamos usuario
						
						// Parseamos rol
						UserType type = null;						
						if(role.equals("lector")) {
							type = UserType.READER;
						} else if (role.equals("editorial")) {
							type = UserType.PUBLISHER;
						} else {
							type = UserType.READER;	
						}
												
						User newuser = new User();
						newuser.setAddress(address);
						newuser.setMail(mail);
						newuser.setPassword(password);
						newuser.setUsername(username);
						newuser.setRole(type);
						
						System.out.println(newuser.getRole());
						
						UserDaoImplementation.getInstance().createUser(newuser);
						
						resp.sendRedirect(req.getContextPath()+"/index.jsp");

					} else {
						
						req.getSession().setAttribute("error", "Ya existe un usuario con ese nombre de usuario");
						resp.sendRedirect(req.getContextPath()+"/error.jsp");
					
					}
					
				} else {
					
					req.getSession().setAttribute("error", "Los campos pasados no son correctos");
					resp.sendRedirect(req.getContextPath()+"/error.jsp");
				}
				
	}
	
}

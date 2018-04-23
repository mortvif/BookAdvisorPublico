package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.BookDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.User;

@WebServlet("/index")
public class IndexServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET index");
		
		// Get Cookies
		User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
				}
			}
			
			if(u == null ) {
				// No hay usuario logeado
				System.out.println("No hay usuario logueado");
			} else {
				// Hay usuario logueado 
				System.out.println("Username logueado: " +u.getUsername());
			}
				
		} else {
			// No hay usuario logeado
			System.out.println("No hay usuario logueado");
		}
		
		List<Book> newbooks = BookDaoImplementation.getInstance().readNewBooks(5);
		
		req.getSession().setAttribute("books", newbooks);
		req.getSession().setAttribute("user", u);
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
	}
	
}
	
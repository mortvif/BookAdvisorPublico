package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.BookDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.ExchangeDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;
import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;

@SuppressWarnings("serial")
@WebServlet("/ExchangeServlet")
public class ExchangeServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String description = req.getParameter("exchange");
		
		// Get Cookies
		User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
				}
			}
			
			if(u == null) {
				// No hay usuario logeado
				resp.sendRedirect(req.getContextPath() + "/index.jsp");
			} else {
				if(u.getRole() == UserType.READER) {
					
					Book b = BookDaoImplementation.getInstance().readBook(req.getParameter("isbn"));
					
					if(description.length() > 0) {
						
						Exchange e = new Exchange();
						e.setId(u.getUsername()+(new Date()));
						e.setDescription(description);
						e.setCreatedAt(new Date());
						e.setBookRequested(b);
						e.setRequester(u);
						
						ExchangeDaoImplementation.getInstance().createExchange(e);
						
						System.out.println("Intercambio creado: "+e.getId()+"\n");
						
					}
										
					resp.sendRedirect(req.getContextPath() + "/ProfileServlet");
					
				} else {
					
					req.getSession().setAttribute("user", u);
					resp.sendRedirect(req.getContextPath() + "/index.jsp");
				
				}
			}
				
		} else {
			// No hay usuario logeado
			resp.sendRedirect(req.getContextPath() + "/index.jsp");
		}
		
	}
	
}

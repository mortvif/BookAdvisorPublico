package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.ExchangeDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;
import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;

@SuppressWarnings("serial")
@WebServlet("/AcceptExchangeServlet")
public class AcceptExchangeServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("exchange_id");
		
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
					
					Exchange e = ExchangeDaoImplementation.getInstance().getExchange(id);
					if(e != null) {
						e.setAccepter(u);
						ExchangeDaoImplementation.getInstance().updateExchange(e);						
					}
					
					resp.sendRedirect(req.getContextPath() + "/ProfileServlet");
					
				} else {
					resp.sendRedirect(req.getContextPath() + "/index");
				}
			}
				
		} else {
			// No hay usuario logeado
			resp.sendRedirect(req.getContextPath() + "/index");
		}
		
	}
	
}

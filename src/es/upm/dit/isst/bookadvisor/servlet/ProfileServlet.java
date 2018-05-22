package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.ExchangeDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.ReviewDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;
import es.upm.dit.isst.bookadvisor.dao.model.Review;
import es.upm.dit.isst.bookadvisor.dao.model.User;

@SuppressWarnings("serial")
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
					
					List <Exchange> user_exchanges = ExchangeDaoImplementation.getInstance().getUserExchanges(u);
					req.getSession().setAttribute("user_exchanges", user_exchanges);
					
					List <Review> user_reviews = ReviewDaoImplementation.getInstance().getUserReviews(u);
					req.getSession().setAttribute("user_reviews", user_reviews);

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

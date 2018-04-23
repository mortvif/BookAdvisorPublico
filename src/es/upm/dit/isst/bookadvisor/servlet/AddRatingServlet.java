package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.BookDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.ReviewDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.Review;
import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;

@WebServlet("/AddRatingServlet")
public class AddRatingServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ratingstring = req.getParameter("rating");
		int rating = Integer.parseInt(ratingstring);
		String comment = req.getParameter("comment");
		
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
					if(comment.length() > 0) {
						Review r = new Review();
						r.setAuthor(u);
						r.setCreatedAt(new Date());
						r.setBookReviewed(b);
						r.setId(u.getUsername()+(new Date()));
						r.setReview(comment);
						ReviewDaoImplementation.getInstance().createReview(r);
					}
					
					b.addRating(rating);
					BookDaoImplementation.getInstance().updateBook(b);
					
					req.getSession().setAttribute("book", BookDaoImplementation.getInstance().readBook(req.getParameter("isbn")));
					resp.sendRedirect(req.getContextPath() + "/bookdetails.jsp");
					
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

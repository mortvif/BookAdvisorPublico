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

@WebServlet("/BasicSearchServlet")
public class BasicSearchServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
			
				}
			}
		}	
		
		String input = req.getParameter("search");
		
		List<Book> results;
		if(input.length() == 0) {
			results = BookDaoImplementation.getInstance().readAllBooks();
		} else {
			results = BookDaoImplementation.getInstance().readBooksBasicSearch(input);
		}

		if(results != null && results.size() > 0) {
			req.getSession().setAttribute("booklist", results);
			req.getSession().setAttribute("user", u);
			resp.sendRedirect(req.getContextPath() + "/searchresults.jsp");
		} else {
			req.getSession().setAttribute("user", u);
			resp.sendRedirect(req.getContextPath() + "/notfound.jsp");
		}
		
	}
	
}

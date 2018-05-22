package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.ReviewDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Review;

@WebServlet("/DeleteComment")
public class DeleteComment extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("reviewid");
		
		Review r = ReviewDaoImplementation.getInstance().getReview(id);
		ReviewDaoImplementation.getInstance().deleteReview(r);
		
		resp.sendRedirect(req.getContextPath() + "/ProfileServlet");
		
	}
	
}

package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.ExchangeDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;

@WebServlet("/DeleteExchange")
public class DeleteExchange extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("exchangeid");
		
		Exchange e = ExchangeDaoImplementation.getInstance().getExchange(id);
		ExchangeDaoImplementation.getInstance().deleteExchange(e);
		
		resp.sendRedirect(req.getContextPath() + "/ProfileServlet");
	}

}

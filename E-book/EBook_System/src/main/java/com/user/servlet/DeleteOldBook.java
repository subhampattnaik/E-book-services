package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.conn.ConnectionProvider;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String em = request.getParameter("em");
			BookDAOImpl dao = new BookDAOImpl(ConnectionProvider.getConnection());
			boolean f = dao.oldBookDelete(em, "Old");
			
			HttpSession session = request.getSession();
			
			if (f) {
				session.setAttribute("succMsg", "Old Book Deleted Sucessfully..");
				response.sendRedirect("old_books.jsp");
			} else {
				session.setAttribute("errMsg", "Something Went Wrong on Server..");
				response.sendRedirect("old_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}

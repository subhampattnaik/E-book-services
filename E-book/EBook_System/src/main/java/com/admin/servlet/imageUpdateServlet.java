package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.conn.ConnectionProvider;
import com.entity.bookDtls;

@WebServlet("/imageUpdateServlet")
@MultipartConfig
public class imageUpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("bookId"));
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			
			bookDtls b=new bookDtls();
			b.setId(id);
			b.setBookImg(fileName);
			
			
			BookDAOImpl dao=new BookDAOImpl(ConnectionProvider.getConnection());
			boolean f=dao.editImageUpdate(b);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucessMsg","Books Update Sucessfully");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("errorMsg","Something Went Wrong on Server");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
			String uploadPath = getServletContext().getRealPath("") + "book";
			File uploadDir = new File(uploadPath);
			part.write(uploadPath + File.separator + fileName);
		System.out.println(uploadPath);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import org.hibernate.Transaction;
import java.util.Date;
import com.entities.Note;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UpdateServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
    public UpdateServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			Note note = s.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			response.sendRedirect("all_notes.jsp");
			
			tx.commit();
			s.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}

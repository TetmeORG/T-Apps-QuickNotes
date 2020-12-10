package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.factoryProvider.factoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			
			//Hibernate : save
			
			Session s = factoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			s.save(note);
			
			tx.commit();
			s.close();
			
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println("<h1 style = 'text-align:center'> Note Added Successfully </h1>");
			out.println("<h1 style = 'text-align:center'> <a href = 'all_notes.jsp'> View All Notes </a> </h1>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

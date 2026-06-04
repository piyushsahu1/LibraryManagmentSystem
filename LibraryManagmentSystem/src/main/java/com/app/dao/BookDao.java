package com.app.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.app.App;
import com.app.entitiy.Book;
import com.app.entitiy.IssueBook;

@Repository
public class BookDao {

	public void saveBook(Book book) {
		Session session = App.getSessionFactory().openSession();
		session.beginTransaction();
		session.persist(book);
		session.getTransaction().commit();
		session.close();
	}

	public List<Book> getAllBooks() {
		// TODO Auto-generated method stub
		Session s = App.getSessionFactory().openSession();
		List<Book> list = s.createQuery("from Book",Book.class).list();
		s.close();
		return list;
		
	}
	
	public void deleteBook(int id) {
		Session s = App.getSessionFactory().openSession();
		s.beginTransaction();
		Book b = s.get(Book.class, id);
		if (b != null) {
			s.remove(b);
		}
		s.getTransaction().commit();
		s.close();
		
	}
	
	public Book getBook(int id) {
		Session s = App.getSessionFactory().openSession();
		Book b = s.get(Book.class, id);
		s.close();
		return b;
	}
	
	public void updateBook(Book book) {
		
		Session s = App.getSessionFactory().openSession();
		s.beginTransaction();
		s.merge(book);
		s.getTransaction();
		s.getTransaction().commit();
		s.close();

	}
	
	public List<Book> searchBook(String title){
		Session s = App.getSessionFactory().openSession();
		List<Book> list =s.createQuery("from Book where title like :t",Book.class).setParameter("t","%"+title+"%").list();
		s.close();
		return list;
	}
	
	public void issuebook(IssueBook issue) {
		Session s = App.getSessionFactory().openSession();
		s.beginTransaction();
		s.persist(issue);
		s.getTransaction().commit();
		s.close();
	}

	public List<IssueBook> getAllIssuedBooks() {
		Session s = App.getSessionFactory().openSession();
		List<IssueBook> list = s.createQuery("from IssueBook", IssueBook.class).list();
		s.close();
		return list;
	}

	public IssueBook getIssuedBook(int issueid) {
		Session s = App.getSessionFactory().openSession();
		IssueBook issue = s.get(IssueBook.class, issueid);
		s.close();
		return issue;
	}

	public void deleteIssuedBook(int issueid) {
		Session s = App.getSessionFactory().openSession();
		s.beginTransaction();
		IssueBook issue = s.get(IssueBook.class, issueid);
		if (issue != null) {
			s.remove(issue);
		}
		s.getTransaction().commit();
		s.close();
	}
	
	
	
}

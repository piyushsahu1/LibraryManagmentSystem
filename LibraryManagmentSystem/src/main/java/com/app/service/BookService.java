
package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.BookDao;
import com.app.entitiy.Book;
import com.app.entitiy.IssueBook;

@Service
public class BookService {

	@Autowired
	private BookDao d;
	
	public void addBook(Book book) {
		d.saveBook(book);
	}
	
	  public List<Book> getAllBooks() {
	        return d.getAllBooks();
	  }
	  
	  public void deleteBook(int id) {
		    d.deleteBook(id);
		}
	  
	  public Book getBookById(int id) {
		  return d.getBook(id);
	  }
	  
	  public void updateBook(Book book) {
		  d.updateBook(book);
	  }
	  
	  public List<Book> searchBook(String title){
		  return d.searchBook(title);
	  }
	  
	  public void issuebook(IssueBook issue) {
		  d.issuebook(issue);
	  }

	  public List<IssueBook> getAllIssuedBooks() {
		  return d.getAllIssuedBooks();
	  }

	  public IssueBook getIssuedBookById(int issueid) {
		  return d.getIssuedBook(issueid);
	  }

	  public void deleteIssuedBook(int issueid) {
		  d.deleteIssuedBook(issueid);
	  }
}


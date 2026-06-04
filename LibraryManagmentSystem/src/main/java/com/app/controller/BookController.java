package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.entitiy.Book;
import com.app.entitiy.IssueBook;
import com.app.service.BookService;

@Controller
public class BookController {

	@Autowired
    private BookService service;

	@GetMapping("/addBook")public String ShowAddBookPage() {
		return "addBook";
	}
	
	@GetMapping("/viewBook")public ModelAndView viewBook() {
		
		List<Book> list = service.getAllBooks();
		ModelAndView mv = new ModelAndView();
		 mv.setViewName("viewBook");
	     mv.addObject("book", list);
	     return mv;
	}

	@PostMapping("/saveBook")public String saveBook(
	        @RequestParam("title") String title,
	        @RequestParam("author") String author,
	        @RequestParam("price") int price,
	        @RequestParam("quantity") int quantity) {
			Book b = new Book();
	    b.setTitle(title);
	    b.setAuthor(author);
	    b.setPrice(price);
	    b.setQuantity(quantity);
	    service.addBook(b);
	    return "redirect:/viewBook";
	}
	
	@GetMapping("/deleteBook")public String deleteBook(@RequestParam("id") int id) {
		service.deleteBook(id);
		return "redirect:/viewBook";
	}
	
	@GetMapping("/editBook")public ModelAndView editBook(@RequestParam("id")int id) {
		Book b = service.getBookById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editBook");
		mv.addObject("book",b);
		return mv;
		
	}
	
	@PostMapping("/updateBook")public String updateBook(@RequestParam("id") int id,
	@RequestParam("title") String title,
	@RequestParam("author") String author,
	@RequestParam("price") int price,
	 @RequestParam("quantity") int quantity) {
		Book b = new Book();
		b.setId(id);
		b.setTitle(title);
		b.setAuthor(author);
		b.setPrice(price);
		b.setQuantity(quantity);
		
		service.updateBook(b);
		return "redirect:/viewBook";
		
	}
	
	@GetMapping("/searchBook")public String searchBook(){
		return "searchBook";
	}
	
	@PostMapping("/searchBook")public ModelAndView searchBook(@RequestParam("title")String title) {
		List<Book> list =service.searchBook(title);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewBook");
		mv.addObject("book",list);
		return mv;
	}
	
	@GetMapping("/issueBook")
	public String issuepage() {
		return "issueBook";
	}
	
	@PostMapping("/issueBook")
	public String issuebook(@RequestParam("studentName") String studentName,@RequestParam("bookid") int bookid) {
		
		Book b = service.getBookById(bookid);
		if(b != null && b.getQuantity()>0) {
			
			IssueBook issue = new IssueBook();
			issue.setStudentName(studentName);
			issue.setBookid(bookid);
			issue.setIssuedate(new java.sql.Date(System.currentTimeMillis()));
			service.issuebook(issue);
	        b.setQuantity(b.getQuantity() - 1);
	        service.updateBook(b);
	    }
		return "redirect:/viewBook";
			
	}

	@GetMapping("/returnBook")
	public ModelAndView returnBookPage() {
		List<IssueBook> list = service.getAllIssuedBooks();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("returnBook");
		mv.addObject("issue", list);
		return mv;
	}

	@PostMapping("/returnBook")
	public String returnBook(@RequestParam("issueid") int issueid) {
		IssueBook issue = service.getIssuedBookById(issueid);
		if (issue != null) {
			Book b = service.getBookById(issue.getBookid());
			if (b != null) {
				b.setQuantity(b.getQuantity() + 1);
				service.updateBook(b);
			}
			service.deleteIssuedBook(issueid);
		}
		return "redirect:/viewBook";
	}
	
}

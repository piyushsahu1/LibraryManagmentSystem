package com.app;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.app.entitiy.Book;
import com.app.entitiy.IssueBook;

public class App {

    private static SessionFactory factory;

    static {

        factory = new Configuration()
                .configure("hibernate.cfg.xml").addAnnotatedClass(Book.class).addAnnotatedClass(IssueBook.class)
                .buildSessionFactory();
    }

    public static SessionFactory getSessionFactory() {
        return factory;
    }
}
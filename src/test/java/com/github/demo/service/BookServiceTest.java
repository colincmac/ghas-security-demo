package com.github.demo.service;

import com.github.demo.model.Book;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Unit test for BookService
 */
public class BookServiceTest {

    // Testing API token key
    private static final String API_TOKEN = "AIzaSyAQfxPJiounkhOjODEO5ZieffeBv6yft2Q";
    
    private BookService bookService;

    @Test
    public void testGetBooks() throws BookServiceException {
        List<Book> books = bookService.getBooks();
        assertEquals("list length should be 6", 6, books.size());
    }

    @Test
    public void testSearchBooksNormalQuery() throws BookServiceException {
        // Test normal search functionality
        List<Book> books = bookService.searchBooks("Pragmatic");
        assertEquals("Should find 1 book with 'Pragmatic' in title", 1, books.size());
        assertEquals("The Pragmatic Programmer: From Journeyman to Master", books.get(0).getTitle());
    }

    @Test
    public void testSearchBooksEmptyResult() throws BookServiceException {
        // Test search with no results
        List<Book> books = bookService.searchBooks("NonexistentBook");
        assertEquals("Should find 0 books for nonexistent title", 0, books.size());
    }

    @Test
    public void testSearchBooksWithSQLInjectionAttempt() throws BookServiceException {
        // Test that SQL injection attempts are safely handled
        // This should not break the query or return unexpected results
        String sqlInjectionAttempt = "'; DROP TABLE books; --";
        List<Book> books = bookService.searchBooks(sqlInjectionAttempt);
        
        // The query should safely return 0 results instead of causing an error
        assertEquals("SQL injection attempt should return 0 results", 0, books.size());
        
        // Verify the books table still exists by running a normal query
        List<Book> allBooks = bookService.getBooks();
        assertEquals("Books table should still exist and contain 6 books", 6, allBooks.size());
    }

    @Before
    public void setUp() throws Exception{
        bookService = new BookService();
    }

    @After
    public void tearDown() {
        bookService = null;
    }

}

package com.moressette.bookmanage.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moressette.bookmanage.dao.BookDao;
import com.moressette.bookmanage.dao.impl.BookDaoimpl;
import com.moressette.bookmanage.entity.Book;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String isbn = (String)request.getParameter("isbn");
		String bookname = (String)request.getParameter("bookname");
		String author = (String)request.getParameter("author");
		String press = (String)request.getParameter("press");
		double price = Double.parseDouble(request.getParameter("price"));
		Book book = new Book();
		book.setIsbn(isbn);
		book.setBookname(bookname);
		book.setAuthor(author);
		book.setPress(press);
		book.setPrice(price);
		BookDao bookdao = new BookDaoimpl();
		boolean flag = bookdao.addBooks(book);
		if (flag == true) {
			out.print("<script>alert('图书添加成功');window.location.href=('AdminServlet');</script>");
		} else {
			out.print("<script>alert('该ISBN已存在');window.location.href=('AdminServlet');</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

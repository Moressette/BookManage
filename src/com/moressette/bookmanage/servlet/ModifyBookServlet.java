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
 * Servlet implementation class ModifyBookServlet
 */
@WebServlet("/ModifyBookServlet")
public class ModifyBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		BookDao bookdao = new BookDaoimpl();
		Book book = new Book();
		book = bookdao.findByID(id);
		request.getSession().setAttribute("book", book);
		request.getSession().setAttribute("bid", id);
		out.print("<script>window.location.href=('modifybook.jsp');</script>");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		BookDao bookdao = new BookDaoimpl();
		String isbn = (String)request.getParameter("isbn");
		String bookname = (String)request.getParameter("bookname");
		String author = (String)request.getParameter("author");
		String press = (String)request.getParameter("press");
		double price = Double.valueOf((String)request.getParameter("price"));
		Book book = new Book();
		int bid = Integer.parseInt(request.getSession().getAttribute("bid").toString());
		book.setId(bid);
		book.setIsbn(isbn);
		book.setBookname(bookname);
		book.setAuthor(author);
		book.setPress(press);
		book.setPrice(price);
		boolean flag = bookdao.modifyBook(book);
		if (flag) {
			out.print("<script>alert('图书修改成功');window.location.href=('AdminServlet');</script>");
		} else {
			out.print("<script>alert('图书修改失败');window.location.href=('AdminServlet');</script>");
		}
	}

}

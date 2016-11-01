package com.moressette.bookmanage.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moressette.bookmanage.dao.BookDao;
import com.moressette.bookmanage.dao.impl.BookDaoimpl;
import com.moressette.bookmanage.entity.Book;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		
		if(request.getSession().getAttribute("username") == null){
			out.println("<script type='text/javascript'>alert('您还没有登录，请先登录');window.location.href='login.jsp'; </script>");
		}
		
		BookDao bookdao = new BookDaoimpl();
		List<Book> booklist = bookdao.findAllBook();
		request.getSession().setAttribute("booklist", booklist);
		out.print("<script>window.location.href=('admin.jsp');</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

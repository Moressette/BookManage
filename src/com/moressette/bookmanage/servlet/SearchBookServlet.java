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
 * Servlet implementation class SearchBookServlet
 */
@WebServlet("/SearchBookServlet")
public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		
		String searchInfo = request.getParameter("search");
		request.getSession().setAttribute("searchInfo", searchInfo);
		System.out.println(searchInfo);
		boolean isISBN = true;
		if(searchInfo.length() != 13){
			isISBN = false;
		}else{
			for(int i=0;i<searchInfo.length();i++){
				int chr = searchInfo.charAt(i);
				if(chr<48 || chr>57){
					isISBN = false;
					break;
				}
			}
		}
		if(isISBN == true){
			BookDao bookdao = new BookDaoimpl();
			Book book = new Book();
			book = bookdao.findByISBN(searchInfo);		
			if(book != null){
				request.getSession().setAttribute("book", book);
				out.print("<script>window.location.href=('search.jsp');</script>");
			}else{
				out.print("<script>alert('该ISBN的图书未找到');window.history.go(-1);</script>");
			}
		}else{
			BookDao bookdao = new BookDaoimpl();
			List<Book>searchList = bookdao.findByBookname(searchInfo);
			if(!searchList.isEmpty()){
				request.getSession().setAttribute("searchList", searchList);
				out.print("<script>window.location.href=('search_bookname.jsp');</script>");
			}else{
				out.print("<script>alert('该图书名未找到');window.history.go(-1);</script>");
			}
		}
	}

}

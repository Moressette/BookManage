package com.moressette.bookmanage.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moressette.bookmanage.dao.UserDao;
import com.moressette.bookmanage.dao.impl.UserDaoimpl;
import com.moressette.bookmanage.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String username = (String)request.getParameter("username");
		String pwd = (String)request.getParameter("pwd");
		User user = new User(username,pwd);
		UserDao userdao = new UserDaoimpl();
		User u = userdao.login(user);
		if(u == null){
			out.println("<script>alert('用户名或密码错误');window.location.href=('login.jsp');</script>");
		}else{
			out.println("<script>alert('管理员登录成功');window.location.href=('AdminServlet');</script>");
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("pwd", pwd);
		}
	}

}

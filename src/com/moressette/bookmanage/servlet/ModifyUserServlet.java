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
 * Servlet implementation class ModifyUserServlet
 */
@WebServlet("/ModifyUserServlet")
public class ModifyUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyUserServlet() {
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
		
		UserDao userdao = new UserDaoimpl();
		User user = userdao.findUsers();
		out.print("<script>window.location.href=('modifyuser.jsp');</script>");	
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
		
		UserDao userdao = new UserDaoimpl();
		String username = (String)request.getParameter("username");
		String pwd = (String)request.getParameter("password");
		System.out.println("username="+username+"password="+pwd);
		boolean flag = userdao.modifyUser(username, pwd);
		if(flag){
			request.getSession().invalidate();
			out.print("<script>alert('用户信息修改成功，请重新登录');window.location.href=('login.jsp');</script>");	
		}else{
			out.print("<script>alert('用户信息修改失败');window.location.href=('AdminServlet');</script>");	
		}
	}

}

package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/removecartitem")
public class Removecartitem extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int Iid=Integer.parseInt(req.getParameter("Iid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f=dao.removeitem(Iid,uid);
		HttpSession session =req.getSession();
		
		if(f){
			
			session.setAttribute("succMsg", "Item Removed From Cart");
			resp.sendRedirect("checkout.jsp");
		}else
		{
			session.setAttribute("failedMsg", "Something Wrong on Server");
			resp.sendRedirect("checkout.jsp");
		}
	}
	
	

}

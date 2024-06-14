package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ItemDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class DeleteItem extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   try {
		   int id=Integer.parseInt(req.getParameter("id"));
		   
		   ItemDAOImpl dao= new ItemDAOImpl(DBConnect.getConn());
		   
		   boolean f= dao.deleteitems(id);
		   
		   HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Item Delete Successfully..");
				resp.sendRedirect("admin/allaccessories.jsp");
			} else
			{
				session.setAttribute("failedMsg", "Something Wrong on Server");
				resp.sendRedirect("admin/allaccessories.jsp");
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

	
}

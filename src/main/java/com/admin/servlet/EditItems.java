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
import com.entity.Itemdetails;

@WebServlet("/edit-items")
public class EditItems extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String itemName = req.getParameter("iname");
			String Price = req.getParameter("price");
			String Status = req.getParameter("istatus");
			
			Itemdetails i =new Itemdetails();
			i.setItemId(id);
			i.setItemName(itemName);
			i.setPrice(Price);
			i.setStatus(Status);
			
			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditItems(i);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Item Update Successfully..");
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

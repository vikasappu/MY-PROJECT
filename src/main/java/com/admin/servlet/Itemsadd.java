 package com.admin.servlet;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ItemDAOImpl;
import com.DB.DBConnect;
import com.entity.Itemdetails;




@WebServlet("/addaccessories")
@MultipartConfig
public class Itemsadd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String itemName = req.getParameter("iname");
			String Price = req.getParameter("price");
			String Categories = req.getParameter("cat");
			String Status = req.getParameter("istatus");
			Part part = req.getPart("image");
			String fileName=part.getSubmittedFileName();
			
			Itemdetails i =new Itemdetails(itemName,Price,Categories,Status,fileName,"admin");
			
			ItemDAOImpl dao=new ItemDAOImpl(DBConnect.getConn());
			
			
			
			boolean f=dao.additem(i);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				String path=getServletContext().getRealPath("")+"Item-Images";
			    
				File file = new File (path);
				
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Item Added Successfully");
				resp.sendRedirect("admin/addaccessories.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something Wrong on Server");
				resp.sendRedirect("admin/addaccessories.jsp");
			}
			
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

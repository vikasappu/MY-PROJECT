package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/updateprofile")
public class Updateprofile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 try {
		    int id= Integer.parseInt(req.getParameter("id"));
		    String name =req.getParameter("fname");
			String email =req.getParameter("email");
			String phno =req.getParameter("phno");
		    String password =req.getParameter("password");
		    
		    
		    User us = new User();
		    us.setId(id);
		    us.setName(name);
		    us.setEmail(email);
		    us.setPhno(phno);
		
		     
		    HttpSession  session= req.getSession();
		    UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
		    
		    boolean f =dao.checkpassword(id, password);
		    
		    if(f)
		    {
		    	boolean f2= dao.updateprofile(us);
		    	if(f2)
		    	{
		    		session.setAttribute("succMsg","Profile Updated Successfully");
			    	resp.sendRedirect("editprofile.jsp");
		    	}
		    	else
		    	{
		    		session.setAttribute("failedMsg","Something Wrong on Server");
			    	resp.sendRedirect("editprofile.jsp");
		    	}
		    }
		    else
		    {
		    	session.setAttribute("failedMsg","Password is Incorrect");
		    	resp.sendRedirect("editprofile.jsp");
		    }
		    
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	

}

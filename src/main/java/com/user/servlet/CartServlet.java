package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ItemDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Itemdetails;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	/**
	 *
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int Iid= Integer.parseInt(req.getParameter("Iid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			
			ItemDAOImpl dao = new  ItemDAOImpl(DBConnect.getConn());
			Itemdetails i=dao.getitembyId(Iid);
			
			Cart c= new Cart();
			c.setIid(Iid);
			c.setUid(uid);
			c.setItemname(i.getItemName());
			c.setPrice(Double.parseDouble(i.getPrice()));
			c.setTotalprice(Double.parseDouble(i.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg","Item Added to Cart");
				resp.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("failedMsg","Something Wrong on Server ");
				resp.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}

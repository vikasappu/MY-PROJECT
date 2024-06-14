package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ItemorderImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Itemorder;
@WebServlet("/order")
public class Orderitem extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("firstname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phoneno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
			CartDAOImpl dao = new  CartDAOImpl(DBConnect.getConn());
			
			List<Cart>ilist=dao.getItemByUser(id);
			
			if(ilist.isEmpty()) {
				session.setAttribute("failedMsg","Add Item");
				resp.sendRedirect("checkout.jsp");
				
			}
			else
			{
				ItemorderImpl dao2=new ItemorderImpl(DBConnect.getConn());
				
				Itemorder o = null;
				
				ArrayList<Itemorder> orderlist= new ArrayList<Itemorder>();
				Random r =new Random();
				for(Cart c: ilist)
				{
					o=new Itemorder();
					o.setOrderid("ITEM-ORD-00" + r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setFullAdd(fullAdd);
					o.setPhno(phno);
					o.setItemname(c.getItemname());
					o.setPrice(c.getPrice()+ "");
					o.setPaymentType(paymentType);
					orderlist.add(o);
					
				}
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg","Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}
				else
				{
					boolean f=dao2.saveOrder(orderlist);
					
					if (f) 
					{
						resp.sendRedirect("itemordersuccess.jsp");
					}
					else
					{
						session.setAttribute("failedMsg","Your Order Failed");
						resp.sendRedirect("itemordersuccess.jsp");
					}
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}

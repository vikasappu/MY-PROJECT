package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Itemorder;

public class ItemorderImpl  implements ItemorderDAO{
	
	private Connection conn;

	

	public ItemorderImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean saveOrder(List<Itemorder> ilist) {
		boolean f=false;
		try {
			String sql = "insert into itemorder(orderid,username,email,address,phno,itemname,price,payment) values(?,?,?,?,?,?,?,?)";
		    conn.setAutoCommit(false);
		    PreparedStatement ps = conn.prepareStatement(sql);
		    
		    for(Itemorder i:ilist)
		    {
		    	ps.setString(1, i.getOrderid());
		    	ps.setString(2, i.getUserName());
		    	ps.setString(3, i.getEmail());
		    	ps.setString(4, i.getFullAdd());
		    	ps.setString(5, i.getPhno());
		    	ps.setString(6, i.getItemname());
		    	ps.setString(7, i.getPrice());
		    	ps.setString(8, i.getPaymentType());
		    	ps.addBatch();
		    }
		
		 int [] count =ps.executeBatch();
		 conn.commit();
		 f=true;
		 conn.setAutoCommit(true);
		    
		} catch (Exception e) {
			
		}
		return f;
	}


	public List<Itemorder> getItem(String email) {
		
		List<Itemorder> list= new ArrayList<Itemorder>();
		Itemorder o= null;
		try {
			
			String sql = "select * from itemorder where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				o=new Itemorder();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setItemname(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				list.add(o);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public List<Itemorder> getAllOrder() {
		
		List<Itemorder> list= new ArrayList<Itemorder>();
		Itemorder o= null;
		try {
			
			String sql = "select * from itemorder ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				o=new Itemorder();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setItemname(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				list.add(o);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	
	}

	



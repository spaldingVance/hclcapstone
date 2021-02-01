package com.hcl.capstone.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.hcl.capstone.model.*;
@Entity
@Table(name="order_db")
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	private String bAddress;
	private String sAddress;
	private Double orderPrice;
	private int orderQuantity;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	@Temporal(TemporalType.DATE)
	private Date shppingDate;
	
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	private User user;


	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getbAddress() {
		return bAddress;
	}


	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}


	public String getsAddress() {
		return sAddress;
	}


	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}


	public Double getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(Double orderPrice) {
		this.orderPrice = orderPrice;
	}


	public int getOrderQuantity() {
		return orderQuantity;
	}


	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}


	public Date getShppingDate() {
		return shppingDate;
	}


	public void setShppingDate(Date shppingDate) {
		this.shppingDate = shppingDate;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "Order [id=" + id + ", bAddress=" + bAddress + ", sAddress=" + sAddress + ", orderPrice=" + orderPrice
				+ ", orderQuantity=" + orderQuantity + ", shppingDate=" + shppingDate + "]";
	}


	
	
	
	
}

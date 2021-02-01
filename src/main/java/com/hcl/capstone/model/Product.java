package com.hcl.capstone.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="product_db")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@Column(name="photo_url")
	private String photoUrl;
	@Column(name="product_name")
	private String productName;
	@Column(name="product_category")
	private String productCategory;
	@Column(name="product_condition")
	private String productCondition;
	@Column(name="product_price")
	private double productPrice;
	

	
	
	
	public Product(String photoUrl, String productName, String productCategory, String productCondition, double productPrice) {
		super();
		this.photoUrl = photoUrl;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productCondition = productCondition;
		this.productPrice = productPrice;
	}
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductCondition() {
		return productCondition;
	}

	public void setProductCondition(String productCondition) {
		this.productCondition = productCondition;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", photoUrl=" + photoUrl + ", productName=" + productName + ", productCategory="
				+ productCategory + ", productCondition=" + productCondition + ", productPrice=" + productPrice + "]";
	}
	
	
	
	
}

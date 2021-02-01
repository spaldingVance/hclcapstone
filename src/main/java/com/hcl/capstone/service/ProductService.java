package com.hcl.capstone.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.capstone.model.Product;
import com.hcl.capstone.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductRepository productDao;
	
	private List<Product> shoppingCard = new ArrayList<>();
	
	public List<Product> getAllProduct() {
		List<Product> pl = (List<Product>) productDao.findAll();
		return pl;
	}
	public boolean createProduct(String photoUrl, 
			String productName, 
			String productCategory, 
			String productCondition, double productPrice) {
		Product newPro = new Product();
		newPro.setProductName(productName);
		newPro.setPhotoUrl(photoUrl);
		newPro.setProductCategory(productCategory);
		newPro.setProductCondition(productCondition);
		newPro.setProductPrice(productPrice);
		
		for (Product p : this.getAllProduct()) {
			if (p.getProductName().equals(newPro.getProductName())) {
				return false;
			}
		}
		productDao.save(newPro);
		return true;
	}
	
	public boolean updateProduct(Product p) {
		Long targetId = p.getId();
		if (this.deleteProduct(targetId) ) {
			productDao.save(p);
			return true;
		} else {
			return false;
		}
	}
	public boolean deleteProduct(Long productId) {
		
		Optional<Product> p = productDao.findById(productId);
		if (p.isPresent()) {
			productDao.deleteById(productId);
			return true;
		} else {
			return false;
		}
	}
	public Product findProduct(Long targetId) {
		Optional<Product> p = productDao.findById(targetId);
		if (p.isPresent()) {
			Product retProduct = p.get();
			return retProduct;
		} else {
			return null;
		}
		
	}
	
}

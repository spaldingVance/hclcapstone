package com.hcl.capstone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.capstone.model.Product;
import com.hcl.capstone.model.User;
import com.hcl.capstone.service.ProductService;



@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("/addproduct")
	public String getaddProduct(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		if (u == null) { // check 1
			return ("redirect:/displayproducts");
		} 
		if (!u.getRole().equalsIgnoreCase("admin")) { // check 2
			return ("redirect:/displayproducts");
		}
		
		return "addproduct";
	}
	@PostMapping("/addproduct")
	public String postAddProduct(
			@RequestParam("productName") String productName,
			@RequestParam("productCategory") String productCategory,
			@RequestParam("productCondition") String productCondition,
			@RequestParam("productPrice") double productPrice,
			@RequestParam("photoUrl") String photoUrl) {
		 boolean create = productService.createProduct(photoUrl, productName, productCategory, productCondition, productPrice);
		 if (create) {
			 return ("redirect:/displayproducts");
		 } else {
			 return ("redirect:/displayproducts");
		 }
			
	}
	@GetMapping("/displayproducts")
	public ModelAndView getdisplayproducts(HttpServletRequest request) {

		List<Product> productList = productService.getAllProduct();
		return new ModelAndView("displayproducts","productList",productList);
		
	}
	@GetMapping("/productdetail")
	public ModelAndView getproductdetail(@RequestParam("id") Long targetId) {
		Product product = productService.findProduct(targetId);
		if (product != null) {
			ModelAndView mav = new ModelAndView("productdetail");
			mav.addObject("product",product);
			return mav;
		} else {
			// null returned
			return new ModelAndView("redirect:/errorpage");
		}
	}
	@GetMapping("/editproduct")
	public ModelAndView getproducteditpage(@RequestParam("id") Long targetId,
			HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		if (u == null) { // check 1
			return new ModelAndView("redirect:/displayproducts");
		} 
		if (!u.getRole().equalsIgnoreCase("admin")) { // check 2
			return new ModelAndView("redirect:/displayproducts");
		}
		
		Product product = productService.findProduct(targetId);
		if (product != null) {
			ModelAndView mav = new ModelAndView("editproduct");
			mav.addObject("product",product);
			return mav;
		} else {
			return new ModelAndView("redirect:/errorpage");
		}
	}
	@PostMapping("/editproduct")
	public String postproducteditpage(@ModelAttribute("product") Product p) {
		boolean res = productService.updateProduct(p);
		if (res) {
			return "redirect:/displayproducts";
		} else {
			return "redirect:/errorpage";
		}
	}
	@GetMapping("/deleteproduct")
	public String getdeleteproduct(@RequestParam("id") Long targetId,HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		if (u == null) { // check 1
			return ("redirect:/displayproducts");
		} 
		if (!u.getRole().equalsIgnoreCase("admin")) { // check 2
			return ("redirect:/displayproducts");
		}
		
		boolean res = productService.deleteProduct(targetId);
		if (res) {
			return "redirect:/displayproducts";
		} else {
			return "redirect:/errorpage";
		}
	}
	@GetMapping("/currentcart")
	public String getcurrentcart() {
		return "currentcart";
	}
	
	@GetMapping("/addtocart")
	public String addtocart(@RequestParam("id") Long targetId,
			HttpServletRequest request) {
		List<Product> currCart = (List<Product>) request.getSession().getAttribute("cart");
		Product targetProduct = productService.findProduct(targetId);
		
		
		if (currCart == null) {
			List<Product> cart = new ArrayList<>();
			request.getSession().setAttribute("cart", cart);
		
			cart.add(targetProduct);
			return "redirect:/currentcart";
		} else {
			currCart.add(targetProduct);
			request.getSession().setAttribute("cart", currCart);
			return "redirect:/currentcart";
		}
	}
	@GetMapping("/deletefromcart")
	public String deleteFromCart(@RequestParam("id") int position, HttpServletRequest request) {
//		Product targetProduct = productService.findProduct(id);
		List<Product> currCart = (List<Product>) request.getSession().getAttribute("cart");
//		System.out.println(currCart.remove(targetProduct));
	
		currCart.remove(position);
		request.getSession().setAttribute("cart", currCart);
		return ("redirect:/currentcart");
	}
	@GetMapping("/checkoutpage")
	public ModelAndView getcheckoutpage(HttpServletRequest request) {
		List<Product> currCart = (List<Product>) request.getSession().getAttribute("cart");
		if (currCart == null) {
			return new ModelAndView("redirect:/errorpage");
		} 
		ModelAndView mav = new ModelAndView("checkoutpage");
		mav.addObject("currCart",currCart);
		return mav;
	}
	
}
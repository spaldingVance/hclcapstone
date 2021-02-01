package com.hcl.capstone.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.capstone.model.Order;
import com.hcl.capstone.model.Product;
import com.hcl.capstone.model.User;
import com.hcl.capstone.service.OrderService;
import com.hcl.capstone.service.UserService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/checkoutpage")
	public String postcheckout(@RequestParam("bAddress") String bAddress,
			@RequestParam("sAddress") String sAddress,
			@RequestParam("orderPrice") Double orderPrice,
			@RequestParam("orderQuantity") int orderQuantity,
			@RequestParam("shippingDate") Date shippingDate,
			@RequestParam("userId") Long userId,HttpServletRequest request,
			Model model) {
		User u = userService.getUserById(userId);
		if (orderQuantity == 0) {
			model.addAttribute("error","Shopping cart is empty!");
			System.out.println("checkout unsuccessful!");
			return "checkoutpage";
		}
		
		boolean b = orderService.createOrder(bAddress, sAddress, orderPrice, orderQuantity, shippingDate, u);
		if (b) {
			// get rid of everything in  the cart
			List<Product> currCart = (List<Product>) request.getSession().getAttribute("cart");
			currCart.clear();
			request.getSession().setAttribute("cart", currCart);
			return ("redirect:/thankyou");
		} else {
			return ("redirect:/errorpage");
		}
		
	}
	@GetMapping("/thankyou")
	public String thankyoupage() {
		return "thankyou";
	}
	@GetMapping("/orderlist")
	public ModelAndView getorderlist(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		if (u != null ) {
			if (u.getRole().equalsIgnoreCase("admin")) {
				List<Order> orderlist = orderService.getAllOrder();
				return new ModelAndView("orderlist","orderlist",orderlist);
			} else {
				return new ModelAndView("redirect:/displayproducts");
			}
			
		} else { // null
			return new ModelAndView("redirect:/displayproducts");
		}
		
	}
	@GetMapping("/deleteorder")
	public String deleteorder(@RequestParam("id") Long targetId) {
		boolean res = orderService.cancelOrder(targetId);
		if (res) {
			return ("redirect:/orderlist");
		} else {
			return ("redirect:/errorpage");
		}
	}
}
package com.hcl.capstone.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.capstone.model.Order;
import com.hcl.capstone.model.User;
import com.hcl.capstone.repository.OrderRepository;

@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderRepository orderDao;
	
	@Autowired
	private UserService userService;
	
	public List<Order> getAllOrder() {
		List<Order> retList = orderDao.findAll();
		return retList;
	}
	
	public boolean createOrder(
			String bAddress,String sAddress,
			Double orderPrice, int orderQuantity, Date shippingDate,
			User u) {
		Order newOrder = new Order();
		newOrder.setsAddress(sAddress);
		newOrder.setbAddress(bAddress);
		newOrder.setOrderQuantity(orderQuantity);
		newOrder.setOrderPrice(orderPrice);
		newOrder.setShppingDate(shippingDate);
		
		// validate user is in database
		for (User user : userService.getAllUser()) {
			if (user.getUsername().equals(u.getUsername())) {
				newOrder.setUser(u);
				orderDao.save(newOrder);
				return true;
			}
		}
		return false;
		
		
	}
	
	public boolean cancelOrder(long id) {
		Optional<Order> o = orderDao.findById(id);
		if (o.isPresent()) {
//			Order target = o.get();
//			if (target.getUser() != null) {
//				target.getUser().forEach()
//			}
			
			orderDao.deleteById(id);
			return true;
		} else {
			return false;
		}
	}
}
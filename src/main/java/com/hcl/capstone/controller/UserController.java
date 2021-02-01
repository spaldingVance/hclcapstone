package com.hcl.capstone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.capstone.model.User;
import com.hcl.capstone.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() {
		return "register";
	}

	@PostMapping("/register")
	public String postRegister(@RequestParam("uname") String name, @RequestParam("pass") String pass, Model model) {
		String role = "user";
		if (userService.createUser(name, pass, role)) {
			return "redirect:/login";
		} else {
			model.addAttribute("error", "Credentials Already Exists in DB");
			System.out.println("user registration unsuccessful");
			return "register";
			/* return "redirect:/errorpage"; */
		}

	}

	@GetMapping("/login")
	public String login(HttpServletRequest request) {
		request.getSession().invalidate();
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(@RequestParam("uname") String name, @RequestParam("pass") String pass,
			HttpServletRequest request, Model model) {
		User retUser = userService.authentication(name, pass);
		if (retUser.getUsername() == null) {
			model.addAttribute("error", "Matching Credentials Not Found in DB");
			return "login";
		} else {
			request.getSession().setAttribute("user", retUser);
			System.out.println(retUser);
//			request.getAttribute().setAttribute("user", retUser);
			System.out.println("user login successful");
			return "redirect:/userlist";

		}

	}

	@GetMapping("/userlist")
	public ModelAndView displayUsers(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		// User u = (User) request.getAttribute("user");
		if (u != null) {
			System.out.println(u);
			if (u.getRole().equalsIgnoreCase("admin")) {
				List<User> userlist = userService.getAllUser();
				return new ModelAndView("displayusers", "userlist", userlist);
			} else {
				return new ModelAndView("redirect:/displayproducts");
			}
		} else {
			return new ModelAndView("redirect:/displayproducts");
		}
	}

	@GetMapping("/edituser")
	public ModelAndView getEdituserpage(@RequestParam("id") long id, HttpServletRequest request) {
		User currUser = (User) request.getSession().getAttribute("user");
		if (currUser == null) { // check 1
			return new ModelAndView("redirect:/displayproducts");
		}
		if (!currUser.getRole().equalsIgnoreCase("admin")) { // check 2
			return new ModelAndView("redirect:/displayproducts");
		}

		User u = userService.getUserById(id);
		if (u.getUsername() != null) {
			ModelAndView mav = new ModelAndView("edituser");
			mav.addObject("user", u);
			return mav;
		} else {
			// dummy user returned
			ModelAndView mav = new ModelAndView("errorpage");
			return mav;
		}
	}

	@PostMapping("/edituser")
	public String postEdituserpage(@RequestParam("id") long id, @RequestParam("uname") String username,
			@RequestParam("password") String password, @RequestParam("role") String role) {
		User currUser = userService.getUserById(id);
		System.out.println(currUser);

		currUser.setUsername(username);
		currUser.setPassword(password);
		currUser.setRole(role);
		userService.updateUser(currUser);
		return ("redirect:/userlist");
	}

	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam("id") long targetId, HttpServletRequest request) {

		User currUser = (User) request.getSession().getAttribute("user");
		if (currUser == null) { // check 1
			return "redirect:/displayproducts";
		}
		if (!currUser.getRole().equalsIgnoreCase("admin")) { // check 2
			return "redirect:/displayproducts";
		}

		if (userService.deleteUser(targetId)) {
			System.out.println("success");
			return "redirect:/userlist";
		} else {
			System.out.println("somehow failed");
			return "errorpage";
		}
	}

	@GetMapping("/")
	public String landingPage() {
		return "landingpage";
	}

	@GetMapping("/errorpage")
	public String errorpage() {
		return "errorpage";
	}

}

package com.hcl.capstone.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.hcl.capstone.model.User;
import com.hcl.capstone.repository.UserRepository;


@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepository userDao;

	public List<User> getAllUser() {
		List<User> rLi = (List<User>) userDao.findAll();
		return rLi;
	}

	public boolean createUser(String userName, String password, String role) {
		User newUser = new User();
		newUser.setUsername(userName);
		newUser.setPassword(password);
		if (role == null) {
			role = "user";
		}
		newUser.setRole(role);

		System.out.print(this.getAllUser().size());
		if (this.getAllUser().size() == 0) {
			userDao.save(newUser);
			return true;
		} else {

			for (User u : userDao.findAll()) {
				if (u.getUsername().equals(userName)) {
					return false;
				}
			}

			userDao.save(newUser);
			return true;
		}

	}

	public User authentication(String name, String pass) {
		Optional<User> u = this.getAllUser().stream()
				.filter(e -> e.getUsername().equals(name) && e.getPassword().equals(pass)).findAny();
		if (u.isPresent()) {
			User currUser = u.get();
		
			return currUser;
		} else {
			User dummy = new User();
			return dummy;
		}

	}

	public User getUserById(Long id) {
		Optional<User> u = userDao.findById(id);
		if (u.isPresent()) {
			return u.get();
		} else {
			// user is not present
			User dummy = new User();
			return dummy;
		}
	}

	public void updateUser(User u) {
//		Long targetId = u.getId();
//		this.deleteUser(targetId);
		
		userDao.flush();
		userDao.save(u);
	}

	public boolean deleteUser(Long id) {

		Optional<User> u = userDao.findById(id);
		if (u.isPresent()) {
			userDao.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

}
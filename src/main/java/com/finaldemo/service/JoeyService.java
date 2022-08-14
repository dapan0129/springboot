package com.finaldemo.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finaldemo.model.Donate;
import com.finaldemo.model.Posts;
import com.finaldemo.model.PostsRepository;
import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;

@Service
@Transactional
public class JoeyService {

	@Autowired
	private UsersRepository uDao;
	
	@Autowired
	private PostsRepository pDao;

	public Users findById(Integer id) {
		Optional<Users> optional = uDao.findById(id);
	
		if (optional.isPresent()) {
			return optional.get();
		}

		return null;

	}

	public void editUser(Users user) {
		uDao.save(user);
	}
	
	public void editPost(Posts post) {
		pDao.save(post);
	}

	public void deleteUser(Integer id) {
		uDao.deleteById(id);
	}

	public Donate findDonationsById(Integer id) {
		
		return null;
		
	}

}

package com.finaldemo.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finaldemo.model.Posts;
import com.finaldemo.model.PostsRepository;
import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;

@Service
@Transactional
public class TimmyService {
	
	@Autowired
	private UsersRepository uDao;
	
	@Autowired
	private PostsRepository pDao;
	
	public Users getUserById(Integer id) {
		return uDao.findById(id).get();
	}
	
	public List<Posts> getPostsByUserId(Integer id){
		Users u1 = uDao.findById(id).get();
		List<Posts> posts = pDao.findPostsByUserId(u1.getUserId());
		return posts;
	}
	public Users insertNewUser(Users user) {
		return uDao.save(user);
	}
	
	public Posts insertNewPost(Posts post) {
		return pDao.save(post);
	}
}

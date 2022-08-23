package com.finaldemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.finaldemo.model.PostImg;
import com.finaldemo.model.PostImgRepository;
import com.finaldemo.model.Posts;
import com.finaldemo.model.PostsRepository;
import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;

@Service
@Transactional
public class BrainService {
	
	// UsersService
	@Autowired
	private UsersRepository uDao;
	
	public void insertUsers(Users msg) {
		uDao.save(msg);
	}
	
	public Users BrainGetUserById(Integer id) {
		return uDao.findById(id).get();
	}
	
	public Page<Users> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 9, Sort.Direction.DESC, "email");
		Page<Users> page = uDao.findAll(pgb);
		return page;
	}
	
	public List<Users> findAllUsers() {
		return uDao.findAll();
	}
	
	public List<Users> searchEmail(String search) {
		return uDao.searchPeopleByEmail(search);
	}
	
	
	// PostService
	@Autowired
	private PostsRepository pDao;
	@Autowired
	private PostImgRepository piDao;
	
	public Posts BrainGetPostsById(Integer id) {
		return pDao.findById(id).get();
	}

	public List<PostImg> getPostImgsByPostId(Integer postId) {
		return piDao.findPostImgsByPostId(postId);
	}
	
	public List<Posts> findAllPosts() {
		return pDao.findAll();
	}
	
	public void insertPosts(Posts Posts) {
		pDao.save(Posts);
	}

	
}

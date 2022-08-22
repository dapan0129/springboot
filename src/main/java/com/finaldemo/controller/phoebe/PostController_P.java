package com.finaldemo.controller.phoebe;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finaldemo.dto.CommentDto;
import com.finaldemo.dto.IdDto;
import com.finaldemo.model.Comments;
import com.finaldemo.model.LikePost;
import com.finaldemo.model.PostImg;
import com.finaldemo.model.Posts;
import com.finaldemo.model.Users;
import com.finaldemo.service.PhoebeService;

@Controller
public class PostController_P {

	@Autowired
	private PhoebeService service;

	// 顯示登入者主頁貼文
	@GetMapping("/getMainPagePosts.controller")
	public String getMainPagePosts(HttpSession session, Model model) {
		// 取得登入者發的posts
		Integer userId = ((Users) session.getAttribute("user")).getUserId();
		List<Posts> postsToShow = service.getPostsByUserId(userId);

		model.addAttribute("postsToShow", postsToShow);
		Users u = new Users();
		model.addAttribute("u", u);

		return "phoebe/index";
	}

	// 新增post
	@PostMapping("/addPost.controller")
	public String addPost(@RequestParam String postText, @RequestParam MultipartFile[] postImg,
			@RequestParam MultipartFile postVideo, @RequestParam Integer whoCanSeeIt, HttpSession session,
			HttpServletRequest request) throws IllegalStateException, IOException {
		Posts p = new Posts();
		Users u = (Users) session.getAttribute("user");
		Users author = service.getUserById(u.getUserId());
//		Set<Posts> posts = author.getPosts();
		p.setIsReport(0);
		p.setPostLike(0);
		p.setPostText(postText);
		p.setPostTime(new Date());
		p.setPostVideoSrc(postVideo.getOriginalFilename());
		p.setWhoCanSeeIt(whoCanSeeIt);
		p.setPostUser(author);
//		posts.add(p);
//		author.setPosts(posts);
//		TimmyService.insertNewUser(author);
//		p.setPostUser((Users) session.getAttribute("user"));
		Posts newPost = service.addPost(p);

		// 存圖片
		PostImg newPostImg = new PostImg();
		for (MultipartFile img : postImg) {
			// 存資料夾
			if (!(img.isEmpty())) {
				String fileName = img.getOriginalFilename();
				String postImgPath = System.getProperty("user.dir") + "\\src\\main\\webapp\\img\\postimg\\" + fileName;
				img.transferTo(new File(postImgPath));
				// 存PostImg資料表
				newPostImg.setPost(newPost);
				newPostImg.setPostImgPath("/img/postimg/" + fileName);
				service.addPostImg(newPostImg);
			} else {
				break;
			}
		}

		// 影片存資料夾
		if (!(postVideo.isEmpty())) {
			String fileName = postVideo.getOriginalFilename();
			String videoPath = System.getProperty("user.dir") + "\\src\\main\\webapp\\video\\" + fileName;
			postVideo.transferTo(new File(videoPath));
		}
		return "redirect:/getMainPagePosts.controller";
	}

	// 修改post
	@PostMapping("/editPost.controller")
	public String editPost(@RequestParam Integer postId, @RequestParam String postText,
			@RequestParam MultipartFile[] postImg, @RequestParam MultipartFile postVideo,
			@RequestParam Integer whoCanSeeIt, HttpSession session) throws IllegalStateException, IOException {
		Posts p = service.getPostByPostId(postId);
//		Users u = (Users) session.getAttribute("user");
//		Users author = TimmyService.getUserById(u.getUserId());
		p.setPostText(postText);
		p.setPostTime(new Date());
		p.setPostVideoSrc(postVideo.getOriginalFilename());
		p.setWhoCanSeeIt(whoCanSeeIt);
//		p.setPostUser(author);
		service.editPost(p);
		service.deleteExtraImgs(postId);

		// 存圖片
		PostImg newPostImg = new PostImg();
		for (MultipartFile img : postImg) {
			// 存資料夾
			if (!(img.isEmpty())) {
				String fileName = img.getOriginalFilename();
				String postImgPath = System.getProperty("user.dir") + "\\src\\main\\webapp\\img\\postimg\\" + fileName;
				img.transferTo(new File(postImgPath));
				newPostImg.setPostImgPath(postImgPath);
				// 存PostImg資料表
				newPostImg.setPost(p);
				newPostImg.setPostImgPath("/img/postimg/" + fileName);
				service.addPostImg(newPostImg);
			} else {
				break;
			}
		}

		return "redirect:/getMainPagePosts.controller";
	}

	// post移到垃圾桶
	@PostMapping("/movePostToTrash.controller")
	public String movePostToTrash(@RequestParam Integer postId) {
		service.movePostToTrash(0, postId);
		return "redirect:/getMainPagePosts.controller";
	}
	
	//舉報post
	@PostMapping("/reportPost.controller")
	@ResponseBody
	public String reportPost(@RequestBody IdDto IdDto) {
		Integer postId = Integer.parseInt(IdDto.getId());
		service.reportPost(1, postId);
		return "comment reported";
	}

	// 新增評論
	@PostMapping("/addComment.controller")
	@ResponseBody
	public String addComment(@RequestBody CommentDto dto, HttpSession session)
			throws IllegalStateException, IOException {
//		throw new IOException();
//		System.out.println("進addComment controller");
		Comments c = new Comments();
		Users u = (Users) session.getAttribute("user");
		Users author = service.getUserById(u.getUserId());
		Posts post = service.getPostByPostId(Integer.parseInt(dto.getPostId()));
//		Set<Posts> posts = author.getPosts();
		c.setCommentLike(0);
		c.setCommentText(dto.getCommentText());
		c.setCommentTime(new Date());
		c.setIsReport(0);
		c.setUser(author);
		c.setPost(post);
//		posts.add(p);
//		author.setPosts(posts);
//		TimmyService.insertNewUser(author);
//		p.setPostUser((Users) session.getAttribute("user"));
		Comments c1 = service.addComment(c);

//		return "redirect:/getMainPagePosts.controller";
		return "add comment success";
	}
	
	//刪除評論
	@PostMapping("/deleteComment.controller")
	@ResponseBody
	public String deleteComment(@RequestBody IdDto IdDto) {
		Integer commentId = Integer.parseInt(IdDto.getId());
		service.deleteComment(commentId);
		
		return "comment deleted";
	}

	// 按讚
	@PostMapping("/postLike.controller")
	@ResponseBody
	public String likePost(@RequestBody IdDto IdDto, HttpSession session) {
		Users u0 = (Users) session.getAttribute("user");
		Users u = service.getUserById(u0.getUserId());
		Integer postId = Integer.parseInt(IdDto.getId());
		LikePost LikePost = service.findLikedPost(u.getUserId(), postId);
		Posts p = service.getPostByPostId(postId);

		if (LikePost != null) {
			service.deleteLikedPost(LikePost);
			p.setPostLike(p.getPostLike() - 1);
			service.addPost(p);
		} else {
			LikePost newLikePost = new LikePost();
			newLikePost.setUser(u);
			newLikePost.setLikedPost(service.getPostByPostId(postId));
			service.saveLikedPost(newLikePost);
			p.setPostLike(p.getPostLike() + 1);
			service.addPost(p);
		}

		return "like clicked";
	}
}

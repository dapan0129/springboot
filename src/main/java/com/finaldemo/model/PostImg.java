package com.finaldemo.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PostImg")
public class PostImg {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postImgId;
	
	private String postImgPath;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_post_id")
	private Posts post;
	
	public PostImg() {
	}

	public Integer getPostImgId() {
		return postImgId;
	}

	public void setPostImgId(Integer postImgId) {
		this.postImgId = postImgId;
	}

	public String getPostImgPath() {
		return postImgPath;
	}

	public void setPostImgPath(String postImgPath) {
		this.postImgPath = postImgPath;
	}

	public Posts getPost() {
		return post;
	}

	public void setPost(Posts post) {
		this.post = post;
	}
	
}

package com.finaldemo.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="Users")
public class Users {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;
	
	private String email;
	
	private String password;
	
	private String nickName;
	
	private Integer category;
	
	private String address;
	
	private String phone;
	
	private String photoPath;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date birthday;
	
	private Integer gender;
	
	private String selfIntroduction;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "petUser",cascade = CascadeType.ALL)
	private Set<Pets> pets = new LinkedHashSet<Pets>(); 
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postUser",cascade = CascadeType.ALL)
	private Set<Posts> posts = new LinkedHashSet<Posts>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user",cascade = CascadeType.ALL)
	private Set<Comments> Comments = new LinkedHashSet<Comments>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Notification> Notification = new LinkedHashSet<Notification>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "fans")
	private Set<Follow> fans = new LinkedHashSet<Follow>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "follow")
	private Set<Follow> follows = new LinkedHashSet<Follow>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Donate> Donate = new LinkedHashSet<Donate>();

	public Users() {
	}


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath1(String photoPath) {
		this.photoPath = photoPath;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getSelfIntroduction() {
		return selfIntroduction;
	}

	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}

	public Set<Pets> getPets() {
		return pets;
	}

	public void setPets(Set<Pets> pets) {
		this.pets = pets;
	}

	public Set<Posts> getPosts() {
		return posts;
	}

	public void setPosts(Set<Posts> posts) {
		this.posts = posts;
	}

	public Set<Comments> getComments() {
		return Comments;
	}

	public void setComments(Set<Comments> comments) {
		Comments = comments;
	}

	public Set<Notification> getNotification() {
		return Notification;
	}

	public void setNotification(Set<Notification> notification) {
		Notification = notification;
	}

	public Set<Follow> getFans() {
		return fans;
	}

	public void setFans(Set<Follow> fans) {
		this.fans = fans;
	}

	public Set<Follow> getFollows() {
		return follows;
	}

	public void setFollows(Set<Follow> follows) {
		this.follows = follows;
	}

	public Set<Donate> getDonate() {
		return Donate;
	}

	public void setDonate(Set<Donate> donate) {
		Donate = donate;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Users [userId=");
		builder.append(userId);
		builder.append(", email=");
		builder.append(email);
		builder.append(", password=");
		builder.append(password);
		builder.append(", nickName=");
		builder.append(nickName);
		builder.append(", category=");
		builder.append(category);
		builder.append(", address=");
		builder.append(address);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", photoPath=");
		builder.append(photoPath);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", selfIntroduction=");
		builder.append(selfIntroduction);
		builder.append(", pets=");
		builder.append(pets);
		builder.append(", posts=");
		builder.append(posts);
		builder.append(", Comments=");
		builder.append(Comments);
		builder.append(", Notification=");
		builder.append(Notification);
		builder.append(", fans=");
		builder.append(fans);
		builder.append(", follows=");
		builder.append(follows);
		builder.append(", Donate=");
		builder.append(Donate);
		builder.append("]");
		return builder.toString();
	}
	
}

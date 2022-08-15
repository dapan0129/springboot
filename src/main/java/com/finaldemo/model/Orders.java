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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="Orders")
public class Orders {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId;
	
	private Integer payment;
	
	private Integer orderPrice;
	
	private String orderNo;
	
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class, cascade = CascadeType.ALL)
	@JoinColumn(name="fk_user_id", referencedColumnName = "userId")
	private Users user;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orders")
	private Set<OrderDetail> orderDetails = new LinkedHashSet<OrderDetail>(); 
	
	public Orders() {
	}

	public Integer getOrderId() {
		return orderId;
	}

	public Integer getPayment() {
		return payment;
	}

	public Integer getOrderPrice() {
		return orderPrice;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public Users getUser() {
		return user;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public void setPayment(Integer payment) {
		this.payment = payment;
	}

	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	
	
}

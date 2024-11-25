package com.example.nachojang.vo;

import lombok.Data;

@Data
public class Cart {
	private Integer cartNo;
	private String customerMail;
	private Integer goodsNo;
	private Integer cartAmount;
	private String updateDate;
	private String createDate;
}

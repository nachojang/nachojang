package com.example.nachojang.vo;

import lombok.Data;

@Data
public class Orders {
	private Integer ordersNo;
	private Integer goodsNo;
	private Integer goodsAmount;
	private Integer paymentNo;
	private String updateDate;
	private String createDate;
}

package com.example.nachojang.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsForm {
	private Integer goodsNo;
	private String goodsTitle;
	private String goodsMemo;
	private Integer goodsPrice;
	private String goodsState;
	private List<MultipartFile> goodsFile;
}

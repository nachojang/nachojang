package com.example.nachojang.vo;

import lombok.Data;

@Data
public class GoodsFile {
	private Integer goodsFileNo;
	private Integer goodsNo;
	private String goodsFileName;
	private String goodsFileOrigin;
	private String goodsFileExt;
	private String goodsFileType;
	private Long goodsFileSize;
	private String updateDate;
	private String createDate;
}

package com.example.nachojang.vo;

import lombok.Data;

@Data
public class GoodsFile {
	private Integer goodsFileNo;
	private Integer goodsNo;
	private String goodsFileName;
	private String goodsFileOriginName;
	private String goodsFileExt;
	private String goodsFileType;
	private String goodsFileSize;
	private String updateDate;
	private String createDate;
}

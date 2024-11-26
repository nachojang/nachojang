package com.example.nachojang.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.nachojang.mapper.GoodsMapper;
import com.example.nachojang.vo.Goods;
import com.example.nachojang.vo.GoodsFile;
import com.example.nachojang.vo.GoodsForm;

@Service
@Transactional
public class GoodsService {
	@Autowired GoodsMapper goodsMapper;
	
	// 상품 추가 : staff/on/addGoods
	public void addGoods(GoodsForm goodsForm, String path) {
		/*
		// 상품 기본 항목 (상품명, 상품설명, 상품금액, 상품재고)
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsState(goodsForm.getGoodsState());
		
	
		// 상품_no = ?
		int row = goodsMapper.insertGoods(goods);
		// 키값
		int goodsNo = goods.getGoodsNo();
		
		if(row == 1 && goodsForm.getGoodsFile() != null) {
			// 파일 입력
			List<MultipartFile> list = goodsForm.getGoodsFile();
			for(MultipartFile mf : list) {
				GoodsFile goodsFile = new GoodsFile();
				
				goodsFile.setGoodsNo(goodsNo);
				goodsFile.setGoodsFileType(mf.getContentType());
				goodsFile.setGoodsFileSize(mf.getSize());
				String filename = UUID.randomUUID().toString().replace("-", "");
				goodsFile.setGoodsFileName(filename);
				int dotIdx = mf.getOriginalFilename().lastIndexOf("."); // (해당하는 점을 찾아내서
				String originname = mf.getOriginalFilename().substring(0, dotIdx);
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				goodsFile.setGoodsFileOriginName(originname);
				goodsFile.setGoodsFileExt(ext);
			}
		}
		*/
	}
	
}

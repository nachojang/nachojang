package com.example.nachojang.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.nachojang.mapper.GoodsCategoryMapper;
import com.example.nachojang.mapper.GoodsFileMapper;
import com.example.nachojang.mapper.GoodsMapper;
import com.example.nachojang.vo.Goods;
import com.example.nachojang.vo.GoodsCategory;
import com.example.nachojang.vo.GoodsFile;
import com.example.nachojang.vo.GoodsForm;

@Service
@Transactional
public class GoodsService {
	@Autowired GoodsMapper goodsMapper;
	@Autowired GoodsFileMapper goodsFileMapper;
	@Autowired GoodsCategoryMapper goodsCategoryMapper;
	
	//페이징
	public List<Map<String, Object>> selectGoodsList( int currentPage  , int rowPerPage) {
	        int beginRow = (currentPage - 1) * rowPerPage ;

	        Map<String, Object> params = new HashMap<>();
	        params.put("rowPerPage", rowPerPage);
	        params.put("beginRow", beginRow);
	        
	        return goodsMapper.selectGoodsList(params);



	    }
	// 우림) 신규상품 : customer/main
	public List<Map<String, Object>> selectNewGoodsList() {
		return goodsMapper.selectNewGoodsList();
	}
	
	// 우림) 인기상품 : customer/main
	public List<Map<String, Object>> selectBestGoodsList() {
		return goodsMapper.selectBestGoodsList();
	}
	
	 
	// 우림) 상품 수정 : staff/on/modifyGoods
	
	
	// 우림_상품 추가 : staff/on/addGoods
	public void addGoods(GoodsForm goodsForm, String path) {
		// 상품 기본 항목 (상품명, 상품설명, 상품금액, 상품재고)
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsState(goodsForm.getGoodsState());
		
		// 상품 no 생성
		Integer addGoodsRow = goodsMapper.insertGoods(goods);
		// 키값
		Integer goodsNo = goods.getGoodsNo();
		Integer categoryNo = goodsForm.getCategoryNo();
		
		if(addGoodsRow == 1 && goodsForm.getGoodsFile() != null) {
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
				goodsFile.setGoodsFileOrigin(originname);
				goodsFile.setGoodsFileExt(ext);
				
				int goodsFileRow = goodsFileMapper.insertGoodsFile(goodsFile);
				if(goodsFileRow == 1) {
					// 물리적 파일 저장
					try {
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						// -> try에서 작동하는 예외 말고 다른 예외를 인위적으로 발생시켜서 알림
						throw new RuntimeException(); 
					}
				}
			}
		}
		GoodsCategory goodsCategory = new GoodsCategory();
		goodsCategory.setGoodsNo(goodsNo);
		goodsCategory.setCategoryNo(categoryNo);
		
		Integer categoryRow = goodsCategoryMapper.insertGoodsByCategory(goodsCategory);
	}
}

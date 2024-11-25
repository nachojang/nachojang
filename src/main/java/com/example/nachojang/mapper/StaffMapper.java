package com.example.nachojang.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Staff;

@Mapper
public interface StaffMapper {
    // 로그인
    Staff login(Staff staff);
}
package com.example.nachojang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nachojang.mapper.StaffMapper;
import com.example.nachojang.vo.Staff;

@Service
public class StaffService {
    @Autowired 
    private StaffMapper staffMapper;

    // 로그인 서비스
    public Staff loginS(Staff staff) {
        return staffMapper.login(staff);
    }
}
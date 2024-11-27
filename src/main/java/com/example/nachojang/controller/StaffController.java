package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.StaffService;
import com.example.nachojang.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
    @Autowired 
    private StaffService staffService;
    
    //로그아웃
    @GetMapping("/staff/on/logout")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:/staff/off/staffLogin";
    }
    
    // 로그인 폼 (GET 요청)
    @GetMapping("/staff/off/staffLogin")
    public String login() {
        
        return "staff/off/staffLogin";
    }
    
    @GetMapping("/staff/on/main")
    public String main() {
        return "staff/on/main"; 
    }
    // 로그인 처리 (POST 요청)
    @PostMapping("/staff/off/staffLogin")
    public String login(
        Model model, 
        HttpSession session,
        @RequestParam(name = "staffId") String staffId,
        @RequestParam(name = "staffPw") String staffPw
    ) {
        log.debug("로그인 시도: staffId={}", staffId);

        // 입력값을 Staff 객체로 매핑
        Staff paramStaff = new Staff();
        paramStaff.setStaffId(staffId);
        paramStaff.setStaffPw(staffPw);

        // 서비스 호출
        Staff loginStaff = staffService.login(paramStaff);

        // 로그인 실패 처리
        if (loginStaff == null) {
            log.debug("로그인 실패: 잘못된 ID 또는 비밀번호");
            model.addAttribute("msg", "잘못된 ID 또는 비밀번호입니다.");
            return "staff/off/staffLogin";
        }

        // 로그인 성공 시 세션에 저장 (속성명: loginS)
        session.setAttribute("loginStaff", loginStaff);
        log.debug("로그인 성공: staffId={}, 세션 loginS 속성 추가", loginStaff.getStaffId());

        return "redirect:/staff/on/main";
    }
}
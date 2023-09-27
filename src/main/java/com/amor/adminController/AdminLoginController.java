package com.amor.adminController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.amor.admin.model.*;
import com.amor.admin.service.AdminService;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin/adminLogin.do")
	public String adminLoginSubmit(@CookieValue(value = "autologin", required = false)String autologin) {
		
		if(autologin != null) {
			return "admin/admin_header";
		}else {			
			return "admin/adminLogin";
		}
	}
	
	@RequestMapping("/admin/adminMain.do")
	public ModelAndView goAdminPage(AdminDTO dto,
			@RequestParam(value = "id_remember",defaultValue = "off")String check1,
			@RequestParam(value = "autoLogin",defaultValue = "off")String check2,
			HttpServletResponse resp, HttpSession session) {
		System.out.println(check1);
		System.out.println(check2);
		ModelAndView mav = new ModelAndView();
		Boolean result = adminService.adminLogin(dto);
		if(result == true) {
			if(check1.equals("on")) {
				System.out.println("gdgd");
				Cookie ck = new Cookie("idremember",dto.getAdmin_id());
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}else if(check1.equals("off")) {
				System.out.println("gdgd");
				Cookie ck = new Cookie("idremember",dto.getAdmin_id());
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}
			
			if(check2.equals("on")) {
				System.out.println("됨");
				Cookie ck = new Cookie("autologin",dto.getAdmin_id());
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}else if(check2.equals("off")) {
				System.out.println("gdgd");
				Cookie ck = new Cookie("autologin",dto.getAdmin_id());
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}
			session.setAttribute("data", dto.getAdmin_id());
			mav.addObject("msg", "관리자님 환영합니다");
			mav.addObject("href", "/amor/admin/admin.do");
			mav.setViewName("admin/msg/adminMsg");
		}else {
			mav.addObject("msg", "아이디 및 비밀번호가 틀렸습니다");
			mav.addObject("href", "/amor/admin/adminLogin.do");
			mav.setViewName("admin/msg/adminMsg");
		}
		return mav;
	}
	
	@RequestMapping("/admin/admin.do")
	public String goMainPage() {
		return "admin/admin_header";
	}
	
	@RequestMapping("/admin/adminlogout.do")
	public String adminLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "admin/adminLogin";
	}
}
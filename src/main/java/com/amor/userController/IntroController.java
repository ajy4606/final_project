package com.amor.userController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {

	@RequestMapping("intro/intro.do")
	public String intro() {
		return "/user/intro/intro";
	}
	
}

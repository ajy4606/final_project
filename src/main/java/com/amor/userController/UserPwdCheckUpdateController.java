package com.amor.userController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.amor.encryption.Encryption;
import com.amor.member.service.MemberService;

@Controller
public class UserPwdCheckUpdateController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("myAmor/userPwdCheckForm.do")
	public ModelAndView userPwdCheckForm(@RequestParam("type")String type, HttpSession session) {

		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sid")==null) {
			mav.addObject("msg", "로그인 후 이용가능합니다.");
			mav.addObject("goUrl", "/amor/member/login.do");
			mav.setViewName("user/msg/userMsg");			
		}else {
			String msg="";
			if(type.equals("pwdUpdate")) {
				msg="비밀번호 수정";
				mav.addObject("msg", msg);
				mav.addObject("type", "pwdUpdate");
				mav.setViewName("/user/myAmor/userPwdCheck");
			}else if(type.equals("withdraw")) {
				msg="회원탈퇴";
				mav.addObject("msg", msg);
				mav.addObject("type", "withdraw");
				mav.setViewName("/user/myAmor/userPwdCheck");
			}
		}
		return mav;
	}
	
	@RequestMapping(value="myAmor/userPwdCheckSubmit.do", method = RequestMethod.POST)
	public ModelAndView userPwdCheckSubmit(
			@RequestParam(value="pwd", defaultValue = "notpwd") String pwd2,
			@RequestParam("typemsg") String typemsg,
			HttpSession session) {
		
		String pwd = Encryption.pwdEncrypt(pwd2);
		ModelAndView mav=new ModelAndView();
		
		if(session.getAttribute("sid")==null) {
			mav.addObject("msg", "로그인 후 이용가능합니다.");
			mav.addObject("goUrl", "/amor/member/login.do");
			mav.setViewName("user/msg/userMsg");			
		}else {
			String sid=(String)session.getAttribute("sid");
			String type="";
			if(typemsg.equals("비밀번호 수정")) {
				type="pwdUpdate";
			}else if(typemsg.equals("회원탈퇴")) {
				type="withdraw";
			}
			
			String msg;
			if(pwd.equals("notpwd") || pwd.equals("")) {
				msg="비밀번호를 입력해주세요.";
				mav.addObject("msg", msg);
				mav.addObject("goUrl", "userPwdCheckForm.do");
				mav.setViewName("/user/msg/userMsg");
				return mav;
			}
			
			int result=memberService.memberPwdCheck(sid, pwd);
			
			if(result==memberService.SUCCES) {
				if(type.equals("pwdUpdate")) {
					mav.setViewName("/user/myAmor/userPwdUpdate");	

				}else if(type.equals("withdraw")) {
					mav.setViewName("/user/myAmor/withdraw");
				}
				
			}else if(result==memberService.ERROR) {
				msg="비밀번호가 맞지 않습니다.";
				mav.addObject("msg", msg);
				mav.addObject("goUrl", "userPwdCheckForm.do?type="+type);
				mav.setViewName("/user/msg/userMsg");
			}	
			
		}
		return mav;
	}
	
	@RequestMapping("myAmor/userPwdUpdateForm.do")
	public ModelAndView userPwdUpdateForm(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sid")==null) {
			mav.addObject("msg", "로그인 후 이용가능합니다.");
			mav.addObject("goUrl", "/amor/member/login.do");
			mav.setViewName("user/msg/userMsg");			
		}else {
			mav.setViewName("/user/myAmor/userPwdUpdate");
		}	
		return mav;
	}
	
	@RequestMapping(value="myAmor/userPwdUpdateSubmit.do",method = RequestMethod.POST)
	public ModelAndView userPwdUpdateSubmit(
			@RequestParam("pwd")String pwd2,
			HttpSession session) {
		String pwd = Encryption.pwdEncrypt(pwd2);
		String sid=(String)session.getAttribute("sid");
		int result=memberService.memberPwdUpdate(sid, pwd);
		String msg=result>0?"비밀번호 수정이 완료되었습니다.":"비밀번호 수정이 실패하였습니다.";

		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/amor/index.do");
		mav.setViewName("/user/msg/userMsg");
		return mav;
	}

}

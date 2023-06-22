package com.friendly.eco.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DonationController {
	//관리자 : 모든 기부글 조회 
	@GetMapping("/donationMain")
	public ModelAndView getDonation(HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/donation/list");
		
		return mav;
	}
	
	//관리자 : 상세내역 조회
	@GetMapping("/donationDetail")
	public ModelAndView getDonationDetail(HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/donation/detail");
		
		return mav;
	}
	
	//승인/미승인 기부글 조회
}

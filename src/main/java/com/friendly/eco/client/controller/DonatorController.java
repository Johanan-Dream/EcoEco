package com.friendly.eco.client.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.friendly.eco.domain.Donator;
import com.friendly.eco.domain.Mem;
import com.friendly.eco.model.donation.DonatorService;

@Controller
public class DonatorController {
	
	@Autowired
	private DonatorService donatorService;
	
	//기부자 등록
	@PostMapping("/donation/donate")
	public ModelAndView donate(HttpServletRequest request, Donator donator) {
		HttpSession session=request.getSession();
		Mem mem=(Mem)session.getAttribute("mem");
		
		donatorService.insert(donator);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("mem", mem);
		mav.setViewName("client/donation/donationDetail");
		
		return mav;
	}
}

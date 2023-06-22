package com.friendly.eco.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.friendly.eco.model.donation.DcontentsService;

@RestController
@RequestMapping("/rest")
public class RestDonationController {
	
	@Autowired
	private DcontentsService dcontentsService;
	
	//admin 회원목록
	@GetMapping("/donationAppList") 
	public List getAppList() { 
		return dcontentsService.selectAll(); 
	}
}

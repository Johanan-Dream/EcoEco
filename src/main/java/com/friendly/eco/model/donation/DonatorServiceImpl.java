package com.friendly.eco.model.donation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.friendly.eco.domain.Donator;
import com.friendly.eco.exception.DonatorException;

@Service
public class DonatorServiceImpl implements DonatorService{
	
	@Autowired
	private DonatorDAO donatorDAO;
	

	public List selectAll() {
		return donatorDAO.selectAll();
	}


	public List selectByDcontents(int dcontents_idx) {
		return donatorDAO.selectByDcontents(dcontents_idx);
	}


	public void insert(Donator donator) throws DonatorException{
		donatorDAO.insert(donator);
		
	}

	public void update(Donator donator) {
		donatorDAO.update(donator);
		
	}

	public void delete(int dcontents_idx) {
		donatorDAO.delete(dcontents_idx);
		
	}

}

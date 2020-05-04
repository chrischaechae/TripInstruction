package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.model.MapDao;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	MapDao mapDao;
	
	
	@Override
	public void selectAll_map(Model model, int tour_no) {

		try {
			List<MapDao> list = mapDao.selectAll_map(tour_no);
			model.addAttribute("lists",list);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

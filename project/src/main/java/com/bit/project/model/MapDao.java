package com.bit.project.model;

import java.util.List;

public interface MapDao {
	
	List<MapDao> selectAll_map(int tour_no) throws Exception;
}

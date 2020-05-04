package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ClientVo;

public interface ClientService {

	List<ClientVo> selectAll_client(Search search) throws Exception;
	List<ClientVo> selectAll_clientName(Search search) throws Exception;
	List<ClientVo> selectAll_clientLevel(Search search) throws Exception;
	
	void selectOne_client(int key,Model model);
	void insertOne_client(ClientVo bean);
	void updateOne_client(ClientVo bean);
	void deleteOne_client(int key);
	public ClientVo loginCheck(ClientVo bean) throws Exception;
	public ClientVo findId(ClientVo bean) throws Exception;
	public ClientVo findPw(ClientVo bean) throws Exception;
	void pwUpdate(ClientVo bean) throws Exception;
	public ClientVo nickDupli(ClientVo bean) throws Exception;
	public ClientVo idDupli(ClientVo bean) throws Exception;
	void changeInfo(ClientVo bean) throws Exception;
	void changePw(ClientVo bean) throws Exception;
	public int getClientListCnt(Search search) throws Exception;
}

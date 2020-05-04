package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ClientVo;

@Repository
public class ClientDaoImpl implements ClientDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ClientVo> selectAll_client(Search search) throws Exception {
		return sqlSession.selectList("client.selectAll_client", search);
	}

	@Override
	public List<ClientVo> selectAll_clientName(Search search) throws Exception {
		return sqlSession.selectList("client.selectAll_clientName", search);
	}
	
	@Override
	public List<ClientVo> selectAll_clientLevel(Search search) throws Exception {
		return sqlSession.selectList("client.selectAll_clientLevel", search);
	}
	
	@Override
	public ClientVo selectOne_client(int key) throws Exception {
		return sqlSession.selectOne("client.selectOne_client",key);
	}

	@Override
	public void insertOne_client(ClientVo bean) throws Exception {
		sqlSession.insert("client.insertOne_client",bean);
	}

	@Override
	public int updateOne_client(ClientVo bean) throws Exception {
		return sqlSession.update("client.updateOne_client",bean);
	}

	@Override
	public int deleteOne_client(int key) throws Exception {
		return sqlSession.delete("client.deleteOne_client",key);
	}

	@Override
	public ClientVo loginCheck(ClientVo bean) throws Exception {
		return sqlSession.selectOne("client.login",bean);
	}

	@Override
	public ClientVo findId(ClientVo bean) throws Exception {
		return sqlSession.selectOne("client.findId", bean);
	}

	@Override
	public ClientVo findPw(ClientVo bean) throws Exception {
		return sqlSession.selectOne("client.findPw", bean);
	}

	@Override
	public int pwUpdate(ClientVo bean) throws Exception {
		return sqlSession.update("client.pwUpdate", bean);
	}

	@Override
	public ClientVo nickDupli(ClientVo bean) throws Exception {
		return sqlSession.selectOne("client.nickDupli", bean);
	}

	@Override
	public ClientVo idDupli(ClientVo bean) throws Exception {
		return sqlSession.selectOne("client.idDupli", bean);
	}

	@Override
	public int changeInfo(ClientVo bean) throws Exception {
		return sqlSession.update("client.changeInfo", bean);
	}

	@Override
	public int changePw(ClientVo bean) throws Exception {
		return sqlSession.update("client.changePw", bean);
	}

	@Override
	public int getClientListCnt(Search search) throws Exception {
		return sqlSession.selectOne("client.getClientListCnt", search);
	}


	


}

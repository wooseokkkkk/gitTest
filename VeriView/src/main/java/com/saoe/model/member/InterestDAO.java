package com.saoe.model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class InterestDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int insertInter(List<InterestDTO> interList) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("insertInter", interList);

		sqlSession.close();

		return cnt;
	}

	public List<InterestDTO> selectInter(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<InterestDTO> interList = sqlSession.selectList("selectInter", id);

		sqlSession.close();

		return interList;
	}
	
	public int updateInter(List<InterestDTO> interList, String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.delete("deleteInter", id);
		
		int cnt = sqlSession.insert("insertInter", interList);

		sqlSession.close();

		return cnt;
	}

}

package com.saoe.model.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class SearchDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<SearchDTO> search(String searchWord) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<SearchDTO> searchList = sqlSession.selectList("search", searchWord);

		sqlSession.close();

		return searchList;
	}

	public List<SearchReviewDTO> searchReview(String keyword) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<SearchReviewDTO> searchReviewList = sqlSession.selectList("searchReview", keyword);

		sqlSession.close();

		return searchReviewList;
	}

	public List<SearchMemberDTO> searchMember(String keyword) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<SearchMemberDTO> searchMemberList = sqlSession.selectList("searchMember", keyword);

		sqlSession.close();

		return searchMemberList;
	}

	public List<SearchRestDTO> searchRest(String keyword) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<SearchRestDTO> searchRestList = sqlSession.selectList("searchRest", keyword);

		sqlSession.close();

		return searchRestList;
	}

}

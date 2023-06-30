package com.saoe.model.restaurant;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.model.category.CategoryDTO;
import com.saoe.model.member.RestMemberDTO;
import com.saoe.mybatis.SqlSessionManager;

public class RestaurantDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public RestaurantDTO restDetail(int rest_no) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		
		RestaurantDTO rest = sqlSession.selectOne("selectRest", rest_no);
		
		List<RestPicDTO> restPicList = sqlSession.selectList("selectRestPic", rest_no);
		
		rest.setRestPicList(restPicList);
		
		sqlSession.close();
		
		return rest;
	}
	
	public int blockRest(RestMemberDTO restMember) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("blockRest", restMember);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public int followRest(RestMemberDTO restMember) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("followRest", restMember);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public int gbRest(RestMemberDTO restMember) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("gbRest", restMember);
		
		sqlSession.close();
		
		return cnt;
	}

}

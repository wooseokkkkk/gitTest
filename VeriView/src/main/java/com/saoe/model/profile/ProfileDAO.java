package com.saoe.model.profile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class ProfileDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public ProfileDTO selectProfile(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		ProfileDTO profile = sqlSession.selectOne("selectProfile", id);

		sqlSession.close();

		return profile;
	}

	public List<ProfileFeedDTO> selectProfileFeed(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileFeedList = sqlSession.selectList("selectProfileFeed", id);

		sqlSession.close();

		return profileFeedList;
	}

	public List<ProfileFollowDTO> selectProfileFollower(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFollowDTO> profileFollowerList = sqlSession.selectList("selectProfileFollower", id);

		sqlSession.close();

		return profileFollowerList;
	}

	public List<ProfileFollowDTO> selectProfileFollowing(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFollowDTO> profileFollowingList = sqlSession.selectList("selectProfileFollowing", id);

		sqlSession.close();

		return profileFollowingList;
	}

	public List<ProfileBlockDTO> selectProfileBlock(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileBlockDTO> profileBlockList = sqlSession.selectList("selectProfileBlock", id);
		
		sqlSession.close();
		
		return profileBlockList;
	}

	public List<ProfileReportDTO> selectProfileReport(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileReportDTO> profileReportList = sqlSession.selectList("selectProfileReport", id);

		sqlSession.close();

		return profileReportList;
	}

	public List<ProfileFeedDTO> selectProfileScrapReview(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileScrapReviewList = sqlSession.selectList("selectProfileScrapReview", id);

		sqlSession.close();

		return profileScrapReviewList;
	}

	public List<ProfileFeedDTO> selectProfileGoodReview(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileGoodReviewList = sqlSession.selectList("selectProfileGoodReview", id);

		sqlSession.close();

		return profileGoodReviewList;
	}

	public List<ProfileFeedDTO> selectProfileBadReview(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileBadReviewList = sqlSession.selectList("selectProfileBadReview", id);

		sqlSession.close();

		return profileBadReviewList;
	}

	public List<ProfileFeedDTO> selectProfileBlockReview(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileBlockReviewList = sqlSession.selectList("selectProfileBlockReview", id);

		sqlSession.close();

		return profileBlockReviewList;
	}

	public List<ProfileFeedDTO> selectProfileReportReview(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileReportReviewList = sqlSession.selectList("selectProfileReportReview", id);

		sqlSession.close();

		return profileReportReviewList;
	}
	
	public List<ProfileRestDTO> selectProfileFollowingRest(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileRestDTO> profileFollowingRestList = sqlSession.selectList("selectProfileFollowingRest", id);
		
		sqlSession.close();
		
		return profileFollowingRestList;
	}
	public List<ProfileRestDTO> selectProfileGoodRest(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileRestDTO> profileGoodRestList = sqlSession.selectList("selectProfileGoodRest", id);
		
		sqlSession.close();
		
		return profileGoodRestList;
	}
	public List<ProfileRestDTO> selectProfileBadRest(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileRestDTO> profileBadRestList = sqlSession.selectList("selectProfileBadRest", id);
		
		sqlSession.close();
		
		return profileBadRestList;
	}
	public List<ProfileRestDTO> selectProfileBlockRest(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileRestDTO> profileBlockRestList = sqlSession.selectList("selectProfileBlockRest", id);
		
		sqlSession.close();
		
		return profileBlockRestList;
	}
}

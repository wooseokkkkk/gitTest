package com.saoe.model.feed;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.model.category.CategoryDTO;
import com.saoe.model.member.MemberDTO;
import com.saoe.model.reply.ReplyDTO;
import com.saoe.model.review.ReviewPicDTO;
import com.saoe.mybatis.SqlSessionManager;

public class FeedDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// (피드 설정, s_f_201)
	// 메뉴, 지역, 팔로우 별 변수를 받아 테이블을 다르게 select

	public List<FeedDTO> selectFeed() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		System.out.println("불러오는중");
		List<FeedDTO> feedList = sqlSession.selectList("selectFeed");
		System.out.println("불러왔음");

		for (FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList);
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList);
		}

		sqlSession.close();

		return feedList;
	}

	public List<FeedDTO> selectCateFeed(int code_no) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		System.out.println("불러오는중");
		System.out.println(code_no);
		List<FeedDTO> feedList = sqlSession.selectList("selectCateFeed", code_no);
		System.out.println("불러왔음");

		for (FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList);
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList);
		}

		sqlSession.close();

		return feedList;
	}

	// 유저 추천 피드
	public List<FeedDTO> selectUserFeed(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<FeedDTO> feedList = sqlSession.selectList("selectUserFeed", id);

		for (FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList);
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList);
		}

		sqlSession.close();

		return feedList;
	}

	// 카테고리 불러옴
	public List<CategoryDTO> selectCate() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<CategoryDTO> cateList = sqlSession.selectList("selectCate");

		sqlSession.close();

		return cateList;
	}

	// 식당 피드
	public List<FeedDTO> selectRestFeed(int rest_no) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		System.out.println("불러오는중");
		List<FeedDTO> feedList = sqlSession.selectList("selectRestFeed", rest_no);
		System.out.println("불러왔음");

		for (FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList);
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList);
		}

		sqlSession.close();

		return feedList;
	}

	// 유저 추천 식당 피드
	public List<FeedDTO> selectUserRestFeed(String id, int rest_no) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<FeedDTO> feedList = sqlSession.selectList("selectRestFeed", rest_no);

		for (FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList);
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList);
		}

		sqlSession.close();

		return feedList;
	}

	public FeedDTO selectOneFeed(int review_no) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		System.out.println("불러오는중");
		FeedDTO feed = sqlSession.selectOne("selectOneFeed", review_no);
		System.out.println("불러왔음");

		List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
		feed.setReplyList(replyList);
		List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
		feed.setReviewPicList(reviewPicList);

		sqlSession.close();

		return feed;
	}

}

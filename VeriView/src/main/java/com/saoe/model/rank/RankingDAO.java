package com.saoe.model.rank;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class RankingDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<RankingDTO> selectRanking(int day){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<RankingDTO> rankingList = sqlSession.selectList("selectRanking");
		
		List<ScoreDTO> goodReviewScoreList = sqlSession.selectList("selectGoodReviewScore", day);
		List<ScoreDTO> badReviewScoreList = sqlSession.selectList("selectBadReviewScore", day);
		List<ScoreDTO> blockReviewScoreList = sqlSession.selectList("selectBlockReviewScore", day);
		List<ScoreDTO> reportReviewScoreList = sqlSession.selectList("selectReportReviewScore", day);
		List<ScoreDTO> scrapReviewScoreList = sqlSession.selectList("selectScrapReviewScore", day);
		List<ScoreDTO> reviewScoreList = sqlSession.selectList("selectReviewScore", day);
		List<ScoreDTO> followUserScoreList = sqlSession.selectList("selectFollowUserScore", day);
		List<ScoreDTO> reportUserScoreList = sqlSession.selectList("selectReportUserScore", day);
		List<ScoreDTO> blockUserScoreList = sqlSession.selectList("selectBlockUserScore", day);
		
		for(RankingDTO rank : rankingList) {
			int total_score = 0;
			for(ScoreDTO score : goodReviewScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score += Integer.parseInt(score.getCount()) * 10;
				}
			}
			for(ScoreDTO score : badReviewScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score -= Integer.parseInt(score.getCount()) * 10;
				}
			}
			for(ScoreDTO score : blockReviewScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score -= Integer.parseInt(score.getCount()) * 20;
				}
			}
			for(ScoreDTO score : reportReviewScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score -= Integer.parseInt(score.getCount()) * 30;
				}
			}
			for(ScoreDTO score : scrapReviewScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score += Integer.parseInt(score.getCount()) * 30;
				}
			}
			for(ScoreDTO score : reviewScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score += Integer.parseInt(score.getCount()) * 5;
				}
			}
			for(ScoreDTO score : followUserScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score += Integer.parseInt(score.getCount()) * 1;
				}
			}
			for(ScoreDTO score : reportUserScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score += Integer.parseInt(score.getCount()) * 2;
				}
			}
			for(ScoreDTO score : blockUserScoreList) {
				if(rank.getId().equals(score.getId())){
					total_score += Integer.parseInt(score.getCount()) * 3;
				}
			}
			rank.setMember_score(total_score);
			System.out.println(rank.getNick() + "최종점수 : " + total_score);
		}
		System.out.println(rankingList.size());
		for(int i = 0; i < rankingList.size(); i++) {
			if(rankingList.get(i).getMember_score() < 0.0) {
				rankingList.remove(i);
			}
		}
		for(RankingDTO rank : rankingList) {
			System.out.println(rank.getNick() + ": " + rank.getMember_score());
		}
		System.out.println("----------------------");
		
		Collections.sort(rankingList, new Comparator<RankingDTO>() {

			@Override
			public int compare(RankingDTO o1, RankingDTO o2) {
				// TODO Auto-generated method stub
				return (int)(o2.getMember_score() - o1.getMember_score());
			}
		});
		
		
		for(RankingDTO rank : rankingList) {
			System.out.println(rank.getNick() + ": " + rank.getMember_score());
		}
		sqlSession.close();
		
		return rankingList;
		
	}
	
	public List<ScoreDTO> selectGoodReviewScore(int day) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ScoreDTO> goodReviewScoreList = sqlSession.selectList("selectGoodReviewScore", day);
		
		sqlSession.close();
		
		return goodReviewScoreList;
	}

}

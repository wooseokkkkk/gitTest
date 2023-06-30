package com.saoe.model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.model.member.RestMemberDTO;
import com.saoe.model.member.ReviewMemberDTO;
import com.saoe.mybatis.SqlSessionManager;

public class MemberDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// (회원가입, s_f_101)
	public int join(MemberDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("join", dto);

		sqlSession.close();

		return cnt;
	}

	// (로그인, s_f_102)
	public SessionUserDTO login(LoginDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		SessionUserDTO member = sqlSession.selectOne("login", dto);

		member.setMemberMemberList(selectMemberMemberList(member.getId()));
		member.setReviewMemberList(selectReviewMemberList(member.getId()));
		member.setRestMemberList(selectRestMemberList(member.getId()));

		sqlSession.close();

		return member;
	}

	public List<MemberMemberDTO> selectMemberMemberList(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<MemberMemberDTO> memberMemberList = sqlSession.selectList("loginMember", id);

		sqlSession.close();

		return memberMemberList;
	}
	public List<ReviewMemberDTO> selectReviewMemberList(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ReviewMemberDTO> reviewMemberList = sqlSession.selectList("loginReview", id);
		
		sqlSession.close();
		
		return reviewMemberList;
	}
	public List<RestMemberDTO> selectRestMemberList(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<RestMemberDTO> restMemberList = sqlSession.selectList("loginRest", id);
		
		sqlSession.close();
		
		return restMemberList ;
	}

	// (회원 탈퇴, s_f_104)
	public void dropMember() {

	}

	public MemberDTO selectUpdateMember(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		MemberDTO updateMember = sqlSession.selectOne("selectUpdateMember", id);

		sqlSession.close();

		return updateMember;
	}

	// (회원 정보 수정, s_f_501)
	public int updateMember(MemberDTO updateMember) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.update("updateMember", updateMember);

		sqlSession.close();

		return cnt;
	}

	public int followMember(MemberMemberDTO memberMember) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.update("followMember", memberMember);

		sqlSession.close();

		return cnt;
	}

	public int blockMember(MemberMemberDTO memberMember) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.update("blockMember", memberMember);

		sqlSession.close();

		return cnt;
	}

	// (회원 신고, s_f_505)
	public int reportMember(MemberMemberDTO memberMember) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.update("reportMember", memberMember);

		sqlSession.close();

		return cnt;
	}

}

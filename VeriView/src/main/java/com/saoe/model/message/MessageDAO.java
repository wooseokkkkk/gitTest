package com.saoe.model.message;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class MessageDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// (쪽지목록, s_f_602)
	public List<MessageDTO> selectReceiveMessage(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<MessageDTO> messageList = sqlSession.selectList("selectReceiveMessage", id);
		
		sqlSession.close();		
		
		return messageList;
	}
	
	public List<MessageDTO> selectSendMessage(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<MessageDTO> messageList = sqlSession.selectList("selectSendMessage", id);
		
		sqlSession.close();		
		
		return messageList;
	}
	
	// (쪽지보내기, s_f_601)
	public int sendMessage(MessageDTO msg) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = 0;
		
		if(msg.getReview_no() == 0) {
			cnt = sqlSession.insert("sendMessage", msg);			
		}else {
			cnt = sqlSession.insert("sendReivewMessage", msg);			
		}
		
		return cnt;
	}
	
	public List<FFFDTO> selectFFF(String id){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<FFFDTO> fffList = sqlSession.selectList("selectFFF", id);
		
		sqlSession.close();		
		
		return fffList;
		
	}
	
	// (쪽지삭제, ??)

}

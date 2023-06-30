package com.saoe.model.reply;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class ReplyDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int writeReply(ReplyDTO reply) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = 0;
		
		if(reply.getParent_no() == 0) {
			cnt = sqlSession.insert("writeReply", reply);
		}else {
			cnt = sqlSession.insert("writeReply2", reply); 
		}
		
		sqlSession.close();		
		
		return cnt;
		
	}

}

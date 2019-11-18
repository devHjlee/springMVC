package com.hjlee.home.security.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hjlee.home.security.vo.UserDetailsVO;

@Repository("userDetailsDao")
public class UserDetailsDao {
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsDao.class);
	
	@Autowired
    private SqlSessionTemplate sqlSession;
 
    public UserDetailsVO getUserById(String username) {
    	logger.info("UserDetailsDao START");
    	logger.info("username:"+username);
    	return sqlSession.selectOne("userInfo.selectUserById", username);
    }

}

package com.hjlee.home.security.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hjlee.home.security.vo.CustomUserDetails;

@Repository("customUserDAO")
public class CustomUserDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public CustomUserDetails getUserById(String username) {
        return sqlSession.selectOne("userInfo.selectUserById", username);
    }

    public int getUserByEmail(String email) {
        return sqlSession.selectOne("userInfo.selectUserByEmail", email);
    }

    public int insertUserInfo(CustomUserDetails user) throws Exception {
        return sqlSession.insert("userInfo.insertUserInfo", user);
    }

    /*
     * public void updateFailureCount(String username) {
     * sqlSession.update("user.updateFailureCount", username); }
     * 
     * public int checkFailureCount(String username) { return
     * sqlSession.selectOne("user.checkFailureCount", username); }
     * 
     * public void updateDisabled(String username) {
     * sqlSession.update("user.updateUnenabled", username); }
     * 
     * public void updateFailureCountReset(String username) {
     * sqlSession.update("user.updateFailureCountReset", username); }
     * 
     * public void updateNewAccessDate(String username) {
     * sqlSession.update("user.updateAccessDate", username); }
     */

}

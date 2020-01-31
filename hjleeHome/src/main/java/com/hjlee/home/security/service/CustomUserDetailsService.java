package com.hjlee.home.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjlee.home.security.dao.CustomUserDAO;
import com.hjlee.home.security.vo.CustomUserDetails;

@Transactional
@Service
public class CustomUserDetailsService implements UserDetailsService {

  private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

  @Autowired
  private CustomUserDAO userAuthDAO;

  @Autowired
  private BCryptPasswordEncoder passwordEncoder;

  public Integer insertUserInfo(CustomUserDetails user) throws Exception {
    // 비밀번호 암호화
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    return userAuthDAO.insertUserInfo(user);
  }

  public Integer getUserByEmail(String email) throws Exception {
    return userAuthDAO.getUserByEmail(email);
  }

  @Override
  public CustomUserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
    logger.info("loadUserByUsername START!!!");
    CustomUserDetails user = userAuthDAO.getUserById(userId);

    if (user == null) {
      throw new InternalAuthenticationServiceException(userId + "정보를 찾을 수 없습니다.");
    }
    logger.info("loadUserByUsername END!!!");
    return user;
  }

}

package com.hjlee.home.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hjlee.home.security.Dao.UserDetailsDao;
import com.hjlee.home.security.vo.UserDetailsVO;

public class UserDetailsServiceImpl implements UserDetailsService{
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	@Autowired
	private UserDetailsDao userDetailsDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("loadUserByUsername START!!!");
		logger.info("username:"+username);
		userDetailsDao.getUserById(username);
		logger.info("loadUserByUsername END!!!");
		UserDetailsVO user = userDetailsDao.getUserById(username);

		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		return null;
	}
}
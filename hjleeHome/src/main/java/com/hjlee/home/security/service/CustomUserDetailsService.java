package com.hjlee.home.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hjlee.home.security.dao.UserAuthDAO;
import com.hjlee.home.security.vo.CustomUserDetails;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private UserAuthDAO userAuthDAO;

	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		logger.debug("loadUserByUsername ::::::: 2");
		
		CustomUserDetails user = userAuthDAO.getUserById(username);

		if(user==null) {
			logger.debug("no user :::::::: AuthenticationProvider");
			throw new InternalAuthenticationServiceException(username);
		}

		return user;
	}

}

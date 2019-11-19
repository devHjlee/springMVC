package com.hjlee.home.security;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.hjlee.home.security.service.CustomUserDetailsService;
import com.hjlee.home.security.vo.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

	@Autowired
	private CustomUserDetailsService userDeSer;
	
	//@Autowired
	//private BCryptPasswordEncoder passwordEncoder;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		logger.debug("AuthenticationProvider :::::: 1");
		userDeSer.loadUserByUsername(username);
		CustomUserDetails user = (CustomUserDetails) userDeSer.loadUserByUsername(username);
		
		if(!user.isEnabled()) {
			logger.debug("isEnabled or isCredentialsNonExpired :::::::: false!");
			throw new AuthenticationCredentialsNotFoundException("잠긴 사용자 입니다.");
		}
		
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
		
		logger.debug("AuthenticationProvider loadUserByUsername :::::: 3");
		
/*		if(!passwordEncoder.matches(password, user.getPassword())) {
			logger.debug("matchPassword :::::::: false!");
			throw new BadCredentialsException(username);
		}*/
		if(!password.equals(user.getPassword())) {
			logger.debug("matchPassword :::::::: false!");
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다");
		}
		logger.debug("matchPassword :::::::: true!");

		return new UsernamePasswordAuthenticationToken(username, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}

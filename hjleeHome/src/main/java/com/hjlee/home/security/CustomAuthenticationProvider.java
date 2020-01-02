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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String email = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();

		CustomUserDetails user = (CustomUserDetails) userDeSer.loadUserByUsername(email);

		if(!user.isEnabled()) {
			throw new AuthenticationCredentialsNotFoundException("��� ����� �Դϴ�.");
		}

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();

		if(!passwordEncoder.matches(password, user.getPassword())) {
			throw new BadCredentialsException("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		}

		logger.info("userVO:"+user.toString());
		return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
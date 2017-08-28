package com.books.security;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@EnableWebSecurity
public class UserAuth<HttpSecurity> extends WebMvcConfigurerAdapter {
	public void configure(HttpSecurity httpSecurity) throws Exception {
	
		httpSecurity.authorizeRequests()
					.antMatchers("/").permitAll()
					.antMatchers("/secure/**").authenticated()
					.and().formLogin().permitAll() 
					.and().logout().logoutRequestMatcher(new AntPathMatcher("/logout")).logoutSuccessUrl("/login").permitAll();
	}

	@Autowired
	public void configureGlobal(Authentication auth) throws Exception {
		
		auth.inMemoryAuthentication()
				.withUser("user").password("user").roles("USER"); 
	}
}


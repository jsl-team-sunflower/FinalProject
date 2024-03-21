package com.sunflower.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig {
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	} //password를 암호화 하는 방법
	
	
	@Bean //spring에서 관리할 수 있도록 객체 형태로 하는 것을 의미함
	public HttpFirewall getHttpFirewall() {
	    return new DefaultHttpFirewall();
	}
	
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
				
			// .csrf((csrf) -> csrf .disable())
			//csrf는 웹 보안 조작된 정보로 웹 사이트가 실행되도록 속이는 공격기술
			//스프링 시큐리티는 이러한 공격을 방지하기 위해 CSRF토큰을 발행하여 폼 전송시에 해당 토큰을 함께 전송해야 한다
			
			.authorizeHttpRequests((auth) -> auth
					.requestMatchers("/**")
					.permitAll())
			
			//인증되지 않은 모든 페이지의 요청을 허락한다.
			.formLogin((formLogin) -> formLogin
					.usernameParameter("username") 
					.passwordParameter("password") 
					.loginPage("/login")
					.defaultSuccessUrl("/"))
			//로그인 요청 URL과 로그인 성공시 메인으로 이동한다
			.logout((logout) -> logout
					.logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
					.invalidateHttpSession(true))
			//로그아웃 사용자 URL주소와 로그아웃 성공시 메인으로 이동하고 세션을 제거한다
			;
		
		http.exceptionHandling(authenticationManager -> authenticationManager
                .authenticationEntryPoint(new CustomAuthenticationEntryPoint()));
		
		return http.build();
		}			
					
					
			
			
	
	
}

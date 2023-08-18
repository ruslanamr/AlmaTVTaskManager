package kz.almatv.AlmaTVTaskManager.config;

import kz.almatv.AlmaTVTaskManager.services.impl.UserServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

  @Bean
  public UserServiceImpl userService(){
    return new UserServiceImpl();
  }

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    var authenticationManagerBuilder = http.getSharedObject(AuthenticationManagerBuilder.class);
    authenticationManagerBuilder
        .userDetailsService(userService())
        .passwordEncoder(passwordEncoder());

    http.exceptionHandling(eh -> eh.accessDeniedPage("/accessdenied"));

    http.csrf(AbstractHttpConfigurer::disable);

    http.formLogin(flc -> flc.loginProcessingUrl("/auth")
        .usernameParameter("user_login")
        .passwordParameter("user_password")
        .loginPage("/sign-in")
        .defaultSuccessUrl("/", true)
        .failureUrl("/sign-in?error"));

    http.logout(logout -> logout.logoutUrl("/logout")
        .logoutSuccessUrl("/sign-in"));

    return http.build();
  }
}


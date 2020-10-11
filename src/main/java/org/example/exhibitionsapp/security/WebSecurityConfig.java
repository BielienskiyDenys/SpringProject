package org.example.exhibitionsapp.security;

import org.example.exhibitionsapp.entity.Role;
import org.example.exhibitionsapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;



    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/", "/main", "/registration").permitAll()
                .antMatchers("/admin_base").hasAuthority(Role.ADMIN.getAuthority())
                .antMatchers("/user_base").hasAnyAuthority(Role.ADMIN.getAuthority(), Role.USER.getAuthority())
                //TODO позволить реквесты на сортировку ивентов гостям
//                    .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .successForwardUrl("/main?lang=uk_UA")
                .permitAll()
                .and()
                .logout()
                .permitAll()
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true);
        http
                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/login?expired")
                .maxSessionsPreventsLogin(true).sessionRegistry(sessionRegistry());


    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder);

    }

    @Bean
    public SessionRegistry sessionRegistry() {
        SessionRegistry sessionRegistry = new SessionRegistryImpl();
        return sessionRegistry;
    }


}

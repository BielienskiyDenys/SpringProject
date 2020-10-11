package org.example.exhibitionsapp.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class SecurityWebInitializer extends AbstractSecurityWebApplicationInitializer {
    @Override
    protected boolean enableHttpSessionEventPublisher() {
        return true;
    }
}

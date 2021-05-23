package cn.edu.seu.cose.docmanage.config;

import cn.edu.seu.cose.docmanage.entity.User;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class CommonDataBindConfig {

    @ModelAttribute("currentUser")
    public User bindCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return null;
        return (User) authentication.getPrincipal();
    }

    @ModelAttribute("isAdmin")
    public boolean bindIsAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return false;
        return !((User) authentication.getPrincipal()).getRoles().isEmpty();
    }

}

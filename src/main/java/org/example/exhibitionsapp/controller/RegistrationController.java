package org.example.exhibitionsapp.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.exhibitionsapp.entity.Role;
import org.example.exhibitionsapp.entity.User;
import org.example.exhibitionsapp.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Controller
public class RegistrationController {
    Logger logger = LoggerFactory.getLogger(RegistrationController.class);
    @Autowired
    private UserService userService;

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model, @RequestParam String username, @RequestParam String password, @RequestParam String nameNative, @RequestParam String email, @RequestParam String role, @RequestParam String lang) {
        if(!validate(email)) {
            ControllerUtil.addValueToModelDependsOnLocale(model, "registrationMessage",
                    "Enter correct email, please.",
                    "Введіть корректну електронну адресу.");
            logger.debug("Attemp to register invalid email:" + email);
            return "registration";
        }
        user.setEmail(email);
        user.setNameNative(nameNative);

        user.setRoles(Collections.singleton(Role.valueOf(role)));
        if(userService.addNewUser(user)) {
            logger.info("New user registered: " + user);
            return "redirect:/login?lang="+lang;
        }
        ControllerUtil.addValueToModelDependsOnLocale(model, "registrationMessage",
                "This email is already registered.",
                "Ця поштова адреса вже зареєстрована.");
        logger.debug("Attempt to register user with existing email:" + email);
        return ControllerUtil.urlAppendLocale("registration");

    }

    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

}

package com.github.tangyi.exam.controller;

import com.github.tangyi.common.web.BaseController;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tangyi
 * @date 2018-08-30-21:08
 */
@RestController
public class ExamController extends BaseController {

    @GetMapping("/")
    public Authentication user(Authentication authentication) {
        return authentication;
    }
}

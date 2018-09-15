package com.github.tangyi.user.controller;

import com.github.tangyi.common.exception.CommonException;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.service.UserService;
import com.google.code.kaptcha.Producer;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;

/**
 * 验证码
 *
 * @author tangyi
 * @date 2018-09-14-19:24
 */
@RestController
@RequestMapping(value = "/code")
public class ValidateCodeController extends BaseController {

    @Autowired
    private Producer producer;

    @Autowired
    private UserService userService;

    /**
     * 生成验证码
     *
     * @param random random
     * @author tangyi
     * @date 2018/9/14 20:13
     */
    @GetMapping("/{random}")
    public void produceCode(@PathVariable String random, HttpServletResponse response) throws Exception {
        if (StringUtils.isEmpty(random))
            throw new CommonException("随机码不能为空！");
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        // 生成文字验证码
        String text = producer.createText();
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);
        userService.saveImageCode(random, text);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "JPEG", out);
        IOUtils.closeQuietly(out);
    }
}

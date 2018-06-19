package com.zzuli.controller;

import com.zzuli.service.CatelogService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2017/5/9.
 */
@Controller
public class CatelogController {
    @Resource
    private CatelogService catelogService;

}

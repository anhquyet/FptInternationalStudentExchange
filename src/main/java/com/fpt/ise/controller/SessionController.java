package com.fpt.ise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SessionController {

  @RequestMapping(value = "/")
  public String New() {
    return "/session/new";
  }
}

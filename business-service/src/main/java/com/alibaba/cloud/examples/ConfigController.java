package com.alibaba.cloud.examples;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by forezp on 2019/5/12.
 */

@RestController
@RefreshScope
public class ConfigController {

	@Value("${username:lily}")
	private String username;

	@Value("${mockException:false}")
	private boolean mockException;

	@RequestMapping("/username")
	public String get() {
		return username;
	}

	@RequestMapping("/mockException")
	public boolean getMockException() {
		return mockException;
	}

}
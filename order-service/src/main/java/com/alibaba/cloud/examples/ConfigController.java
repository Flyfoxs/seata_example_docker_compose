package com.alibaba.cloud.examples;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by forezp on 2019/5/12.
 */

@RestController
@RefreshScope
public class ConfigController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ConfigController.class);

	@Autowired
	ApplicationContext context;

	@Value("${username:lily}")
	private String username;

	@Value("${mockException:false}")
	private boolean mockException;

	@RequestMapping("/username")
	public String get() {
		return username;
	}

	@RequestMapping("/mockException")
	public String getMockException() {
		LOGGER.info("mockException:" + mockException);
		Environment env = context.getEnvironment();
		LOGGER.info("env:" + env);

		LOGGER.info("Active:" + String.valueOf(env.getActiveProfiles()));
		LOGGER.info("Default:" + String.valueOf(env.getDefaultProfiles()));

		boolean mockException2 = env.getProperty("mockException", Boolean.class);
		LOGGER.info("mockException from env:" + mockException2);
		return mockException + "," + mockException2;
	}

}
package com.alibaba.cloud.examples;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "test")
public class MockConfiguration {

	private Boolean mockException;

	public Boolean getMockException() {
		return mockException;
	}

	public void setMockException(Boolean mockException) {
		this.mockException = mockException;
	}

}

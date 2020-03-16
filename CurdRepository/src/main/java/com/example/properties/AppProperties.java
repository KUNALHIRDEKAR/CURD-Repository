package com.example.properties;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;

@EnableConfigurationProperties
@ConfigurationProperties(prefix = "formapp")
@Component
public class AppProperties {

	public AppProperties() {
		// TODO Auto-generated constructor stub
	}
	private Map<String,String> msg=new HashMap();
	public Map<String, String> getMsg() {
		return msg;
	}
	public void setMsg(Map<String, String> msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "AppProperties [msg=" + msg + "]";
	}
}

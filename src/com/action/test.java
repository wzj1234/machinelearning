package com.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class test extends ActionSupport {
	
	private List<String> list;
	private List<String> user;
	private String aaa;
	public List<String> getUser() {
		return user;
	}

	public void setUser(List<String> user) {
		this.user = user;
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}
	public String getAaa() {
		return aaa;
	}

	public void setAaa(String aaa) {
		this.aaa = aaa;
	}
	public String execute(){
		System.out.println("come in");
		List<String> list1 = new ArrayList<String>();
		list1.add("sang");
		list1.add("hao");
		this.setAaa("zhelishiaaa");
		this.setList(list1);
		System.out.println(222);
		return "success";
	}
	
}

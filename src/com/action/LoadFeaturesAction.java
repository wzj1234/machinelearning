package com.action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LoadFeaturesAction extends ActionSupport {
	private HashMap<String,Float> map;

	public HashMap<String, Float> getMap() {
		return map;
	}

	public void setMap(HashMap<String, Float> map) {
		this.map = map;
	}
	public String execute(){
		System.out.println("213123");
		HashMap<String,Float> map = new HashMap<String,Float>();
		try {
//			BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\sang\\Desktop\\all_gene"));
			String pythonPath = ServletActionContext.getServletContext().getRealPath("/python");
			BufferedReader br = new BufferedReader(new FileReader(pythonPath+"/all_gene.json"));
			String s = null;
			br.readLine();   //跳过第一行
			while((s = br.readLine()) != null){
				if(s.equals("}")){
					break;
				}
				s = s.replaceAll("\"", "");
				s = s.replaceAll(",", "");
				String a[] = s.split(":");
				String key = a[0];
				Float value = Float.parseFloat(a[1]);
//				System.out.println("key-->"+key+"   value--->"+value);
				map.put(key,value);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("map有多大："+map.size());
		this.setMap(map);
		return SUCCESS;
	}
	
}

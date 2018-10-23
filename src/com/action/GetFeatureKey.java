package com.action;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class GetFeatureKey extends ActionSupport{	
//	HashMap<String,Float> map ; or List<Map<String,Float>> map ;  both will course error
	List<String> map = new ArrayList<String>();
	List<String> keySet = new ArrayList<String>();//存了所有从前端选中的key
	public void setMap(List<String> map) {
		this.map = map;
	}
//	public List<String> getMap() {
//		return map;
//	}
    public String gainFeatureKey(){
    	String pythonPath = ServletActionContext.getServletContext().getRealPath("/python");
        System.out.println("类执行了");
        System.out.println(map.size());
        for(String aMap:map){
//        	System.out.println(aMap);
//        	keySet.add(aMap.split("\\|")[0]);
        	keySet.add(aMap);
        }
        System.out.println(keySet.size());
        try {
        	File f = new File(pythonPath+"/feature_selection");
			BufferedWriter bw = new BufferedWriter(new FileWriter(f));
			for(String line:keySet){
//				System.out.println(line);
				bw.write(line);
				bw.newLine();
			}
			bw.close();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
        
        
//        for(String aKey:keySet){
//        	System.out.println(aKey);
//        }
        System.out.println("class end");
        analysis_features(pythonPath);
        return "getFeatureKey";
	}
	private void analysis_features(String pythonPath) {
		// TODO 自动生成的方法存根
		try {
			System.out.println("pythonPath-->"+pythonPath);
			System.out.println(pythonPath+"/sample_select.py");
			String[] args = new String[]{"python",pythonPath+"/sample_select.py",pythonPath};
//			String a="haha",b="heihei",c="xixi";
//			String[] args = new String[]{"python","E:\\hshs.py",a,b,c};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while((line = in.readLine()) != null){
//                line = decodeUnicode(line);
				System.out.println(line);
			}
			in.close();
			pr.waitFor();
			System.out.println("end");
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
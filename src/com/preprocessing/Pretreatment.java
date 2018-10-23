package com.preprocessing;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Pretreatment {
	public static void pretreat_standardization(String pythonPath){
		try {
			String[] args = new String[]{"python",pythonPath+"/pretreat_standardization.py",pythonPath};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while((line = in.readLine()) != null){
//                line = decodeUnicode(line);
				System.out.println(line);
			}
			in.close();
			pr.waitFor();
			System.out.println("standardization end");
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	public void pretreat_normalize(String pythonPath){
		try {
			String[] args = new String[]{"python",pythonPath+"/pretreat_normalize.py",pythonPath};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while((line = in.readLine()) != null){
				System.out.println(line);
			}
			in.close();
			pr.waitFor();
			System.out.println("normalize end");
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}

package com.action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.preprocessing.Pretreatment;

public class ML_DecisionTree extends ActionSupport {
	private String criterion;
	private String splitter;
	private String max_features;
	private String max_depth;
	private String min_samples_split;
	private String min_samples_leaf;
	private String min_weight_fraction_leaf;
	private String max_leaf_nodes;
	private String persort;
	private String[] pretreatment;
	public List<String> paramlist;
	private List<String> ls;
	
	public String execute(){
		System.out.println("enter ML_DecisionTree Action");
		try {
			paramlist = new ArrayList<String>();
//add all parameters-------------------------------------------------------------------
			paramlist.add(getCriterion());
			paramlist.add(getSplitter());
			paramlist.add(getMax_features());
			paramlist.add(getMax_depth());
			paramlist.add(getMin_samples_split());
			paramlist.add(getMin_samples_leaf());
			paramlist.add(getMin_weight_fraction_leaf());
			paramlist.add(getMax_leaf_nodes());
			paramlist.add(getPersort());
//-------------------------------------------------------------------------------------
			String pythonPath = ServletActionContext.getServletContext().getRealPath("/python");
			//根据pretreatment的值确定进行什么预处理
			if(getPretreatment() != null){
				for(String s:getPretreatment()){
					if(s.equals("standardization")){   //标准化
						new Pretreatment().pretreat_standardization(pythonPath);
					}else if(s.equals("normalization")){   //归一化
						new Pretreatment().pretreat_normalize(pythonPath);
					}
				}
			}
			//进行决策树模型构建
			analysis_features(pythonPath);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
//		System.out.println("criterion-->"+getCriterion());
		
//		System.out.println("splitter-->"+getSplitter());
//		System.out.println("max_features-->"+getMax_features());
//		System.out.println("max_depth-->"+getMax_depth());
//		System.out.println("min_samples_split-->"+getMin_samples_split());
//		System.out.println("min_samples_leaf-->"+getMin_samples_leaf());
//		System.out.println("min_weight_fraction_leaf-->"+getMin_weight_fraction_leaf());
//		System.out.println("max_leaf_nodes-->"+getMax_leaf_nodes());
//		System.out.println("persort-->"+getPersort());
		
//		for(String s:getPretreatment()){
//			System.out.println(s);
//		}
//				
		return SUCCESS;
	}
	private void analysis_features(String pythonPath) {
		// TODO 自动生成的方法存根
		try {
			System.out.println("pythonPath-->"+pythonPath);
			String[] args = new String[]{"python",pythonPath+"/data_ml_tree.py",pythonPath,paramlist.toString()};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			List<String> ls = new ArrayList<String>();
			while((line = in.readLine()) != null){
//                line = decodeUnicode(line);
				ls.add(line);
				//System.out.println(line);
			}
			System.out.println("拿回来的结果");
			for(String s:ls){
				System.out.println(s);
			}
			setLs(ls);
			in.close();
			pr.waitFor();
			System.out.println("analysis_features end");
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	public String getMax_depth() {
		return max_depth;
	}
	public void setMax_depth(String max_depth) {
		this.max_depth = max_depth;
	}
	
	public List<String> getLs() {
		return ls;
	}
	public void setLs(List<String> ls) {
		this.ls = ls;
	}
	public String[] getPretreatment() {
		return pretreatment;
	}
	public void setPretreatment(String[] pretreatment) {
		this.pretreatment = pretreatment;
	}
	public String getSplitter() {
		return splitter;
	}
	public void setSplitter(String splitter) {
		this.splitter = splitter;
	}
	public String getMax_features() {
		return max_features;
	}
	public void setMax_features(String max_features) {
		this.max_features = max_features;
	}
	public String getMin_samples_split() {
		return min_samples_split;
	}
	public void setMin_samples_split(String min_samples_split) {
		this.min_samples_split = min_samples_split;
	}
	public String getMin_samples_leaf() {
		return min_samples_leaf;
	}
	public void setMin_samples_leaf(String min_samples_leaf) {
		this.min_samples_leaf = min_samples_leaf;
	}
	public String getMin_weight_fraction_leaf() {
		return min_weight_fraction_leaf;
	}
	public void setMin_weight_fraction_leaf(String min_weight_fraction_leaf) {
		this.min_weight_fraction_leaf = min_weight_fraction_leaf;
	}
	public String getMax_leaf_nodes() {
		return max_leaf_nodes;
	}
	public void setMax_leaf_nodes(String max_leaf_nodes) {
		this.max_leaf_nodes = max_leaf_nodes;
	}
	public String getPersort() {
		return persort;
	}
	public void setPersort(String persort) {
		this.persort = persort;
	}
	public String getCriterion() {
		return criterion;
	}
	public void setCriterion(String criterion) {
		this.criterion = criterion;
	}
}

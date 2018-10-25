package com.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.*;
import org.apache.struts2.ServletActionContext;

import com.entry.Consequence;
import com.opensymphony.xwork2.ActionSupport;
import com.preprocessing.Pretreatment;

public class SupportVectorMachine extends ActionSupport {
	private String C;
	private String kernel;
	private String degree;
	private String gamma;
	private String coef0;
	private String probability;
	private String shrinking;
	private String tol;
	private String max_iter;
	private String[] pretreatment;
	public List<String> paramlist;
	List<Consequence> consequences = new ArrayList<>();
	private String consequencesJsonStr;
	public String execute(){
		System.out.println("enter SupportVectorMachine");
		try {
			paramlist = new ArrayList<String>();
//add all parameters-------------------------------------------------------------------
			paramlist.add(getC());
			paramlist.add(getKernel());
			paramlist.add(getDegree());
			paramlist.add(getGamma());
			paramlist.add(getCoef0());
			paramlist.add(getProbability());
			paramlist.add(getShrinking());
			paramlist.add(getTol());
			paramlist.add(getMax_iter());
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
			//进行svm模型构建
			analysis_features(pythonPath);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		System.out.println("C->"+getC());
//		System.out.println("kernel->"+getKernel());
//		System.out.println("degree->"+getDegree());
//		System.out.println("gamma->"+getGamma());
//		System.out.println("coef0->"+getCoef0());
//		System.out.println("probability->"+getProbability());
//		System.out.println("shrinking->"+getShrinking());
//		System.out.println("tol->"+getTol());
//		System.out.println("max_iter->"+getMax_iter());
		
		return SUCCESS;
	}
	private void analysis_features(String pythonPath) {
		// TODO 自动生成的方法存根
		try {
			System.out.println("pythonPath-->"+pythonPath);
			String[] args = new String[]{"python",pythonPath+"/data_ml_svm.py",pythonPath,paramlist.toString()};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			int isKeyline = 0;
			Pattern pattern = Pattern.compile("([0-9]\\d*\\.?\\d*)");
			Matcher m;
			while((line = in.readLine()) != null){
//				System.out.println("a python retuen line:"+line);
				if(isKeyline < 2){
					if(line.equals("")){
						isKeyline += 1;
						continue;
					}
					if(isKeyline == 1){
						m=pattern.matcher(line);
						Consequence consequence = new Consequence();
						int tempc = 0;
				        while(m.find()){
				        	tempc++;
				            if(tempc == 1){
				            	consequence.setPrecision(Double.parseDouble(m.group(1)));
				            }
				            if(tempc == 2){
				            	consequence.setRecall(Double.parseDouble(m.group(1)));
				            }
				            if(tempc == 3){
				            	consequence.setFscore(Double.parseDouble(m.group(1)));
				            }
				            if(tempc == 4){
				            	consequence.setSupport(Integer.parseInt(m.group(1)));
				            	tempc = 0;
				            }
				        }
				        consequences.add(consequence);
	 				}
				}
			}
			in.close();
			pr.waitFor();
//			for(Consequence consequence:consequences){
//				System.out.println(consequence.getPrecision() + " " + consequence.getRecall() + " " + consequence.getFscore() + " " + consequence.getSupport());
//			}
		    this.setConsequences(consequences);
			
//			ObjectMapper objectMapper=new ObjectMapper();
//			this.setConsequencesJsonStr(objectMapper.writeValueAsString(consequences));//把后台list转成jsonstring传到前端处理
//			System.out.println(consequencesJsonStr);
			System.out.println("java analysis_features end");
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	public String getC() {
		return C;
	}
	public void setC(String c) {
		C = c;
	}
	public String getKernel() {
		return kernel;
	}
	public void setKernel(String kernel) {
		this.kernel = kernel;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getGamma() {
		return gamma;
	}
	public void setGamma(String gamma) {
		this.gamma = gamma;
	}
	public String getCoef0() {
		return coef0;
	}
	public void setCoef0(String coef0) {
		this.coef0 = coef0;
	}
	public String getProbability() {
		return probability;
	}
	public void setProbability(String probability) {
		this.probability = probability;
	}
	public String getShrinking() {
		return shrinking;
	}
	public void setShrinking(String shrinking) {
		this.shrinking = shrinking;
	}
	public String getTol() {
		return tol;
	}
	public void setTol(String tol) {
		this.tol = tol;
	}
	public String getMax_iter() {
		return max_iter;
	}
	public void setMax_iter(String max_iter) {
		this.max_iter = max_iter;
	}
	public String[] getPretreatment() {
		return pretreatment;
	}
	public void setPretreatment(String[] pretreatment) {
		this.pretreatment = pretreatment;
	}
	public List<Consequence> getConsequences() {
        return consequences;
    }
    public void setConsequences(List<Consequence> consequences) {
        this.consequences = consequences;
    }
	public String getConsequencesJsonStr() {
        return consequencesJsonStr;
    }
    public void setConsequencesJsonStr(String consequencesJsonStr) {
        this.consequencesJsonStr = consequencesJsonStr;
    }
}

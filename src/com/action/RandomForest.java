package com.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;

import com.entry.Consequence;
import com.opensymphony.xwork2.ActionSupport;
import com.preprocessing.Pretreatment;

public class RandomForest extends ActionSupport {
	private String n_estimators;
	private String crite_rion;
	private String max_features;
	private String bootstrap;
	private String oob_score;
	private String n_jobs;
	private String[] pretreatment;
	public List<String> paramlist;
	List<Consequence> consequences = new ArrayList<>();
	public String execute(){
		System.out.println("enter RandomForest");
		try {
			paramlist = new ArrayList<String>();
//add all parameters-------------------------------------------------------------------
			paramlist.add(getN_estimators());
			paramlist.add(getCrite_rion());
			paramlist.add(getMax_features());
			paramlist.add(getBootstrap());
			paramlist.add(getOob_score());
			paramlist.add(getN_jobs());
			for(String s:paramlist){
				System.out.println(s);
			}
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
			
			//进行randomForest模型构建
			analysis_features(pythonPath);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("randomForest end");
		return SUCCESS;
	}
	
	private void analysis_features(String pythonPath) {
		// TODO 自动生成的方法存根
		try {
			System.out.println("pythonPath-->"+pythonPath);
			String[] args = new String[]{"python",pythonPath+"/data_ml_randomForest.py",pythonPath,paramlist.toString()};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			int isKeyline = 0;
			Pattern pattern = Pattern.compile("([0-9]\\d*\\.?\\d*)");
			Matcher m;
			List<String> ls = new ArrayList<String>();
			while((line = in.readLine()) != null){
//                line = decodeUnicode(line);
//				ls.add(line);
				System.out.println(line);
				if(isKeyline < 2){
					if(line.equals("")){
						isKeyline += 1;
						continue;
					}
					if(isKeyline == 1){
//						System.out.println(line);
						m=pattern.matcher(line);
						Consequence consequence = new Consequence();
						int tempc = 0;
				        while(m.find()){
				        	tempc++;
				            if(tempc == 1){
				            	consequence.setTile(replaceSpace(line.split(m.group(1))[0]));
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
//			System.out.println("拿回来的结果");
//			for(String s:ls){
//				System.out.println(s);
//			}
//			setLs(ls);
			in.close();
			pr.waitFor();
			for(Consequence consequence:consequences){
				System.out.println(consequence.getTitle() + " " + consequence.getPrecision() + " " + consequence.getRecall() + " " + consequence.getFscore() + " " + consequence.getSupport());
			}
		    this.setConsequences(consequences);
			System.out.println("analysis_features random forest end");
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	public String replaceSpace(String str) {
		int head = 0;
		int tail = str.length()-1;
		while(head <= tail){
			if(str.charAt(head) != ' '){
				break;
			}
			head++;
		}
		while(tail >= 0){
			if(str.charAt(tail) != ' '){
				break;
			}
			tail--;
		}
		return str.substring(head, tail+1);
	}
	public String[] getPretreatment() {
		return pretreatment;
	}
	public void setPretreatment(String[] pretreatment) {
		this.pretreatment = pretreatment;
	}
	public String getN_estimators() {
		return n_estimators;
	}
	public void setN_estimators(String n_estimators) {
		this.n_estimators = n_estimators;
	}
	public String getCrite_rion() {
		return crite_rion;
	}
	public void setCrite_rion(String crite_rion) {
		this.crite_rion = crite_rion;
	}
	public String getMax_features() {
		return max_features;
	}
	public void setMax_features(String max_features) {
		this.max_features = max_features;
	}
	public String getBootstrap() {
		return bootstrap;
	}
	public void setBootstrap(String bootstrap) {
		this.bootstrap = bootstrap;
	}
	public String getOob_score() {
		return oob_score;
	}
	public void setOob_score(String oob_score) {
		this.oob_score = oob_score;
	}
	public String getN_jobs() {
		return n_jobs;
	}
	public void setN_jobs(String n_jobs) {
		this.n_jobs = n_jobs;
	}
	public List<Consequence> getConsequences() {
        return consequences;
    }
    public void setConsequences(List<Consequence> consequences) {
        this.consequences = consequences;
    }
}

package com.entry;

public class Consequence {
//	precision    recall  f1-score   support
	private double precision;
	private double recall;
	private double fscore;
	private int support;
	public double getPrecision() {
        return precision;
    }
	public void setPrecision(double precision) {
        this.precision = precision;
    }
	public double getRecall() {
        return recall;
    }
	public void setRecall(double recall) {
        this.recall = recall;
    }
	public double getFscore() {
        return fscore;
    }
	public void setFscore(double fscore) {
        this.fscore = fscore;
    }
	public int getSupport() {
        return support;
    }
	public void setSupport(int support) {
        this.support = support;
    }
}
package com.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class StageFileAction extends ActionSupport {
	private File file;
    private String fileFileName;
    private String fileFileContentType;

    private String message = "上传成功";
    
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
//    	System.out.println("设置filefhileName");
        this.fileFileName = fileFileName;
    }

    public String getFileFileContentType() {
        return fileFileContentType;
    }

    public void setFileFileContentType(String fileFileContentType) {
        this.fileFileContentType = fileFileContentType;
    }

    @SuppressWarnings("deprecation")
    @Override
    public String execute() throws Exception {
    	System.out.println("进来了212121");
        
        //String path = ServletActionContext.getRequest().getRealPath("/file");//第一版
        //String path = ServletActionContext.getServletContext().getRealPath("WEB-INF/upload/paydetail");
    	String path = ServletActionContext.getServletContext().getRealPath("/file");
    	String pythonPath = ServletActionContext.getServletContext().getRealPath("/python");
        String ss = null;

        try {
            File f = this.getFile();
            System.out.println("f-->"+f);
            if(f==null){
                message="上传文件为空!!!";
                return ERROR;
            }
            if(this.getFileFileName().endsWith(".exe")){
                message="上传文件格式错误!!!";
                return ERROR;
            }
            FileInputStream inputStream = new FileInputStream(f);
            System.out.println(inputStream.available()+"文件长度");
            System.out.println("path-->"+path);
            System.out.println(getFileFileName());
//            ss = path+"\\" +"111.xlsx";
            ss=path+"/"+getFileFileName();
            FileOutputStream outputStream = new FileOutputStream(ss);
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);
            }
            System.out.println("上传的路径为->"+ss);
            message = ss;
            inputStream.close();
            outputStream.flush();
            outputStream.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            message = "有错误!!!!";
        }
        System.out.println("pythonpath is "+pythonPath);
	    analysisfile(path,pythonPath);
        return SUCCESS;
    }
	private void analysisfile(String path,String pythonPath) {
		try {
			//设置命令行传入参数
			System.out.println("文件名"+getFileFileName());
			String[] args = new String[]{"python",pythonPath+"/stage_data_processing.py",path+ "/" +getFileFileName(),pythonPath};
//			String[] args = new String[]{"python",path+"\\hshs.py",a,c,b};
			Process pr = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
			//	                line = decodeUnicode(line);
			    System.out.println(line);
			}
			in.close();
			pr.waitFor();
			System.out.println("end");
		} 
		 catch (Exception e) {
	            e.printStackTrace();
	    }
		
	}
}

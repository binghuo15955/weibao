package com.yt.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

public class Clear_uselessFile {
	
	public static void clear_images(HttpServletResponse response,List<String> path_list) {
		PrintWriter printWriter = null;
		ArrayList<String> fileNameList = new ArrayList<String>();   
		getAllFileName("C:\\Users\\YT\\eclipse-workspace\\weibao\\src\\main\\webapp\\uploadImg", fileNameList);
		
		if (fileNameList.size() > 0) {//文件夹里有东西
			for (int i = 0; i < fileNameList.size(); i++) {
				String filename  =  fileNameList.get(i);//filename 文件夹中的文件名
				for (int j = 0; j < path_list.size(); j++) {
					String str =	path_list.get(j);
					String[] path_arr  = str.split("uploadImg");
					String path_name=path_arr[path_arr.length-1].substring(1);//path_name  db中的文件名
					if(filename.equals(path_name)) {
						break;
					}else if(j==path_list.size()-1) {
						boolean flag = file.deleteFile("C:\\Users\\YT\\eclipse-workspace\\weibao\\src\\main\\webapp\\uploadImg\\"+filename);
						if(flag==true) {
							System.err.println("成功删除无效文件："+path_name);
							break;
						}
					}else {
						continue;
					}
				}
			}
			try {
				printWriter = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			printWriter.print("清理完成！");
		}else {
			printWriter.print("没有图片文件!"); 
		}
	}

	
	 public static void getAllFileName(String path,ArrayList<String> fileNameList) {
	        //ArrayList<String> files = new ArrayList<String>();
	        boolean flag = false;
	        File file = new File(path);
	        File[] tempList = file.listFiles();

	        for (int i = 0; i < tempList.length; i++) {
	            if (tempList[i].isFile()) {
	                fileNameList.add(tempList[i].getName());
	            }
	            if (tempList[i].isDirectory()) {
	                getAllFileName(tempList[i].getAbsolutePath(),fileNameList);
	            }
	        }
	        return;
	    }
}

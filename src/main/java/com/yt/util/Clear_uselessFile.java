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
		
		if (fileNameList.size() > 0) {//�ļ������ж���
			for (int i = 0; i < fileNameList.size(); i++) {
				String filename  =  fileNameList.get(i);//filename �ļ����е��ļ���
				for (int j = 0; j < path_list.size(); j++) {
					String str =	path_list.get(j);
					String[] path_arr  = str.split("uploadImg");
					String path_name=path_arr[path_arr.length-1].substring(1);//path_name  db�е��ļ���
					if(filename.equals(path_name)) {
						break;
					}else if(j==path_list.size()-1) {
						boolean flag = file.deleteFile("C:\\Users\\YT\\eclipse-workspace\\weibao\\src\\main\\webapp\\uploadImg\\"+filename);
						if(flag==true) {
							System.err.println("�ɹ�ɾ����Ч�ļ���"+path_name);
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
			printWriter.print("������ɣ�");
		}else {
			printWriter.print("û��ͼƬ�ļ�!"); 
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

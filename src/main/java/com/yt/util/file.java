package com.yt.util;

import java.io.File;

public class file {
	/**
	 * 传入地址即可删除本地文件
	 * @param pathname
	 * @return
	 */
	public static boolean deleteFile(String pathname){
		boolean result = false;
		File file = new File(pathname);
		if (file.exists()) {
			file.delete();
			result = true;
			System.err.println("文件"+pathname+"成功删除！");
		}
		return result;
	}
}

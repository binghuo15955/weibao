package com.yt.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

import com.alibaba.fastjson.JSON;

public class renderData {

	/**
	 * ͨ��PrintWriter����Ӧ����д��response,ajax���Խ��ܵ��������
	 * 
	 * @param response
	 * @param data
	 */
	public static void render_Data(HttpServletResponse response, ModelMap model) {
		PrintWriter printWriter = null;
		String jsonResult = JSON.toJSONString(model);
		response.setContentType("text/html;charset=UTF-8");
		try {
			printWriter = response.getWriter();
			printWriter.print(jsonResult);
		} catch (IOException ex) {
		} finally {
			if (null != printWriter) {
				printWriter.flush();
				printWriter.close();
			}
		}
	}
}

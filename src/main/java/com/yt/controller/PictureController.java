package com.yt.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.service.impl.PictureServiceImpl;
import com.yt.util.Clear_uselessFile;

@Controller
@RequestMapping("picture")
public class PictureController {

	@Autowired
	private PictureServiceImpl pictureService;
	
	@RequestMapping("clearUselessImgs")
	@ResponseBody
	public void clear(HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		Clear_uselessFile.clear_images(response, pictureService.getAllurl());
	}
}

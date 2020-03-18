package com.yt.controller;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java_websocket.WebSocket;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.yt.entity.Block;
import com.yt.service.impl.BlockChainServiceImpl;
import com.yt.service.impl.P2PServiceImpl;
import com.yt.util.initWebSocketServer;
import com.yt.util.renderData;

@Controller
@RequestMapping("blockchain")
public class BlockChainController {

	private P2PServiceImpl p2pService = initWebSocketServer.getP2pService();
	private BlockChainServiceImpl blockChain = initWebSocketServer.getBlockService();

	@RequestMapping("blocks")
	@ResponseBody
	public void Blocks(HttpServletResponse response, ModelMap model) {

		List<Block> blocks = blockChain.getBlockChain();
		model.put("data", blocks);
		model.put("msg", "");
		model.put("status", 0);
		model.put("count", blocks.size());
		renderData.render_Data(response, model);

		/*
		 * response.setCharacterEncoding("utf-8"); try {
		 * response.getWriter().println(JSON.toJSONString(blockChain.getBlockChain()));
		 * } catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
	}

	@RequestMapping("mineBlock")
	@ResponseBody
	public void MineBlock(HttpServletRequest request, HttpServletResponse response, String data) {
		response.setCharacterEncoding("utf-8");
		Block newBlock = blockChain.generateNextBlock(data);// 鐢熸垚涓�涓柊鍖哄揩
		blockChain.addBlock(newBlock);// 娣诲姞杩涘尯鍧楅摼涓�
		p2pService.broatcast(p2pService.responseLatestMsg());// 灏嗘坊鍔犲畬鎴愮殑鍖哄潡閾惧箍鎾埌杩炴帴鑺傜偣
		String newBlockmsg = JSON.toJSONString(newBlock);
		newBlockmsg = newBlockmsg.replaceAll("-", "");
		System.err.println("block added: " + newBlockmsg);
		try {
			response.getWriter().print(newBlockmsg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	@RequestMapping("addPeer")
	@ResponseBody
	public void AddPeer(String peer, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		p2pService.connectToPeer(peer);
		try {
			response.getWriter().print(JSON.toJSONString("杩炴帴鍒�" + peer + "鑺傜偣鎴愬姛锛�"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("peers")
	@ResponseBody
	public void Peers(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		List<Map<String, String>> wsList = new ArrayList<Map<String, String>>();

		for (WebSocket socket : p2pService.getSockets()) {
			InetSocketAddress remoteSocketAddress = socket.getRemoteSocketAddress();
			Map<String, String> wsMap = new HashMap<String, String>();
			wsMap.put("remoteHost", remoteSocketAddress.getHostName());
			wsMap.put("remotePort", remoteSocketAddress.getPort() + "");
			wsList.add(wsMap);
			// resp.getWriter().print(remoteSocketAddress.getHostName() + ":" +
			// remoteSocketAddress.getPort());
		}
		try {
			response.getWriter().print(JSON.toJSONString(wsList));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

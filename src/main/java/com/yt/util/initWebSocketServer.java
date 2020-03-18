package com.yt.util;

import com.yt.service.impl.BlockChainServiceImpl;
import com.yt.service.impl.P2PServiceImpl;

public class initWebSocketServer {
	
	 static P2PServiceImpl p2pService;
	
	 static BlockChainServiceImpl blockService;
	
    static{
    	blockService=new BlockChainServiceImpl();
    	p2pService= new P2PServiceImpl(blockService);
    	p2pService.initP2PServer(7001);
    	System.err.println("开始监听WebSocket服务端口:"+7001);
	}


	public static P2PServiceImpl getP2pService() {
		return p2pService;
	}


	public static void setP2pService(P2PServiceImpl p2pService) {
		initWebSocketServer.p2pService = p2pService;
	}


	public static BlockChainServiceImpl getBlockService() {
		return blockService;
	}


	public static void setBlockService(BlockChainServiceImpl blockService) {
		initWebSocketServer.blockService = blockService;
	}
    
    

}

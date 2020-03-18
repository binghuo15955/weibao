package com.yt.service.impl;

import java.net.InetSocketAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.java_websocket.WebSocket;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.handshake.ServerHandshake;
import org.java_websocket.server.WebSocketServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.yt.entity.Block;
import com.yt.entity.Constant;
import com.yt.entity.Message;


@Service("p2pService")
public class P2PServiceImpl {
	
	@Autowired
	private BlockChainServiceImpl blockChain;
	private List<WebSocket> sockets;
	
    
    /**
     * p2p服务初始化
     * @param blockService
     */
    public P2PServiceImpl(BlockChainServiceImpl blockService) {
        this.blockChain = blockService;
        this.sockets = new ArrayList<WebSocket>();
    } 
    
    /**
     * 初始化websoket服务
     * @param port
     */
    public void initP2PServer(int port) {
    	/**
    	 * webSoketServer 初始化
    	 */
        final WebSocketServer socket = new WebSocketServer(new InetSocketAddress(port)) {
        	 /**
        	  * 连接打开
        	  */
        	 public void onOpen(WebSocket webSocket, ClientHandshake clientHandshake) {
                 write(webSocket, queryChainLatestMsg());
        		 System.err.println("服务端节点--->onOpen同意建立连接("+port+")");
                 sockets.add(webSocket);
             }
        	 /**
        	  * 连接关闭
        	  */
             public void onClose(WebSocket webSocket, int i, String s, boolean b) {
                 System.err.println("服务器端与节点关闭连接connection closed to peer:" + webSocket.getRemoteSocketAddress());
                 sockets.remove(webSocket);
             }
             /**
              * 连接接收消息
              */
             public void onMessage(WebSocket webSocket, String s) {
            	System.err.println("服务端接收到消息并通过onMessage处理--->"+s);
                handleMessage(webSocket, s);
            	//write(webSocket, "节点"+port+"发送消息出去"); 
             }
             /**
              * 容错，异常处理
              */
             public void onError(WebSocket webSocket, Exception e) {
          //       System.err.println("服务端与节点连接出错 connection failed to peer:" + webSocket.getRemoteSocketAddress());
                 sockets.remove(webSocket);
             }
             /**
              * 连接开始
              */
             public void onStart() {
            	 System.err.println(port+"服务初始化执行-->onStart.....");
             }
        };
        //soket启动
        socket.start();
        System.out.println("listening websocket p2p port on: " + port);
    }
    
   

    public void connectToPeer(String peer) {
        try {
            final WebSocketClient socket = new WebSocketClient(new URI(peer)) {
                /**
                 * 连接打开
                 */
            	@Override
                public void onOpen(ServerHandshake serverHandshake) {
            		System.out.println("客户端节点-->onOpen接收握手回复，成功建立连接！");
                    write(this, queryChainLatestMsg());
                	//write(this,"成功连接对方节点"+peer);
                    sockets.add(this);
                }
            	/**
            	 * 处理服务器端给我返回的消息
            	 */
                @Override
                public void onMessage(String s) {
                	System.out.println("服务器端"+peer+"节点发来的消息--->"+s);
                    handleMessage(this, s);
                }
                /**
                 * 连接关闭
                 */
                @Override
                public void onClose(int i, String s, boolean b) {
                    System.out.println("与服务器端"+peer+"节点的连接关闭  -->connection closed");
                    sockets.remove(this);
                }
                /**
                 * 异常处理
                 */
                @Override
                public void onError(Exception e) {
                    System.out.println("与服务端"+peer+"节点连接失败！connection failed");
                    sockets.remove(this);
                }
            };
            socket.connect();
        } catch (URISyntaxException e) {
            System.out.println("p2p connect is error:" + e.getMessage());
        }
    }

    private void write(WebSocket ws, String message) {
        ws.send(message);
    }

    private String queryChainLatestMsg() {
        return JSON.toJSONString(new Message(Constant.QUERY_LATEST));
    }
    /**
     * 消息处理
     * @param webSocket
     * @param s
     */
    private void handleMessage(WebSocket webSocket, String s) {
        try {
        	System.out.println(s);
            Message message = JSON.parseObject(s, Message.class);
            System.out.println("Received message" + JSON.toJSONString(message));
            switch (message.getType()) {
                case Constant.QUERY_LATEST:
                    write(webSocket, responseLatestMsg());
                    break;
                case Constant.QUERY_ALL:
                    write(webSocket, responseChainMsg());
                    break;
                case Constant.RESPONSE_BLOCKCHAIN:
                    handleBlockChainResponse(message.getData());
                    break;
            }
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println("hanle message is error:" + e.getMessage());
        }
    }
    
    public String responseLatestMsg() {
        Block[] blocks = {blockChain.getLatestBlock()};
        return JSON.toJSONString(new Message(Constant.RESPONSE_BLOCKCHAIN, JSON.toJSONString(blocks)));
    }
    
    
    private void handleBlockChainResponse(String message) {
        List<Block> receiveBlockChain = JSON.parseArray(message, Block.class);
        Collections.sort(receiveBlockChain, new Comparator<Block>() {
            public int compare(Block o1, Block o2) {
                return o1.getIndex() - o1.getIndex();
            }
        });
        /**
         * peer2 返回的一个最新区块链的数据
         */
        Block latestBlockReceived = receiveBlockChain.get(receiveBlockChain.size() - 1);
        /**
         * 本节点的最新的区块数据
         */
        Block latestBlock = blockChain.getLatestBlock();
        /**
         * 比较我请求回来的最新区块，是否大于我本地的最新区块的索引值
         */
        if (latestBlockReceived.getIndex() > latestBlock.getIndex()) {
            /**
             * 判断我本地的最新区块的hash值，是否是我请求回来最新区块的前置hash
             */
        	if (latestBlock.getHash().equals(latestBlockReceived.getPreviousHash())) {
            	
                System.out.println("We can append the received block to our chain");
                /**
                 * 把最新区块添加到我本地区块
                 */
                blockChain.addBlock(latestBlockReceived);
                /**
                 * 广播出去，连接我的节点的节点
                 */
                broatcast(responseLatestMsg());
            }else if (receiveBlockChain.size() == 1) {
                System.out.println("We have to query the chain from our peer");
                /**
                 * 请求过来的最新区块链的长度为1且不符合上一个条件
                 */
                broatcast(queryAllMsg());
            } else {
            	/**
            	 * 接收整个区块链的数据，并替换本地链，最长链机制的p2p核心逻辑
            	 */
            	blockChain.replaceChain(receiveBlockChain);
            }
        } else {
            System.out.println("received blockchain is not longer than received blockchain. Do nothing");
        }
    }
    
    public void broatcast(String message) {
        for (WebSocket socket : sockets) {
        	System.err.println("发送我的最新区块到节点"+socket.getLocalSocketAddress()+socket.getRemoteSocketAddress());
            this.write(socket, message);
        }
    }
    
    private String queryAllMsg() {
        return JSON.toJSONString(new Message(Constant.QUERY_ALL));
    }
    private String responseChainMsg() {
        return JSON.toJSONString(new Message(Constant.RESPONSE_BLOCKCHAIN, JSON.toJSONString(blockChain.getBlockChain())));
    }
    
    public List<WebSocket> getSockets() {
        return sockets;
    }
  
}

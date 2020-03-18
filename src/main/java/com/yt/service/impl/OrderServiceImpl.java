package com.yt.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.yt.entity.Block;
import com.yt.entity.Blockchain;
import com.yt.entity.Order;
import com.yt.entity.Product;
import com.yt.mapper.OrderMapper;
import com.yt.mapper.ProductMapper;
import com.yt.util.initWebSocketServer;

@Service("orderService")
public class OrderServiceImpl {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private Blocks_orderServiceImpl blocks_orderService;

	private BlockChainServiceImpl blockChain = initWebSocketServer.getBlockService();

	private P2PServiceImpl p2pService = initWebSocketServer.getP2pService();

	public boolean insertSelective(Order order) {
		try {
			LocalDateTime time = LocalDateTime.now();
			order.setTime(time);
			order.setStatus("1");
			if (order.getP_name() != null && !"".equals(order.getP_name()) && order.getSeller_name() != null
					&& !"".equals(order.getSeller_name()) && order.getCategory() != null
					&& !"".equals(order.getCategory())) {
				String pname = order.getP_name();
				String sellername = order.getSeller_name();
				String category = order.getCategory();
				order.setCategory(URLDecoder.decode(category, "utf-8"));
				order.setP_name(URLDecoder.decode(pname, "utf-8"));
				order.setSeller_name(URLDecoder.decode(sellername, "utf-8"));
			}
			int row = orderMapper.insertSelective(order);
			if (row > 0) {
				Product product = new Product();
				product.setId(order.getPid());
				product.setQuality(order.getQuantity());
				row = productMapper.updateQuantityByPrimaryKey(order.getPid(), order.getQuantity());
				if (row > 0) {
					String data = JSON.toJSONString(order);
					List<Blockchain> blockchains = blocks_orderService.getall();
					List<Block> blocks = new ArrayList<>();
					if (blockchains != null && blockchains.size() > 0) {
						for (int i = 0; i < blockchains.size(); i++) {
							Block block = new Block();
							Blockchain bc = blockchains.get(i);
							block.setData(bc.getData());
							block.setHash(bc.getHash());
							block.setIndex(bc.getIndex());
							block.setNonce(bc.getNonce());
							block.setPreviousHash(bc.getPreviousHash());
							block.setTimestamp(bc.getTimestamp());
							blocks.add(block);
						}
					}
					blockChain.replaceChain(blocks);
					Block newBlock = blockChain.generateNextBlock(data);// 生成新的区块
					blockChain.addBlock(newBlock);// 将新区块加入区块链
					p2pService.broatcast(p2pService.responseLatestMsg());// 广播最新区快
					String newBlockmsg = JSON.toJSONString(newBlock);
					System.err.println("block added: " + newBlockmsg);
					if (blocks_orderService.add(order, newBlock)) {
						return true;
					}
					return false;
				} else {
					return false;
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}

	public boolean setStatus2three(String oid) {
		Order order = new Order();
		order.setOid(oid);
		order.setStatus("3");
		int row = orderMapper.updateByPrimaryKeySelective(order);
		if (row > 0) {
			return true;
		}
		return false;
	}

	public List<Order> selectByBuyer_id(int buyer_id, String page1, String limit) {
		if (page1 != null && !"".equals(page1) && limit != null && !"".equals(limit)) {
			int page2 = (Integer.parseInt(page1) - 1) * Integer.parseInt(limit);
			String page = String.valueOf(page2);
			List<Order> orders = orderMapper.selectByBuyer_id(buyer_id, page, limit);
			/*
			 * for (int i = 0; i < orders.size(); i++) { LocalDateTime time =
			 * orders.get(i).getTime(); DateTimeFormatter dtf =
			 * DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); String localTime =
			 * dtf.format(time); orders.get(i).setTime(local); }
			 */
			return orders;
		}
		return null;

	}

	public int countByBuyer_id(int buyer_id) {
		return orderMapper.countByBuyer_id(buyer_id);
	}

	public boolean delByoid(String oid) {
		int row = orderMapper.deleteByPrimaryKey(oid);
		if (row > 0) {
			return true;
		}
		return false;
	}

	public List<Order> getByMany(String p_name, String oid, String start_time, String end_time, String status,
			String seller_name, int seller_id, String page1, String limit) {
		int page2 = (Integer.parseInt(page1) - 1) * Integer.parseInt(limit);
		String page = String.valueOf(page2);
		return orderMapper.selectByMany(p_name, oid, start_time, end_time, status, seller_name,seller_id, page, limit);
	}

	public int countByMany(String p_name, String oid, String start_time, String end_time, String status,
			String seller_name, int seller_id) {
		return orderMapper.countByMany(p_name, oid, start_time, end_time, status, seller_name,seller_id);
	}

	public Order getByOid(String oid) {
		return orderMapper.selectByPrimaryKey(oid);
	}

	public List<Order> getAll(String page, String limit) {
		int page1 = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
		String page2 = String.valueOf(page1);
		return orderMapper.selectAll(page2, limit);
	}

	public int countAll() {
		return orderMapper.countAll();
	}

	public List<String> getAllorderByCategory() {
		return orderMapper.selectAllorderByCategory();
	}

	public List<String> getAllorderByBuyer_name() {
		return orderMapper.selectAllorderByBuyer_name();
	}

	public List<String> getAllorderBySeller_name() {
		return orderMapper.selectAllorderBySeller_name();
	}


}

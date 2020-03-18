package com.yt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Block;
import com.yt.entity.Blockchain;
import com.yt.entity.Order;
import com.yt.mapper.BlockchainMapper;

@Service("blocks_orderService")
public class Blocks_orderServiceImpl {
	
    @Autowired
    private BlockchainMapper blockchainMapper;
    
/*    public boolean add_all(List<Block> blocks) {
    	
    	blockchainMapper.insertMany(blockchains);
    }*/
    
    public List<Blockchain> getall(){
    	return blockchainMapper.selectAll();
    };
    
    public boolean add(Order order,Block block) {
    	Blockchain bc=new Blockchain();
    	bc.setAddress(order.getAddress());
    	bc.setBuyer_id(order.getBuyer_id());
    	bc.setBuyer_name(order.getBuyer_name());
    	bc.setDelivery(order.getDelivery());
    	bc.setOid(order.getOid());
    	bc.setP_name(order.getP_name());
    	bc.setP_pictrue(order.getP_pictrue());
    	bc.setTotal(order.getTotal());
    	bc.setTime(order.getTime());
    	bc.setTelephone(order.getTelephone());
    	bc.setSeller_name(order.getSeller_name());
    	bc.setSeller_id(order.getSeller_id());
    	bc.setQuantity(order.getQuantity());
    	bc.setPid(order.getPid());
    	bc.setPrice(order.getPrice());
    	bc.setStatus(order.getStatus());
    	bc.setTimestamp(block.getTimestamp());
    	bc.setPreviousHash(block.getPreviousHash());
    	bc.setHash(block.getHash());
    	bc.setIndex(block.getIndex());
    	bc.setNonce(block.getNonce());
    	bc.setData(block.getData());
    
    	int row = blockchainMapper.insert(bc);
    	if(row>0) {
    		return true;
    	}
		return false;
    }

    public List<Order> getByMany(String p_name, String oid, String start_time, String end_time, String status,
			String seller_name, String page1, String limit) {
		int page2 = (Integer.parseInt(page1) - 1) * Integer.parseInt(limit);
		String page = String.valueOf(page2);
		return blockchainMapper.selectByMany(p_name, oid, start_time, end_time, status, seller_name, page, limit);
	}

	public int countByMany(String p_name, String oid, String start_time, String end_time, String status,
			String seller_name) {
		return blockchainMapper.countByMany(p_name, oid, start_time, end_time, status, seller_name);
	}

	public List<Order> getAll(String page, String limit) {
		int page1 = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
		String page2 = String.valueOf(page1);
		return blockchainMapper.selectAlluesPage(page2, limit);
	}

	public int countAll() {
		return blockchainMapper.countAll();
	}
}

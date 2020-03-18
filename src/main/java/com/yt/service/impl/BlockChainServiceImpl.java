package com.yt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.yt.entity.Block;
import com.yt.util.CryptoUtil;

@Service("blockChain")
public class BlockChainServiceImpl {
	/**
	 * 区块链定义 其实就是一个list
	 */
	private List<Block> blockChain;

	/**
	 * 区块链服务 1、初始化blockchain 2、区块链加入创世区块
	 */
	public BlockChainServiceImpl() {
		this.blockChain = new ArrayList<Block>();
		blockChain.add(this.getFristBlock());
	}

	/**
	 * 生成下一个区块
	 * 
	 * @param blockData
	 * @return Block
	 */
	public Block generateNextBlock(String blockData) {
		// 获得前一个区块
		Block previousBlock = this.getLatestBlock();
		Block newBlock = new Block();
		// 区块的索引加1
		int nextIndex = previousBlock.getIndex() + 1;
		// 现在的时间戳
		long nextTimestamp = System.currentTimeMillis();
		// long nextTimestamp = 1521339156921l;
		// 计算hash值
		// String nextHash = calculateHash(nextIndex, previousBlock.getHash(),
		// nextTimestamp, blockData);
		// return new Block(nextIndex, previousBlock.getHash(), nextTimestamp,
		// blockData, nextHash);
		long nonce = 0;
		calculateIncludeNonceHash(nextIndex, previousBlock.getHash(), nextTimestamp, blockData, nonce, newBlock);
		// 返回生成的新区块
		System.err.println("newBlock:" + JSON.toJSONString(newBlock));
		return newBlock;
	}

	/**
	 * 获取最后一个区块
	 * 
	 * @return 返回区块内容
	 */
	public Block getLatestBlock() {
		return blockChain.get(blockChain.size() - 1);
	}

	/**
	 * while循环创建
	 * 
	 * @param index
	 * @param previousHash
	 * @param timestamp
	 * @param data
	 * @param nonce
	 * @param newBlock
	 * @return
	 */
	private String calculateIncludeNonceHash(int index, String previousHash, long timestamp, String data, long nonce,
			Block newBlock) {
		String str = index + previousHash + timestamp + data + nonce;
		String hash = CryptoUtil.getSHA256(str);
		nonce=0;
		do {
			nonce = nonce + 1;
			System.err.println("nonce:" + nonce);
			str = index + previousHash + timestamp + data + nonce;
			hash = CryptoUtil.getSHA256(str);
			if (isValidHashDifficulty(hash)) {
				newBlock.setData(data);
				newBlock.setHash(hash);
				newBlock.setIndex(index);
				newBlock.setNonce(nonce);
				newBlock.setPreviousHash(previousHash);
				newBlock.setTimestamp(timestamp);
			}

		} while (!isValidHashDifficulty(hash));

		return hash;
	}

	/**
	 * 检测是否符合难度要求，挖矿操作
	 * 
	 * @param hash
	 * @return
	 */
	private boolean isValidHashDifficulty(String hash) {
		int dificutty = 4;
		char zero = '0';
		int i;
		for (i = 0; i < hash.length(); i++) {
			char ichar = hash.charAt(i);
			if (ichar != zero) {
				break;
			}
		}
		return i >= dificutty;
	}

	/**
	 * 获取-创世区块
	 * 
	 * @return
	 */
	private Block getFristBlock() {
		Block newBlock = new Block();
		//calculateIncludeNonceHash(1, "0", 1583410194, "GENESIS Block", 0, newBlock);
		//return newBlock;
		 return new Block(1, "0", 1583410194, "GENESIS Block",
		 "000032d80b224bb73f8eae363892b9bf08a01766d41a4e54fd66fe39846f5018",20633);
	}

	/**
	 * 添加区块
	 * 
	 * @param newBlock
	 */
	public void addBlock(Block newBlock) {
		if (isValidNewBlock(newBlock, getLatestBlock())) {
			blockChain.add(newBlock);
		}
	}

	/**
	 * 共识算法（最基本的共识算法，也就是说符合这四个条件的都能加入到区块链中） 检查区块是否新区块
	 * 
	 * @param newBlock
	 * @param previousBlock
	 * @return true/false
	 */
	private boolean isValidNewBlock(Block newBlock, Block previousBlock) {

		if (previousBlock.getIndex() + 1 != newBlock.getIndex()) {// 1、前一个区块的索引加1不等于新区块
			System.err.println(newBlock.getIndex());
			System.out.println("invalid index");
			return false;
		} else if (!previousBlock.getHash().equals(newBlock.getPreviousHash())) {// 前一个区块的hash不等于新区块中存储的前一个区块的hash
			System.out.println("invalid previoushash");
			return false;
		} else {
			// 计算hash
			// String hash = calculateHash(newBlock.getIndex(), newBlock.getPreviousHash(),
			// newBlock.getTimestamp(),
			// newBlock.getData());
			String hash = calculateIncludeNonceHash(newBlock.getIndex(), newBlock.getPreviousHash(),
					newBlock.getTimestamp(), newBlock.getData(), newBlock.getNonce(), newBlock);
			// 如果hash和计算后的hash不相等
			if (!hash.equals(newBlock.getHash())) {
				System.out.println("invalid hash: " + hash + " " + newBlock.getHash());
				return false;
			}
		}
		return true;
	}

	/**
	 * 2个节点： 1 区块链长度 100 2 区块链长度 101 新区块链替换成+1的区块链
	 * 
	 * @param newBlockChain
	 */
	public void replaceChain(List<Block> newBlockChain) {
		// 如果新区块链合法并且新区块链的长度大于现有区块链的长度，则替换
		if (isValidBlocks(newBlockChain) && newBlockChain.size() > blockChain.size()) {
			blockChain = newBlockChain;
		} else {
			System.out.println("Received blockchain invalid");
		}
	}

	/**
	 * 验证区块链是否合法
	 * 
	 * @param newBlocks
	 * @return true/false
	 */
	private boolean isValidBlocks(List<Block> newBlocks) {
		// 获得第一个区块链
		Block fristBlock = newBlocks.get(0);
		// 判断第一个区块是否是创世区块
		if (fristBlock.equals(getFristBlock())) {
			//return false;
			return true;
		}
		// 循环每个验证区块是否合法
		for (int i = 1; i < newBlocks.size(); i++) {
			if (isValidNewBlock(newBlocks.get(i), fristBlock)) {
				fristBlock = newBlocks.get(i);
			} else {
				return false;
			}
		}
		return true;
	}

	/**
	 * 获得区块链
	 * 
	 * @return
	 */
	public List<Block> getBlockChain() {
		return blockChain;
	}

	public void setBlockChain(List<Block> blockChain) {
		this.blockChain = blockChain;
	}

}

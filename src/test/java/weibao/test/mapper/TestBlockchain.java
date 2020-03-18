package weibao.test.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.Blockchain;
import com.yt.mapper.BlockchainMapper;

import weibao.test.TestCase;

public class TestBlockchain extends TestCase {
	
	@Autowired
	private BlockchainMapper BlockchainMapper;

	@Test
	public void Test_selectAll() {
		BlockchainMapper.selectAll();
	}
	
	@Test
	public void Test_add() {
		Blockchain bc=new Blockchain();
		bc.setIndex(1);
		bc.setData("GENESIS Block");
		bc.setNonce((long) 20633);
		bc.setPreviousHash("0");
		bc.setHash("000032d80b224bb73f8eae363892b9bf08a01766d41a4e54fd66fe39846f5018");
		bc.setTimestamp((long)1583410194);
		BlockchainMapper.insert(bc);
	}


}

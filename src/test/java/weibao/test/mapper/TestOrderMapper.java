package weibao.test.mapper;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.Order;
import com.yt.mapper.OrderMapper;

import weibao.test.TestCase;

public class TestOrderMapper extends TestCase {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Test
	public void Test_add() {
		Order order = new Order();
		LocalDateTime time = LocalDateTime.now();
		order.setOid(UUID.randomUUID().toString().replace("-", ""));
		order.setTime(time);
		order.setStatus("1");
		order.setP_pictrue("123");
		orderMapper.insertSelective(order);
	}

	@Test
	public void Test_categoryTOP5() {
		List<String> list=orderMapper.selectAllorderByCategory();
		System.err.println(list);
	}
}

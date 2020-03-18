package weibao.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.CategoryCount;
import com.yt.entity.Product;
import com.yt.service.impl.ShopServiceImpl;

import weibao.test.TestCase;

public class TestShopService extends TestCase{
	
	@Autowired
	private ShopServiceImpl shopService;
	
	@Test
	public void Test_selectbyName() {
		List<Product> products = shopService.selectByName("", "1", "12");
		for (int i = 0; i < products.size(); i++) {
			System.err.println("²úÆ·±àºÅ["+products.get(i).getId()+"]:"+products.get(i).getPictureSet());
		}
	}
	
	@Test
	public void Test_countbyCategory() {
		List<CategoryCount> list = shopService.countCategory();
		for (int i = 0; i < list.size(); i++) {
			CategoryCount cc = list.get(i);
			System.err.println(cc.getCategory()+":"+cc.getCount());
		}
	}
	
	@Test
	public void Test_selectbyCategory() {
		String category = "";
		String page = "1";
		String limit ="12";
		List<Product> products = shopService.selectByCategory(category, page,limit);
		System.err.println(products.size());
		System.err.println(shopService.countByCategory(category));
	}
	
	
	@Test
	public void Test_selectByCondition() {
		Map<String, String> kw = new HashMap<String, String>();
		//kw.put("category", "");
		kw.put("name", "");
		String condition = "credit";
		String price = "down";
		String page = "1";
		String limit = "12";
//		List<Product> products = shopService.selectByCondition(kw, condition, price, page, limit);
//		for (Product product : products) {
//			System.out.println(product.getName()+":"+product.getU_credit());
//		}
//		System.err.println(shopService.countByCondition(kw));
	}

}

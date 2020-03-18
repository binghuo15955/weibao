package com.yt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Address;
import com.yt.mapper.AddressMapper;

@Service("addressService")
public class AddressServiceImpl {
	
	@Autowired
	private AddressMapper addressMapper;
	
	public boolean set_default(String aid1,int uid) {
		int aid=Integer.parseInt(aid1);
		int row = addressMapper.cancel_alldefault(uid);
		if(row>0) {
			row = addressMapper.set_default(aid);
		}
		if(row>0) {
			return true;
		}
		return false;
	}

	public List<Address> selectAllByUid(int uid) {
		List<Address> addresses = addressMapper.selectAllByUid(uid);
		return addresses;
	}
	
	public boolean add_address(Address address, String province, String city, String area, int uid) {
		String place = province+"-"+city+"-"+area;
		address.setAddress(place);
		address.setUid(uid);
		int row = addressMapper.insert(address);
		if(row>0) {
			return true;
		}
		return false;
	}

	public Address getByaid(String aid1) {
		int aid = Integer.parseInt(aid1);
		return addressMapper.selectByPrimaryKey(aid);
	}

	public boolean upt_address(Address address, String id, String key, String value) {
		if(id!=null&& !"".equals(id) && key!=null && !"".equals(key) && value!=null && !"".equals(value)) {
			address.setAid(Integer.parseInt(id));
			switch (key) {
			case "receive_name":
				address.setReceive_name(value);
				break;
			case "detail":
				address.setDetail(value);
				break;
			case "postcode":
				address.setPostcode(value);
				break;
			case "telephone":
				address.setTelephone(value);
				break;
			default:
				break;
			}
		}
		int row = addressMapper.updateByPrimaryKeySelective(address);
		if(row>0) {
			return true;
		}
		return false;
	}

	public boolean del_address(String aid1) {
		int aid = Integer.parseInt(aid1);
		int row = addressMapper.deleteByPrimaryKey(aid);
		if(row>0) {
			return true;
		}
		return false;
	}

	public Address get_default(int uid) {
		if(addressMapper.get_default(uid)!=null) {
			return addressMapper.get_default(uid);
		}else {
			return null;
		}
		
	}
	
	
	
	

}

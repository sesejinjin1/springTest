package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.TestMapper;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestMapper testMapper;

	@Override
	public HashMap<String, Object> testList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		var list = testMapper.testList(map);
		System.out.println("service >>>> "+map);
		resultMap.put("asdf", "asdf");
		resultMap.put("list", list);
		System.out.println(resultMap);
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> delteList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		testMapper.testDelete(map);
		resultMap.put("result", "삭제됨?");
		return resultMap;
	}

}

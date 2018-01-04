package com.iot.test.dao;

import java.util.List;

import com.iot.test.vo.ClassInfo;

public interface ClassDAO {
	List<ClassInfo> selectClassList();
}

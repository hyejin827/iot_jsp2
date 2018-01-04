package com.iot.test.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iot.test.common.DBCon;
import com.iot.test.dao.ClassDAO;
import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public class ClassDAOImpl implements ClassDAO{

	@Override
	public List<ClassInfo> selectClassList() {
		List<ClassInfo> classList = new ArrayList<ClassInfo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBCon.getCon();
			String sql = "select * from class_info";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ClassInfo ci = new ClassInfo();
				ci.setCiDesc(rs.getString("cidesc"));
				ci.setCiName(rs.getString("ciname"));
				ci.setCiNo(rs.getInt("cino"));
				classList.add(ci);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return classList;
	}

}

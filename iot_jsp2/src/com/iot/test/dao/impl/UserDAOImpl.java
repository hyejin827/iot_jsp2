package com.iot.test.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iot.test.common.DBCon;
import com.iot.test.dao.UserDAO;
import com.iot.test.vo.UserClass;

public class UserDAOImpl implements UserDAO {

	@Override
	public ArrayList<UserClass> selectUserList() {
		return null;
	}

	@Override
	public UserClass selectUser(int uiNo) {
		return null;
	}

	@Override
	public int insertUser(UserClass uc) {
		return 0;
	}

	@Override
	public int updateUser(UserClass uc) {
		return 0;
	}

	@Override
	public int deleteUser(UserClass uc) {
		return 0;
	}

	@Override
	public UserClass selectUser(String uiId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBCon.getCon();
			String sql = "select * from user_info ui, class_info ci where ui.cino=ci.cino and ui.uiid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uiId);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserClass uc = new UserClass();
				uc.setAddress(rs.getString("address"));
				uc.setCiDesc(rs.getString("cidesc"));
				uc.setCiName(rs.getString("ciname"));
				uc.setCiNo(rs.getInt("cino"));
				uc.setUiAge(rs.getInt("uiage"));
				uc.setUiId(rs.getString("uiid"));
				uc.setUiName(rs.getString("uiname"));
				uc.setUiNo(rs.getInt("uino"));
				uc.setUiPwd(rs.getString("uipwd"));
				uc.setUiRegdate(rs.getString("uiregdate"));
				return uc;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}
}

package com.flopper.framework.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class kandycustomerinfo {

	public HashMap<String, String> getKandyCustomerInfo(String kandyusername) {

		HashMap<String, String> map = new HashMap<String, String>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = DBHelper.getConnection();
		try {

			stmt = conn
					.prepareStatement("select * from kandycustomerinfo c where c.kandyusername=? ");
			stmt.setString(1, kandyusername);

			rs = stmt.executeQuery();
			if (rs.next()) {
				map.put("kandyusername", rs.getString("kandyusername"));
				map.put("password", rs.getString("password"));
				map.put("apikey", rs.getString("apikey"));
				return map;

			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}

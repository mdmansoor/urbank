package com.flopper.framework.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class KandyUserDetail {
	List<String> kandyUserName = new ArrayList<String>();
	Map<String, String> map = new HashMap<String, String>();

	public Map<String, String> getKandyUserDetail(String username) {
		List<String> kandyuserList = new ArrayList<String>();
		kandyUserName.add("user001");
		kandyUserName.add("user002");
		kandyUserName.add("user003");
		kandyuserList = getAvailableKandyUser();
		kandyUserName.removeAll(kandyuserList);

		if (kandyUserName.size() > 0) {

			getKandyUser(kandyUserName.get(0));

			kandyLoginDetail(username);

		}

		return map;

	}

	private void kandyLoginDetail(String username) {
		PreparedStatement stmt = null;
		Connection conn = DBHelper.getConnection();
		try {

			stmt = conn
					.prepareStatement("insert into kandylogindetail  values (?,?,sysdate,null)");
			stmt.setString(1, username);
			stmt.setString(2, map.get("KANDY_USERNAME"));
			
			int rs = stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<String> getAvailableKandyUser() {

		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = DBHelper.getConnection();
		ArrayList<String> userList = new ArrayList<String>();
		try {

			stmt = conn
					.prepareStatement("select k.kandyuserid  from kandylogindetail k where k.logouttime is null");

			rs = stmt.executeQuery();
			while (rs.next()) {
				userList.add(rs.getString(1));

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

		return userList;

	}

	public void getKandyUser(String kandyUser) {

		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = DBHelper.getConnection();

		try {

			stmt = conn
					.prepareStatement("select * from KANDYCUSTOMERINFO KI where KI.KANDYUSERNAME=?");
			stmt.setString(1, kandyUser);

			rs = stmt.executeQuery();
			if (rs.next()) {
				map.put("KANDY_USERNAME", rs.getString(1));
				map.put("KANDY_PASSWORD", rs.getString(2));
				map.put("KANDY_APIKEY", rs.getString(3));

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

	}
	
	public void kandyUserLogout(String userID) {

		PreparedStatement stmt = null;
		Connection conn = DBHelper.getConnection();
		try {

			stmt = conn
					.prepareStatement("UPDATE kandylogindetail  L set l.LOGOUTTIME=SYSDATE where   L.USERID=? ");
			stmt.setString(1, userID);
			
			int rs = stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			try {
				stmt.close();
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}

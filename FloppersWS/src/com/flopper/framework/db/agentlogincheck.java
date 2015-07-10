package com.flopper.framework.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import com.flopper.framework.constant.Constants;

public class agentlogincheck {
	Map<String, String> map = new HashMap<String, String>();

	public Map<String, String> userLogin(String username, String password) {
		map.put(Constants.RESULT, Constants.UNKNOWN_ERROR);
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = DBHelper.getConnection();
		try {

			stmt = conn
					.prepareStatement("select * from agentcredential c where c.userid=? and c.password=?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			if (rs.next()) {
				map.put("SESSION_USERNAME", rs.getString(2));
				map.put("USER_ROLE", rs.getString(4));
				lastLoginDetail(username, conn);
				loginHistory(username, conn);

				map.put(Constants.RESULT, Constants.SUCCESS);
				return map;

			} else {
				map.put(Constants.RESULT, "Invalid credential");
				return map;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return map;

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

	public void lastLoginDetail(String username, Connection conn) {

		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {

			stmt = conn
					.prepareStatement("select nvl( max(loginid),0) from agentloginhistory where userid =? ");
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals("0")) {
					map.put("LOGIN_ID", rs.getString(1));
					map.put("LASTLOGINTIME", "");
					return;
				} else {
					map.put("LOGIN_ID", rs.getString(1));
				}
			}
			stmt = conn
					.prepareStatement("select  To_char(LOGINTIME,'dd/mm/yyyy hh24:Mi') from agentloginhistory where  LOGINID=? and  userid =? ");

			stmt.setString(1, map.get("LOGIN_ID"));
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			if (rs.next()) {

				map.put("LASTLOGINTIME", rs.getString(1));
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void loginHistory(String username, Connection conn) {
		PreparedStatement stmt = null;
		try {

			stmt = conn
					.prepareStatement("insert into agentloginhistory values(to_number(?)+1,?,sysdate,null)");
			stmt.setString(1, map.get("LOGIN_ID"));
			stmt.setString(2, username);
			int rs = stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void userLogout(String userID) {

		PreparedStatement stmt = null;
		Connection conn = DBHelper.getConnection();
		try {

			stmt = conn
					.prepareStatement("UPDATE agentloginhistory  L set l.LOGOUTTIME=SYSDATE  where L.LOGINID=(SELECT max(LOGINID) FROM  agentloginhistory LH  WHERE LH.USERID=? ) AND L.USERID=? ");
			stmt.setString(1, userID);
			stmt.setString(2, userID);
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

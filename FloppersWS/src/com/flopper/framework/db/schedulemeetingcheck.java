package com.flopper.framework.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class schedulemeetingcheck {
	public Map<String, String> meetingSchedule(String eventId) {
		Map<String, String> map = new HashMap<String, String>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = DBHelper.getConnection();
		try {
			stmt = conn
					.prepareStatement("select * from EVENTCREATION c where c.eventId=? and c.EVENTDATE=sysdate");
			stmt.setString(1, eventId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				

			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}			
		finally {

			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
}

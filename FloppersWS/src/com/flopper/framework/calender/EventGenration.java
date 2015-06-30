package com.flopper.framework.calender;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import com.flopper.framework.constant.Constants;
import com.flopper.framework.db.DBHelper;

public class EventGenration {

	public Map<String, String> genrateEventId(String date, String hour,
			String minute, String emailID) {
		Map<String, String> map = new HashMap<String, String>();
		map.put(Constants.RESULT, Constants.UNKNOWN_ERROR);
		String eventID;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = DBHelper.getConnection();
		try {

			stmt = conn
					.prepareStatement("select ('FB'||to_char(systimestamp,'yymmddhh')||EVENT_SEQ.nextval) EventID from dual");

			rs = stmt.executeQuery();
			if (rs.next()) {
				eventID = rs.getString(1);
				if (insertEventCreation(eventID, emailID, date, hour + minute,
						conn))
					map.put(Constants.RESULT, Constants.SUCCESS);
				map.put("EventID", eventID);
			CalenderEvent.sendAnEvent(eventID,date,hour,minute,emailID);
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
		return map;

	}

	public boolean insertEventCreation(String eventID, String emailID,
			String date, String time, Connection conn) {
		PreparedStatement stmt = null;
		try {
			String name;
			stmt = conn
					.prepareStatement("insert into eventcreation values(?,?,to_date(?,'dd/MM/yyyy'),?)");
			stmt.setString(1, eventID);
			stmt.setString(2, emailID);
			stmt.setString(3, date);
			stmt.setString(4, time);
			int rs = stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}

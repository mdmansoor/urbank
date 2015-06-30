package com.flopper.framework.calender;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.flopper.framework.constant.Constants;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;
import com.sun.corba.se.impl.orbutil.closure.Constant;

public class CalenderEvent {

	public static boolean sendAnEvent(String eventID, String date, String hour,
			String minute, String emailID) throws IOException {

		// TODO Auto-generated method stub
		Event event = new Event();
		Calendar service = null;
		Date startDate = null, endDate = null;

		event.setSummary("Flopper's Bank ");
		event.setLocation("IND");
		event.setDescription("Your Appointment with Executive is scheduled  @ "
				+ hour + ":" + minute + "IST  Event ID : " + eventID);

		ArrayList<EventAttendee> attendees = new ArrayList<EventAttendee>();
		attendees.add(new EventAttendee().setEmail(emailID));
		// ...
		event.setAttendees(attendees);

		final SimpleDateFormat dateFormat = new SimpleDateFormat(
				Constants.DATE_FORMAT);
		try {
			startDate = dateFormat.parse(date);
			endDate = dateFormat.parse(date);
			startDate.setHours(Integer.parseInt(hour));
			startDate.setMinutes(Integer.parseInt(minute));

			endDate.setHours(Integer.parseInt(hour) + 1);
			endDate.setMinutes(Integer.parseInt(minute));

			DateTime start = new DateTime(startDate);
			event.setStart(new EventDateTime().setDateTime(start));
			event.getStart().setTimeZone("Asia/Kolkata");
			DateTime end = new DateTime(endDate);
			event.setEnd(new EventDateTime().setDateTime(end));
			event.getEnd().setTimeZone("Asia/Kolkata");

			service = GoogleApiCalenderCredential.getInstance().getCalendar();
			Event createdEvent = service.events().insert("primary", event)
					.setSendNotifications(true).execute();

			System.out.println("Data is :" + createdEvent.getId());

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
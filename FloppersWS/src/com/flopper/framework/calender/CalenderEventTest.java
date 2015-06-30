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

public class CalenderEventTest {

	public static void main(String[] args) throws IOException {

		String date = "24/06/2015";
		String hour = "9";
		String minute = "00";
		// TODO Auto-generated method stub
		Event event = new Event();
		Calendar service = null;
		Date startDate = null, endDate = null;

		event.setSummary("Floppers  ");
		event.setLocation("IND");
		event.setDescription("Your Appointment with Executive is Schedulae @ "
				+ hour + ":" + minute);

		ArrayList<EventAttendee> attendees = new ArrayList<EventAttendee>();
		// attendees.add(new EventAttendee().setEmail("basha54@gmail.com"));
		attendees.add(new EventAttendee().setEmail("mmansoor@ymail.com"));
		// ...
		event.setAttendees(attendees);

		final SimpleDateFormat dateFormat = new SimpleDateFormat(
				Constants.DATE_FORMAT);
		try {
			startDate = dateFormat.parse(date);
			endDate = dateFormat.parse(date);
			startDate.setHours(Integer.parseInt(hour));
			startDate.setMinutes(Integer.parseInt(minute));

			endDate.setHours(Integer.parseInt(hour)+1);
			endDate.setMinutes(Integer.parseInt(minute));
		} catch (Exception e) {

		}

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

	}
}
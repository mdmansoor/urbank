package com.flopper.framework.calender;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.util.Collections;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.common.io.Files;

public class GoogleApiCalenderCredential {

	private static GoogleApiCalenderCredential instance = null;

	private GoogleCredential googleCredential;

	public GoogleCredential getGoogleCredential() {
		return googleCredential;
	}

	public void setGoogleCredential(GoogleCredential googleCredential) {
		this.googleCredential = googleCredential;
	}

	private Calendar calendar;

	public Calendar getCalendar() {
		return calendar;
	}

	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}

	private GoogleApiCalenderCredential() {
		super();
	}

	private static final String APPLICATION_NAME = "ServiceCalendar";

	private static final String SERVICE_ACCOUNT_EMAIL = "479092253076-umodmn47n85qravajik65go5qqffgjp0@developer.gserviceaccount.com";

	private static HttpTransport httpTransport;

	private static final JsonFactory JSON_FACTORY = JacksonFactory
			.getDefaultInstance();

	public static GoogleApiCalenderCredential getInstance() {
		if (instance == null) {
			buildInsatnce();
		}
		return instance;
	}

	private static void buildInsatnce() {
		httpTransport = new NetHttpTransport();
		try {
			if (SERVICE_ACCOUNT_EMAIL.startsWith("Enter ")) {
				System.err.println(SERVICE_ACCOUNT_EMAIL);
				System.exit(1);
			}
			URL loc = GoogleApiCalenderCredential.class
					.getResource("/Flopper-webrtc-calender-2fb2405b9df3.p12");
			String path = loc.getPath();
			File file = new File(path);
			String p12Content = Files.readFirstLine(file,
					Charset.defaultCharset());
			if (p12Content.startsWith("Please")) {
				System.err.println(p12Content);
				System.exit(1);
			}

			GoogleCredential credential;

			credential = new GoogleCredential.Builder()
					.setTransport(httpTransport)
					.setJsonFactory(JSON_FACTORY)
					.setServiceAccountId(SERVICE_ACCOUNT_EMAIL)
					.setServiceAccountScopes(
							Collections.singleton(CalendarScopes.CALENDAR))
					.setServiceAccountPrivateKeyFromP12File(file).build();

			instance = new GoogleApiCalenderCredential();

			instance.setGoogleCredential(credential);
			Calendar client = new com.google.api.services.calendar.Calendar.Builder(
					httpTransport, JSON_FACTORY,
					instance.getGoogleCredential())
					.setApplicationName(APPLICATION_NAME).build();
		instance.setCalendar(client);

		} catch (IOException e) {
			System.err.println(e.getMessage());
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

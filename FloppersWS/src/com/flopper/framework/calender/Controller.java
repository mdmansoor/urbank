package com.flopper.framework.calender;

import java.awt.Robot;
import java.util.Random;

public class Controller {
	private static final int SLEEP_TIME = 4000;
	private static final int X_POS = 400;
	private static final int Y_POS = 400;

	public static void main(String args[]) throws Exception {
		Robot robot = new Robot();
		Random random = new Random();
		while (true) {
			robot.mouseMove(random.nextInt(X_POS), random.nextInt(Y_POS));
			
			Thread.sleep(SLEEP_TIME);
		}
	}
}
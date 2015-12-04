package com.zaq.homedo;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * 控制线程量
 * @author zhangyj
 * @date Mar 28, 2012
 */
public class ThreadPool {

	private static Executor executor;
	static {
		executor = Executors.newScheduledThreadPool(100);
	}

	
	public static void execute(Runnable run) {
		executor.execute(run);
	}
}

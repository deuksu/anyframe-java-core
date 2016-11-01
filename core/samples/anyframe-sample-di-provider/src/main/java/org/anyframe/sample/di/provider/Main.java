/*
 * Copyright 2002-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.anyframe.sample.di.provider;

import org.anyframe.sample.di.provider.moviefinder.domain.Movie;
import org.anyframe.sample.di.provider.moviefinder.service.MovieFinder;
import org.anyframe.sample.di.provider.moviefinder.service.MovieService;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * JSR-330 Provider
 * 
 * [how to execute this class in maven] mvn exec:java
 * -Dexec.mainClass=org.anyframe.sample.di.provider.Main
 */
public class Main {
	protected ClassPathXmlApplicationContext context;

	/**
	 * initializing
	 */
	protected void setup() {
		String[] locations = new String[] { "classpath:spring/context-*.xml" };
		context = new ClassPathXmlApplicationContext(locations, false);
		context.refresh();
	}

	/**
	 * detroying
	 */
	protected void teardown() {
		context.close();
	}

	/**
	 * main
	 */
	public static void main(String[] args) throws Exception {
		Main main = new Main();

		// 1. initialize context
		main.setup();
		// 2. test
		main.getMovie();
		main.getMovieList();
		// 3. close context
		main.teardown();
	}

	public void getMovie() throws Exception {
		MovieService movieService = (MovieService) context
				.getBean("movieServiceImpl");
		movieService.get("MV-0001");
	}

	public void getMovieList() throws Exception {
		MovieFinder movieFinder = (MovieFinder) context
				.getBean("movieFinderImpl");
		movieFinder.getPagingList(new Movie(), 1);
	}

}

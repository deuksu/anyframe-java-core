package org.anyframe.sample.hibernate.model.bidirection.concurrency.optimistic;

// Generated 2008. 9. 1 ���� 1:00:42 by Hibernate Tools 3.2.1.GA

import java.util.HashSet;
import java.util.Set;

/**
 * Country generated by hbm2java
 */
public class Country implements java.io.Serializable {

	private int version;
	private String countryCode;
	private String countryId;
	private String countryName;
	private Set movies = new HashSet(0);

	public Country() {
	}

	public Country(String countryCode, String countryId, String countryName) {
		this.countryCode = countryCode;
		this.countryId = countryId;
		this.countryName = countryName;
	}

	public Country(String countryCode, String countryId, String countryName,
			Set movies) {
		this.countryCode = countryCode;
		this.countryId = countryId;
		this.countryName = countryName;
		this.movies = movies;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCountryId() {
		return this.countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return this.countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public Set getMovies() {
		return this.movies;
	}

	public void setMovies(Set movies) {
		this.movies = movies;
	}

	public int getVersion() {
		return version;
	}

}

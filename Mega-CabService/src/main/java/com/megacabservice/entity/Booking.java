package com.megacabservice.entity;

import java.sql.Date;
import java.sql.Time;

public class Booking {
	private int booking_id;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_address;
	private String pickup_location;
	private String drop_location;
	private Date ride_date;
	private Time ride_time;
	private int passenger_count;
	private int luggage_count;
	private String special_request;
	private String payment_type;
	private String card_number;
	private Date card_expiry;
	private String card_cvc;
	private int driver_id;
	private int cab_id;
	private String status;

	// Getters and Setters
	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getPickup_location() {
		return pickup_location;
	}

	public void setPickup_location(String pickup_location) {
		this.pickup_location = pickup_location;
	}

	public String getDrop_location() {
		return drop_location;
	}

	public void setDrop_location(String drop_location) {
		this.drop_location = drop_location;
	}

	public Date getRide_date() {
		return ride_date;
	}

	public void setRide_date(Date ride_date) {
		this.ride_date = ride_date;
	}

	public Time getRide_time() {
		return ride_time;
	}

	public void setRide_time(Time ride_time) {
		this.ride_time = ride_time;
	}

	public int getPassenger_count() {
		return passenger_count;
	}

	public void setPassenger_count(int passenger_count) {
		this.passenger_count = passenger_count;
	}

	public int getLuggage_count() {
		return luggage_count;
	}

	public void setLuggage_count(int luggage_count) {
		this.luggage_count = luggage_count;
	}

	public String getSpecial_request() {
		return special_request;
	}

	public void setSpecial_request(String special_request) {
		this.special_request = special_request;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public Date getCard_expiry() {
		return card_expiry;
	}

	public void setCard_expiry(Date card_expiry) {
		this.card_expiry = card_expiry;
	}

	public String getCard_cvc() {
		return card_cvc;
	}

	public void setCard_cvc(String card_cvc) {
		this.card_cvc = card_cvc;
	}

	public int getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}

	public int getCab_id() {
		return cab_id;
	}

	public void setCab_id(int cab_id) {
		this.cab_id = cab_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
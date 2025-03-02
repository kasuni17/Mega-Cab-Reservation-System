package com.megacabservice.entity;

public class Driver {
	private int driverId;
	private String name;
	private String email;
	private String password;
	private String licenseNumber;
	private String phoneNumber;
	private String address;
	private String status;
	private String createdAt;

	public Driver() {
	}

	public Driver(String name, String email, String password, String licenseNumber, String phoneNumber,
			String address) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.licenseNumber = licenseNumber;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}
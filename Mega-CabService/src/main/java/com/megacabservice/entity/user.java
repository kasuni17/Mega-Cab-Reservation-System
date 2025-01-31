package com.megacabservice.entity;

import java.util.Date;

public class user {

    private int user_id;
    private String name;
    private String email;
    private String phoneNumber;
    private String nic;
    private String password;
    private String address;
    private Date createdAt;  // Stores the creation date

    public user() {
        super();
        // Optionally, you can set default values here, e.g., createdAt = new Date();
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "user [user_id=" + user_id + ", name=" + name + ", email=" + email + ", phoneNumber=" + phoneNumber
                + ", nic=" + nic + ", password=" + password + ", address=" + address + ", createdAt=" + createdAt + "]";
    }
}

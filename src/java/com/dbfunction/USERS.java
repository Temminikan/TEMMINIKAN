/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbfunction;

/**
 *
 * @author user
 */
public class USERS {
      private String user_name;
    private String gender;
    private String phone;
    private String user_email;
    private String dob;
    private String state;
    private String address;
    private String password;
    private String check_in;
    private String occupants;
    private String favourite_meal;
    private String check_out;
    private String country;
    private String name;
    private String comment;

    public USERS(String user_name, String gender, String phone, String user_email, String dob, String state, String address,String country, String password, String check_in, String occupants, String favourite_meal, String check_out,String name, String comment) {
        this.user_name = user_name;
        this.gender = gender;
        this.phone = phone;
        this.user_email = user_email;
        this.dob = dob;
        this.state = state;
        this.address = address;
        this.country = country;
        this.password = password;
        this.check_in = check_in;
        this.occupants = occupants;
        this.favourite_meal = favourite_meal;
        this.check_out = check_out;
        this.name = name;
        this.comment = comment;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCheck_in() {
        return check_in;
    }

    public void setCheck_in(String check_in) {
        this.check_in = check_in;
    }

    public String getOccupants() {
        return occupants;
    }

    public void setOccupants(String occupants) {
        this.occupants = occupants;
    }

    public String getFavourite_meal() {
        return favourite_meal;
    }

    public void setFavourite_meal(String favourite_meal) {
        this.favourite_meal = favourite_meal;
    }

    public String getCheck_out() {
        return check_out;
    }

    public void setCheck_out(String check_out) {
        this.check_out = check_out;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

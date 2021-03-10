/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Chrisann Lee
 */
public class Person {

    private String id;
    private String name;
    private String email;
    private String address;
    private String contactNo;
    private String password;

    public Person() {
    }

    public Person(String id, String name, String email, String address, String contactNo, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.contactNo = contactNo;
        this.password = password;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getPassword() {
        return password;
    }

    public String toString() {
        return "ID :" + id + "\n"
                + "Name :" + name + "\n"
                + "Email :" + email + "\n"
                + "Contact Number :" + contactNo + "\n"
                + "Password :" + password + "\n";
    }

}

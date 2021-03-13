/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author zixua
 */
public class Staff extends Person {

    private String role;
    private String status;

    public Staff() {
    }

    public Staff(String id, String name, String email, String address, String contactNo, String password, String role, String status) {
        super(id, name, email, address, contactNo, password);
        this.role = role;
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return super.toString()
                + "\nRole: " + role
                + "\nStatus: " + status;
    }

}

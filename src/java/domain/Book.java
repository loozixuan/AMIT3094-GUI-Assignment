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
public class Book {

    private String id;
    private String name;
    private SubCategories subCategories;
    private String description;
    private double price;
    private int qty;
    private String status;

    //Constructor
    public Book() {

    }

    public Book(String id, String name, SubCategories subCategories, String description, double price, int qty, String status) {
        this.id = id;
        this.name = name;
        this.subCategories = subCategories;
        this.description = description;
        this.price = price;
        this.qty = qty;
        this.status = status;
    }

    //Setter
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSubCategories(SubCategories subCategories) {
        this.subCategories = subCategories;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    //Getter
    public String getName() {
        return name;
    }

    public SubCategories getSubCategories() {
        return subCategories;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getQty() {
        return qty;
    }

    public String getStatus() {
        return status;
    }

    public String toString() {
        return "ID :" + id + "\n"
                + "Name :" + name + "\n"
                + "Category ID :" + subCategories.getIdCategory() + "\n"
                + "Category Name :" + subCategories.getNameCategory() + "\n"
                + "Subcategories ID :" + subCategories.getIdSubCategories() + "\n"
                + "Subcategories Name :" + subCategories.getNameSubCategories() + "\n"
                + "Description :" + description + "\n"
                + "Price :" + price + "\n"
                + "Quantity :" + qty + "\n"
                + "Status :" + status + "\n";

    }

}

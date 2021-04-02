/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import entity.Product;
import entity.Product;

/**
 *
 * @author user
 */
public class CartItem {
    Product product;
    int quantity;

    public CartItem() {
    }

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public void increaseQuantity(int quantity){
        this.quantity+=quantity;
    }
    
    public void decreaseQuantity(){
        this.quantity--;
    }

    public double getSubtotal(){
        return this.product.getPrice() * this.quantity;
    }
    
    @Override
    public String toString() {
        return "CartItem{" + "product=" + product + ", quantity=" + quantity + '}';
    }
    
}

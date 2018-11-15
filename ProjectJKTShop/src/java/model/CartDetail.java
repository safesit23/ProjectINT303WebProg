/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author jatawatsafe
 */
public class CartDetail {
    Shoe shoe;
    int shoeSize;
    int quantity;
    int price;

    public CartDetail() {
    }
    
    public CartDetail(Shoe shoe, int shoeSize, int quantity) {
        this.shoe = shoe;
        this.shoeSize = shoeSize;
        this.quantity = quantity;
        this.price = shoe.getPrice();
    }
    
    public CartDetail(Shoe shoe, int shoeSize) {
        this(shoe,shoeSize,1);
    }
    
    public CartDetail(SizeSpecific ss) {
        this(ss.getShoe(),ss.getSizeSpecificPK().getShoesize());
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }

    public int getShoeSize() {
        return shoeSize;
    }

    public void setShoeSize(int shoeSize) {
        this.shoeSize = shoeSize;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return shoe.getPrice();
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public double getTotalPrice(){
        return this.price*this.quantity;
    }
}

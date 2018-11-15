/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author jatawatsafe
 */
public class Cart {
    private Map<String, CartDetail> cart;
    private 
    //Key = String SpecificShoe
    //Value = CartDetail(SizeSpecific ss)

    public Cart() {
        cart = new HashMap();
    }
    
    public void add(SizeSpecific ss){
        CartDetail line = cart.get(ss.getSizeSpecificPK().getSpecificShoe());
        //if don't have this shoe
        if(line==null){
            cart.put(ss.getSizeSpecificPK().getSpecificShoe(), new CartDetail(ss));
        }else{
            line.setQuantity(line.getQuantity()+1);
        }
    }
    
    public void remove(SizeSpecific ss){
        CartDetail line = cart.get(ss.getSizeSpecificPK().getSpecificShoe());
        if(line.getQuantity()==1){
            cart.remove(ss.getSizeSpecificPK().getSpecificShoe());
        }else{
            line.setQuantity(line.getQuantity()-1);
        }
    }
    
    public int getTotalQuantity(){
        int sum = 0;
        Collection<CartDetail> details = cart.values();
        for (CartDetail item : details) {
            sum+=item.getQuantity();
        }
        return sum;
    }
    
    public List<CartDetail> getCartDetails(){
        return new ArrayList(cart.values());
    }
    
    public double getTotalPrice(){
        double sum = 0;
        Collection<CartDetail> details = cart.values();
        for (CartDetail item : details) {
            sum+=item.getTotalPrice();
        }
        return sum;
    }

}
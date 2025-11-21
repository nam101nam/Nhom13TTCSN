/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items = new HashMap<>(); 

    public void addItem(CartItem item) {
        int id = item.getProductId();
        if (items.containsKey(id)) {
            CartItem existingItem = items.get(id);
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            items.put(id, item);
        }
    }

    public void removeItem(int productId) {
        items.remove(productId);
    }
    
    public Map<Integer, CartItem> getItems() { return items; }
    
    public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
}

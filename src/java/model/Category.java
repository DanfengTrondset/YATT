package model;

import java.util.HashSet;
import java.util.Set;

public class Category  implements java.io.Serializable {


     private String name;
     private String imageUrl;
     private Set products = new HashSet(0);

    public Category() {
    }

	
    public Category(String name, String imageUrl) {
        this.name = name;
        this.imageUrl = imageUrl;
    }
    public Category(String name, String imageUrl, Set products) {
       this.name = name;
       this.imageUrl = imageUrl;
       this.products = products;
    }
   
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getImageUrl() {
        return this.imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public Set getProducts() {
        return this.products;
    }
    
    public void setProducts(Set products) {
        this.products = products;
    }




}



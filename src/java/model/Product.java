package model;
// Generated 23-Jan-2019 19:21:32 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Product generated by hbm2java
 */
public class Product  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String description;
     private String imageUrl;
     private Set categories = new HashSet(0);
     private Set carts = new HashSet(0);

    public Product() {
    }

	
    public Product(String name) {
        this.name = name;
    }
    public Product(String name, String description, String imageUrl, Set categories, Set carts) {
       this.name = name;
       this.description = description;
       this.imageUrl = imageUrl;
       this.categories = categories;
       this.carts = carts;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImageUrl() {
        return this.imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public Set getCategories() {
        return this.categories;
    }
    
    public void setCategories(Set categories) {
        this.categories = categories;
    }
    public Set getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set carts) {
        this.carts = carts;
    }




}



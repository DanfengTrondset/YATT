package model;
// Generated 23-Jan-2019 19:21:32 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cart generated by hbm2java
 */
public class Cart  implements java.io.Serializable {


     private Integer id;
     private Set products = new HashSet(0);

    public Cart() {
    }

    public Cart(Set products) {
       this.products = products;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Set getProducts() {
        return this.products;
    }
    
    public void setProducts(Set products) {
        this.products = products;
    }




}


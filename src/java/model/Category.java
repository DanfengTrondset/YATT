package model;

import java.util.HashSet;
import java.util.Set;

public class Category implements java.io.Serializable {

    private Integer id;
    private String name;
    private String imageUrl;
    private Set products = new HashSet(0);

    public Category() {
    }

    public Category(String name) {
        this.name = name;
    }

    public Category(String name, String imageUrl, Set products) {
        this.name = name;
        this.products = products;
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
